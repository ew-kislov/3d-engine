# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.19.4/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.19.4/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/evgeniykislov/Documents/msu/mashgraph/task2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/evgeniykislov/Documents/msu/mashgraph/task2

# Include any dependencies generated for this target.
include external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/depend.make

# Include the progress variables for this target.
include external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/progress.make

# Include the compile flags for this target's objects.
include external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/flags.make

external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/tearing.c.o: external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/flags.make
external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/tearing.c.o: external/glfw-3.1.2/tests/tearing.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/evgeniykislov/Documents/msu/mashgraph/task2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/tearing.c.o"
	cd /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tearing.dir/tearing.c.o -c /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests/tearing.c

external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/tearing.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tearing.dir/tearing.c.i"
	cd /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests/tearing.c > CMakeFiles/tearing.dir/tearing.c.i

external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/tearing.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tearing.dir/tearing.c.s"
	cd /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests/tearing.c -o CMakeFiles/tearing.dir/tearing.c.s

external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/__/deps/getopt.c.o: external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/flags.make
external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/__/deps/getopt.c.o: external/glfw-3.1.2/deps/getopt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/evgeniykislov/Documents/msu/mashgraph/task2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/__/deps/getopt.c.o"
	cd /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tearing.dir/__/deps/getopt.c.o -c /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/deps/getopt.c

external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/__/deps/getopt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tearing.dir/__/deps/getopt.c.i"
	cd /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/deps/getopt.c > CMakeFiles/tearing.dir/__/deps/getopt.c.i

external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/__/deps/getopt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tearing.dir/__/deps/getopt.c.s"
	cd /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/deps/getopt.c -o CMakeFiles/tearing.dir/__/deps/getopt.c.s

# Object files for target tearing
tearing_OBJECTS = \
"CMakeFiles/tearing.dir/tearing.c.o" \
"CMakeFiles/tearing.dir/__/deps/getopt.c.o"

# External object files for target tearing
tearing_EXTERNAL_OBJECTS =

external/glfw-3.1.2/tests/tearing.app/Contents/MacOS/tearing: external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/tearing.c.o
external/glfw-3.1.2/tests/tearing.app/Contents/MacOS/tearing: external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/__/deps/getopt.c.o
external/glfw-3.1.2/tests/tearing.app/Contents/MacOS/tearing: external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/build.make
external/glfw-3.1.2/tests/tearing.app/Contents/MacOS/tearing: external/glfw-3.1.2/src/libglfw3.a
external/glfw-3.1.2/tests/tearing.app/Contents/MacOS/tearing: external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/evgeniykislov/Documents/msu/mashgraph/task2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable tearing.app/Contents/MacOS/tearing"
	cd /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tearing.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/build: external/glfw-3.1.2/tests/tearing.app/Contents/MacOS/tearing

.PHONY : external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/build

external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/clean:
	cd /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests && $(CMAKE_COMMAND) -P CMakeFiles/tearing.dir/cmake_clean.cmake
.PHONY : external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/clean

external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/depend:
	cd /Users/evgeniykislov/Documents/msu/mashgraph/task2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/evgeniykislov/Documents/msu/mashgraph/task2 /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests /Users/evgeniykislov/Documents/msu/mashgraph/task2 /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests /Users/evgeniykislov/Documents/msu/mashgraph/task2/external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : external/glfw-3.1.2/tests/CMakeFiles/tearing.dir/depend

