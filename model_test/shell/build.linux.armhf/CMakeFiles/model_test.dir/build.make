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
CMAKE_SOURCE_DIR = /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell/build.linux.armhf

# Include any dependencies generated for this target.
include CMakeFiles/model_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/model_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/model_test.dir/flags.make

CMakeFiles/model_test.dir/model_test.cc.o: CMakeFiles/model_test.dir/flags.make
CMakeFiles/model_test.dir/model_test.cc.o: ../model_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell/build.linux.armhf/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/model_test.dir/model_test.cc.o"
	/home/zhangjf/project/vs680/Synaptics_Git_Ext_Linux/syna-release/toolchain/aarch32/gcc-arm-linux-gnueabi-8.3/bin/arm-linux-gnueabihf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/model_test.dir/model_test.cc.o -c /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell/model_test.cc

CMakeFiles/model_test.dir/model_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/model_test.dir/model_test.cc.i"
	/home/zhangjf/project/vs680/Synaptics_Git_Ext_Linux/syna-release/toolchain/aarch32/gcc-arm-linux-gnueabi-8.3/bin/arm-linux-gnueabihf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell/model_test.cc > CMakeFiles/model_test.dir/model_test.cc.i

CMakeFiles/model_test.dir/model_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/model_test.dir/model_test.cc.s"
	/home/zhangjf/project/vs680/Synaptics_Git_Ext_Linux/syna-release/toolchain/aarch32/gcc-arm-linux-gnueabi-8.3/bin/arm-linux-gnueabihf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell/model_test.cc -o CMakeFiles/model_test.dir/model_test.cc.s

# Object files for target model_test
model_test_OBJECTS = \
"CMakeFiles/model_test.dir/model_test.cc.o"

# External object files for target model_test
model_test_EXTERNAL_OBJECTS =

model_test: CMakeFiles/model_test.dir/model_test.cc.o
model_test: CMakeFiles/model_test.dir/build.make
model_test: /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/libs/PaddleLite/linux/armhf/lib/libpaddle_full_api_shared.so
model_test: CMakeFiles/model_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell/build.linux.armhf/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable model_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/model_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/model_test.dir/build: model_test

.PHONY : CMakeFiles/model_test.dir/build

CMakeFiles/model_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/model_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/model_test.dir/clean

CMakeFiles/model_test.dir/depend:
	cd /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell/build.linux.armhf && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell/build.linux.armhf /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell/build.linux.armhf /home/zhangjf/project/vs680/paddle-lite-demo/PaddleLite-generic-demo/model_test/shell/build.linux.armhf/CMakeFiles/model_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/model_test.dir/depend

