#!/bin/bash
#MODEL_NAME=conv_add_relu_dwconv_add_relu_224_int8_per_layer
#MODEL_NAME=conv_bn_relu_224_int8_per_channel
#MODEL_NAME=conv_bn_relu_dwconv_bn_relu_224_int8_per_channel
#MODEL_NAME=conv_add_relu_dwconv_add_relu_x4_224_int8_per_channel
#MODEL_NAME=conv_add_relu_dwconv_add_relu_x27_pool2d_224_int8_per_channel
#MODEL_NAME=conv_add_relu_dwconv_add_relu_x27_pool2d_mul_add_224_int8_per_channel
#MODEL_NAME=conv_add_relu_dwconv_add_relu_conv_add_relu_dwconv_add_relu_224_int8_per_channel
#MODEL_NAME=conv_bn_relu_224_fp32
#MODEL_NAME=conv_bn_relu_dwconv_bn_relu_224_fp32
#MODEL_NAME=conv_bn_relu_dwconv_bn_relu_x27_224_fp32
#MODEL_NAME=conv_bn_relu_dwconv_bn_relu_x27_pool2d_224_fp32
#MODEL_NAME=conv_bn_relu_dwconv_bn_relu_x27_pool2d_mul_add_224_fp32
#MODEL_NAME=conv_bn_relu_pool2d_224_fp32
#MODEL_NAME=conv_bn_relu_pool2d_res2a_224_fp32
#MODEL_NAME=conv_bn_relu_pool2d_res2a_res2b_224_fp32
#MODEL_NAME=conv_bn_relu_pool2d_res2a_res2b_res2c_224_fp32
#INPUT_SHAPE="1,3,224,224"
#INPUT_TYPE="float32"
#OUTPUT_TYPE="float32"
#MODEL_TYPE=0

#MODEL_NAME=conv_add_144_192_int8_per_layer
#MODEL_NAME=conv_add_scale_144_192_int8_per_layer
#MODEL_NAME=conv_add_scale_relu6_144_192_int8_per_layer
#MODEL_NAME=conv_add_scale_relu6_mul_144_192_int8_per_layer
#MODEL_NAME=conv_add_scale_sigmoid_144_192_int8_per_layer
#MODEL_NAME=conv_add_scale_sigmoid_relu_144_192_int8_per_layer
#MODEL_NAME=conv_add_scale_sigmoid_relu_mul_144_192_int8_per_layer
#INPUT_SHAPE="1,3,192,144"
#INPUT_TYPE="float32"
#OUTPUT_TYPE="float32"
#MODEL_TYPE=0

#MODEL_NAME=eltwise_mul_broadcast_per_layer
#INPUT_SHAPE="1,3,384,384"
#INPUT_TYPE="float32"
#OUTPUT_TYPE="float32"
#MODEL_TYPE=0

#MODEL_NAME=dwconv_ic_128_groups_128_oc_256_per_layer
#INPUT_SHAPE="1,3,320,320"
#INPUT_TYPE="float32"
#OUTPUT_TYPE="float32"
#MODEL_TYPE=0

if [ -n "$1" ]; then
  MODEL_NAME=$1
fi

if [ ! -d "../assets/models/$MODEL_NAME" ];then
  MODEL_URL="http://paddlelite-demo.bj.bcebos.com/devices/generic/models/${MODEL_NAME}.tar.gz"
  echo "Model $MODEL_NAME not found! Try to download it from $MODEL_URL ..."
  curl $MODEL_URL -o -| tar -xz -C ../assets/models
  if [[ $? -ne 0 ]]; then
    echo "Model $MODEL_NAME download failed!"
    exit 1
  fi
fi

if [ -n "$2" ]; then
  MODEL_TYPE=$2
fi

if [ -n "$3" ]; then
  INPUT_SHAPE=$3
fi

if [ -n "$4" ]; then
  INPUT_TYPE=$4
fi

if [ -n "$5" ]; then
  OUTPUT_TYPE=$5
fi

SUBGRAPH_PARTITION_CONFIG_FILE=subgraph_partition_config_file.txt
WORK_SPACE="~/test"

# For TARGET_OS=android, TARGET_ABI should be arm64-v8a or armeabi-v7a.
# For TARGET_OS=linux, TARGET_ABI should be arm64, armhf or amd64.
# Kirin810/820/985/990/9000/9000E: TARGET_OS=android and TARGET_ABI=arm64-v8a
# MT8168/8175, Kirin810/820/985/990/9000/9000E: TARGET_OS=android and TARGET_ABI=armeabi-v7a
# RK1808EVB, TB-RK1808S0, Kunpeng-920+Ascend310: TARGET_OS=linux and TARGET_ABI=arm64
# RK1806EVB, RV1109/1126 EVB: TARGET_OS=linux and TARGET_ABI=armhf 
# Intel-x86+Ascend310: TARGET_OS=linux and TARGET_ABI=amd64
# Intel-x86+CambriconMLU: TARGET_OS=linux and TARGET_ABI=amd64
TARGET_OS=linux
if [ -n "$6" ]; then
  TARGET_OS=$6
fi

if [ "$TARGET_OS" == "android" ]; then
  WORK_SPACE=/data/local/tmp/test
fi

TARGET_ABI=arm64
if [ -n "$7" ]; then
  TARGET_ABI=$7
fi

# RK1808EVB, TB-RK1808S0, RK1806EVB, RV1109/1126 EVB: NNADAPTER_DEVICE_NAMES=rockchip_npu
# MT8168/8175: NNADAPTER_DEVICE_NAMES=mediatek_apu
# Kirin810/820/985/990/9000/9000E: NNADAPTER_DEVICE_NAMES=huawei_kirin_npu
# Ascend310: NNADAPTER_DEVICE_NAMES=huawei_ascend_npu
# CambriconMLU: NNADAPTER_DEVICE_NAMES=cambricon_mlu
# CPU only: NNADAPTER_DEVICE_NAMES=cpu
NNADAPTER_DEVICE_NAMES="cpu"
if [ -n "$8" ]; then
  NNADAPTER_DEVICE_NAMES="$8"
fi
NNADAPTER_DEVICE_NAMES_LIST=(${NNADAPTER_DEVICE_NAMES//,/ })
NNADAPTER_DEVICE_NAMES_TEXT=${NNADAPTER_DEVICE_NAMES//,/_}

SSH_DEVICE_IP_ADDR="192.168.180.8"
if [ -n "$9" ]; then
  SSH_DEVICE_IP_ADDR="$9"
fi

SSH_DEVICE_SSH_PORT="22"
if [ -n "${10}" ]; then
  SSH_DEVICE_SSH_PORT="${10}"
fi

SSH_DEVICE_USR_ID="toybrick"
if [ -n "${11}" ]; then
  SSH_DEVICE_USR_ID="${11}"
fi

SSH_DEVICE_USR_PWD="toybrick"
if [ -n "${12}" ]; then
  SSH_DEVICE_USR_PWD="${12}"
fi

NNADAPTER_CONTEXT_PROPERTIES="null"
if [ -n "${13}" ]; then
  NNADAPTER_CONTEXT_PROPERTIES="${13}"
fi

NNADAPTER_MODEL_CACHE_DIR="null"
#NNADAPTER_MODEL_CACHE_DIR="$WORK_SPACE"
if [ -n "${14}" ]; then
  NNADAPTER_MODEL_CACHE_DIR="${14}"
fi

NNADAPTER_MODEL_CACHE_TOKEN="null"
if [ -n "${15}" ]; then
  NNADAPTER_MODEL_CACHE_TOKEN="${15}"
fi

NNADAPTER_SUBGRAPH_PARTITION_CONFIG_PATH="null"
if [ -n "$SUBGRAPH_PARTITION_CONFIG_FILE" ]; then
  NNADAPTER_SUBGRAPH_PARTITION_CONFIG_PATH="../assets/models/$MODEL_NAME/$SUBGRAPH_PARTITION_CONFIG_FILE"
fi

EXPORT_ENVIRONMENT_VARIABLES="export GLOG_v=5; export SUBGRAPH_ONLINE_MODE=true"
if [[ "$NNADAPTER_DEVICE_NAMES" =~ "rockchip_npu" ]]; then
  EXPORT_ENVIRONMENT_VARIABLES="$EXPORT_ENVIRONMENT_VARIABLES; export RKNPU_LOGLEVEL=5; export RKNN_LOG_LEVEL=5; ulimit -c unlimited"
  sshpass -p $SSH_DEVICE_USR_PWD ssh -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -p $SSH_DEVICE_SSH_PORT $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR "echo userspace > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor"
  sshpass -p $SSH_DEVICE_USR_PWD ssh -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -p $SSH_DEVICE_SSH_PORT $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR "echo $(cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq) > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed"
fi

if [[ "$NNADAPTER_DEVICE_NAMES" =~ "amlogic_npu" ]]; then
  sshpass -p $SSH_DEVICE_USR_PWD ssh -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -p $SSH_DEVICE_SSH_PORT $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR "echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor"
fi

if [[ "$NNADAPTER_DEVICE_NAMES" =~ "imagination_nna" ]]; then
  sshpass -p $SSH_DEVICE_USR_PWD ssh -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -p $SSH_DEVICE_SSH_PORT $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR "echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor"
  sshpass -p $SSH_DEVICE_USR_PWD ssh -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -p $SSH_DEVICE_SSH_PORT $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR "echo performance > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor"
fi

EXPORT_ENVIRONMENT_VARIABLES="$EXPORT_ENVIRONMENT_VARIABLES; export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:.:./cpu"
for NNADAPTER_DEVICE_NAME in ${NNADAPTER_DEVICE_NAMES_LIST[@]}
do
  EXPORT_ENVIRONMENT_VARIABLES="$EXPORT_ENVIRONMENT_VARIABLES:./$NNADAPTER_DEVICE_NAME"
done
if [[ "$NNADAPTER_DEVICE_NAMES" =~ "huawei_ascend_npu" ]]; then
  HUAWEI_ASCEND_TOOLKIT_HOME="/usr/local/Ascend/ascend-toolkit/latest"
  if [ "$TARGET_OS" == "linux" ]; then
    if [[ "$TARGET_ABI" != "arm64" && "$TARGET_ABI" != "amd64" ]]; then
      echo "Unknown OS $TARGET_OS, only supports 'arm64' or 'amd64' for Huawei Ascend NPU."
      exit -1
    fi
  else
    echo "Unknown OS $TARGET_OS, only supports 'linux' for Huawei Ascend NPU."
    exit -1
  fi
  NNADAPTER_CONTEXT_PROPERTIES="HUAWEI_ASCEND_NPU_SELECTED_DEVICE_IDS=0"
  EXPORT_ENVIRONMENT_VARIABLES="$EXPORT_ENVIRONMENT_VARIABLES:/usr/local/Ascend/driver/lib64/driver:/usr/local/Ascend/driver/lib64:/usr/local/Ascend/driver/lib64/stub:$HUAWEI_ASCEND_TOOLKIT_HOME/acllib/lib64:$HUAWEI_ASCEND_TOOLKIT_HOME/atc/lib64:$HUAWEI_ASCEND_TOOLKIT_HOME/opp/op_proto/built-in; export PYTHONPATH=$PYTHONPATH:$HUAWEI_ASCEND_TOOLKIT_HOME/fwkacllib/python/site-packages:$HUAWEI_ASCEND_TOOLKIT_HOME/acllib/python/site-packages:$HUAWEI_ASCEND_TOOLKIT_HOME/toolkit/python/site-packages:$HUAWEI_ASCEND_TOOLKIT_HOME/atc/python/site-packages:$HUAWEI_ASCEND_TOOLKIT_HOME/pyACL/python/site-packages/acl; export PATH=\$PATH:$HUAWEI_ASCEND_TOOLKIT_HOME/atc/ccec_compiler/bin:${HUAWEI_ASCEND_TOOLKIT_HOME}/acllib/bin:$HUAWEI_ASCEND_TOOLKIT_HOME/atc/bin; export ASCEND_AICPU_PATH=$HUAWEI_ASCEND_TOOLKIT_HOME; export ASCEND_OPP_PATH=$HUAWEI_ASCEND_TOOLKIT_HOME/opp; export TOOLCHAIN_HOME=$HUAWEI_ASCEND_TOOLKIT_HOME/toolkit; export ASCEND_SLOG_PRINT_TO_STDOUT=1; export ASCEND_GLOBAL_LOG_LEVEL=3"
fi

if [[ "$NNADAPTER_DEVICE_NAMES" =~ "kunlunxin_xtcl" ]]; then
  EXPORT_ENVIRONMENT_VARIABLES="$EXPORT_ENVIRONMENT_VARIABLES; export XTCL_AUTO_ALLOC_L3=1; export XTCL_CONV_USE_FP16=1; export XTCL_QUANTIZE_WEIGHT=1; export XTCL_L3_SIZE=16777216"
fi

if [[ "$NNADAPTER_DEVICE_NAMES" =~ "cambricon_mlu" ]]; then
  EXPORT_ENVIRONMENT_VARIABLES="$EXPORT_ENVIRONMENT_VARIABLES; export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/neuware/lib64"
fi

if [[ "$NNADAPTER_DEVICE_NAMES" =~ "intel_openvino" ]]; then
  NNADAPTER_CONTEXT_PROPERTIES="INTEL_OPENVINO_SELECT_DEVICE_NAMES=CPU"
fi

BUILD_DIR=build.${TARGET_OS}.${TARGET_ABI}

set -e
sshpass -p $SSH_DEVICE_USR_PWD ssh -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -p $SSH_DEVICE_SSH_PORT $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR "rm -r $WORK_SPACE"
sshpass -p $SSH_DEVICE_USR_PWD ssh -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -p $SSH_DEVICE_SSH_PORT $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR "mkdir -p $WORK_SPACE"
sshpass -p $SSH_DEVICE_USR_PWD scp -v -r -o ConnectTimeout=60 -o StrictHostKeyChecking=no -P $SSH_DEVICE_SSH_PORT ../../libs/PaddleLite/$TARGET_OS/$TARGET_ABI/lib/libpaddle_*.so $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR:$WORK_SPACE
for NNADAPTER_DEVICE_NAME in ${NNADAPTER_DEVICE_NAMES_LIST[@]}
do
  sshpass -p $SSH_DEVICE_USR_PWD scp -v -r -o ConnectTimeout=60 -o StrictHostKeyChecking=no -P $SSH_DEVICE_SSH_PORT ../../libs/PaddleLite/$TARGET_OS/$TARGET_ABI/lib/$NNADAPTER_DEVICE_NAME/* $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR:$WORK_SPACE
done
sshpass -p $SSH_DEVICE_USR_PWD scp -v -r -o ConnectTimeout=60 -o StrictHostKeyChecking=no -P $SSH_DEVICE_SSH_PORT ../../libs/PaddleLite/$TARGET_OS/$TARGET_ABI/lib/cpu/* $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR:$WORK_SPACE
sshpass -p $SSH_DEVICE_USR_PWD scp -v -r -o ConnectTimeout=60 -o StrictHostKeyChecking=no -P $SSH_DEVICE_SSH_PORT ../assets/models/$MODEL_NAME $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR:$WORK_SPACE
set +e
sshpass -p $SSH_DEVICE_USR_PWD scp -v -r -o ConnectTimeout=60 -o StrictHostKeyChecking=no -P $SSH_DEVICE_SSH_PORT ../assets/models/${MODEL_NAME}.nb $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR:$WORK_SPACE
sshpass -p $SSH_DEVICE_USR_PWD scp -v -r -o ConnectTimeout=60 -o StrictHostKeyChecking=no -P $SSH_DEVICE_SSH_PORT ../assets/models/*.nnc $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR:$WORK_SPACE
set -e
sshpass -p $SSH_DEVICE_USR_PWD scp -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -P $SSH_DEVICE_SSH_PORT $BUILD_DIR/model_test $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR:$WORK_SPACE
sshpass -p $SSH_DEVICE_USR_PWD ssh -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -p $SSH_DEVICE_SSH_PORT $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR "cd $WORK_SPACE; $EXPORT_ENVIRONMENT_VARIABLES; ./model_test $MODEL_NAME $MODEL_TYPE $INPUT_SHAPE $INPUT_TYPE $OUTPUT_TYPE $NNADAPTER_DEVICE_NAMES \"$NNADAPTER_CONTEXT_PROPERTIES\" $NNADAPTER_MODEL_CACHE_DIR $NNADAPTER_MODEL_CACHE_TOKEN $NNADAPTER_SUBGRAPH_PARTITION_CONFIG_PATH"
#sshpass -p $SSH_DEVICE_USR_PWD ssh -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -p $SSH_DEVICE_SSH_PORT $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR "cd $WORK_SPACE; $EXPORT_ENVIRONMENT_VARIABLES; ./model_test $MODEL_NAME $MODEL_TYPE $INPUT_SHAPE $INPUT_TYPE $OUTPUT_TYPE $NNADAPTER_DEVICE_NAMES \"$NNADAPTER_CONTEXT_PROPERTIES\" $NNADAPTER_MODEL_CACHE_DIR $NNADAPTER_MODEL_CACHE_TOKEN $NNADAPTER_SUBGRAPH_PARTITION_CONFIG_PATH >${NNADAPTER_DEVICE_NAMES_TEXT}.log 2>&1"
#sshpass -p $SSH_DEVICE_USR_PWD scp -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -P $SSH_DEVICE_SSH_PORT $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR:$WORK_SPACE/${NNADAPTER_DEVICE_NAMES_TEXT}.log .
sshpass -p $SSH_DEVICE_USR_PWD scp -v -o ConnectTimeout=60 -o StrictHostKeyChecking=no -P $SSH_DEVICE_SSH_PORT $SSH_DEVICE_USR_ID@$SSH_DEVICE_IP_ADDR:$WORK_SPACE/${MODEL_NAME}.nb ../assets/models/
