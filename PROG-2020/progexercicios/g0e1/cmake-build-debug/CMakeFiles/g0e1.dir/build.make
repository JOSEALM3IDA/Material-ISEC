# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2019.3.4\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2019.3.4\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\josec\CLionProjects\progexercicios\g0e1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\josec\CLionProjects\progexercicios\g0e1\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/g0e1.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/g0e1.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/g0e1.dir/flags.make

CMakeFiles/g0e1.dir/main.c.obj: CMakeFiles/g0e1.dir/flags.make
CMakeFiles/g0e1.dir/main.c.obj: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\josec\CLionProjects\progexercicios\g0e1\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/g0e1.dir/main.c.obj"
	C:\MinGW\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\g0e1.dir\main.c.obj   -c C:\Users\josec\CLionProjects\progexercicios\g0e1\main.c

CMakeFiles/g0e1.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/g0e1.dir/main.c.i"
	C:\MinGW\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\josec\CLionProjects\progexercicios\g0e1\main.c > CMakeFiles\g0e1.dir\main.c.i

CMakeFiles/g0e1.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/g0e1.dir/main.c.s"
	C:\MinGW\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\josec\CLionProjects\progexercicios\g0e1\main.c -o CMakeFiles\g0e1.dir\main.c.s

# Object files for target g0e1
g0e1_OBJECTS = \
"CMakeFiles/g0e1.dir/main.c.obj"

# External object files for target g0e1
g0e1_EXTERNAL_OBJECTS =

g0e1.exe: CMakeFiles/g0e1.dir/main.c.obj
g0e1.exe: CMakeFiles/g0e1.dir/build.make
g0e1.exe: CMakeFiles/g0e1.dir/linklibs.rsp
g0e1.exe: CMakeFiles/g0e1.dir/objects1.rsp
g0e1.exe: CMakeFiles/g0e1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\josec\CLionProjects\progexercicios\g0e1\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable g0e1.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\g0e1.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/g0e1.dir/build: g0e1.exe

.PHONY : CMakeFiles/g0e1.dir/build

CMakeFiles/g0e1.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\g0e1.dir\cmake_clean.cmake
.PHONY : CMakeFiles/g0e1.dir/clean

CMakeFiles/g0e1.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\josec\CLionProjects\progexercicios\g0e1 C:\Users\josec\CLionProjects\progexercicios\g0e1 C:\Users\josec\CLionProjects\progexercicios\g0e1\cmake-build-debug C:\Users\josec\CLionProjects\progexercicios\g0e1\cmake-build-debug C:\Users\josec\CLionProjects\progexercicios\g0e1\cmake-build-debug\CMakeFiles\g0e1.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/g0e1.dir/depend

