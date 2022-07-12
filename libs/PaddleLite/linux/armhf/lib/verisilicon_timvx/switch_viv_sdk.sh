#!/bin/bash
DRIVER_VERSION=6_4_4_3
HARDWARE_MODEL=a311d

set -e

if [ -n "$1" ]; then
  DRIVER_VERSION=$1
fi

if [ -n "$2" ]; then
  HARDWARE_MODEL=$2
fi

ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/libCLC.so libCLC.so
ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/libGAL.so libGAL.so
ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/libOpenVX.so libOpenVX.so
ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/libOpenVXU.so libOpenVXU.so
ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/libVSC.so libVSC.so
ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/libArchModelSw.so libArchModelSw.so
ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/libNNArchPerf.so libNNArchPerf.so
ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/libOpenCL.so libOpenCL.so
ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/libtim-vx.so libtim-vx.so
ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/${HARDWARE_MODEL}/libNNGPUBinary.so libNNGPUBinary.so
ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/${HARDWARE_MODEL}/libNNVXCBinary.so libNNVXCBinary.so
ln -f -s ./viv_sdk_${DRIVER_VERSION}/lib/${HARDWARE_MODEL}/libOvx12VXCBinary.so libOvx12VXCBinary.so

