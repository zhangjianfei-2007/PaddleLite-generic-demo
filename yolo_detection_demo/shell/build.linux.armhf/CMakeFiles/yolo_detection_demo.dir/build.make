# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell/build.linux.armhf

# Include any dependencies generated for this target.
include CMakeFiles/yolo_detection_demo.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/yolo_detection_demo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/yolo_detection_demo.dir/flags.make

CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.o: CMakeFiles/yolo_detection_demo.dir/flags.make
CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.o: ../yolo_detection_demo.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell/build.linux.armhf/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.o"
	/home/zhangjf/project/vs680/Synaptics_Git_Ext_Linux/syna-release/toolchain/aarch32/gcc-arm-linux-gnueabi-8.3/bin/arm-linux-gnueabihf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.o -c /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell/yolo_detection_demo.cc

CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.i"
	/home/zhangjf/project/vs680/Synaptics_Git_Ext_Linux/syna-release/toolchain/aarch32/gcc-arm-linux-gnueabi-8.3/bin/arm-linux-gnueabihf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell/yolo_detection_demo.cc > CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.i

CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.s"
	/home/zhangjf/project/vs680/Synaptics_Git_Ext_Linux/syna-release/toolchain/aarch32/gcc-arm-linux-gnueabi-8.3/bin/arm-linux-gnueabihf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell/yolo_detection_demo.cc -o CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.s

# Object files for target yolo_detection_demo
yolo_detection_demo_OBJECTS = \
"CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.o"

# External object files for target yolo_detection_demo
yolo_detection_demo_EXTERNAL_OBJECTS =

yolo_detection_demo: CMakeFiles/yolo_detection_demo.dir/yolo_detection_demo.cc.o
yolo_detection_demo: CMakeFiles/yolo_detection_demo.dir/build.make
yolo_detection_demo: /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/libs/PaddleLite/linux/armhf/lib/libpaddle_full_api_shared.so
yolo_detection_demo: CMakeFiles/yolo_detection_demo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell/build.linux.armhf/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable yolo_detection_demo"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/yolo_detection_demo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/yolo_detection_demo.dir/build: yolo_detection_demo

.PHONY : CMakeFiles/yolo_detection_demo.dir/build

CMakeFiles/yolo_detection_demo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/yolo_detection_demo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/yolo_detection_demo.dir/clean

CMakeFiles/yolo_detection_demo.dir/depend:
	cd /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell/build.linux.armhf && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell/build.linux.armhf /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell/build.linux.armhf /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/yolo_detection_demo/shell/build.linux.armhf/CMakeFiles/yolo_detection_demo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/yolo_detection_demo.dir/depend

