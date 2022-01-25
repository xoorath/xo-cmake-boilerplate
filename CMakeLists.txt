cmake_minimum_required (VERSION 3.8)
project(ProjectName VERSION 1.0.0
            DESCRIPTION "Project using a boilerplate"
            LANGUAGES CXX)

################################################ C++

set(CMAKE_CXX_STANDARD 20)

################################################ Project file setup

#set(CMAKE_SUPPRESS_REGENERATION true)
set(LIBRARY_OUTPUT_PATH "${CMAKE_BINARY_DIR}")
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}")

################################################ Configurations

set(CMAKE_CONFIGURATION_TYPES "Test;Debug;Profile;Release" CACHE STRING "" FORCE)

# Define Test
set(CMAKE_CXX_FLAGS_TEST ${CMAKE_CXX_FLAGS_DEBUG} CACHE STRING "Flags used by the C++ compiler during test builds." FORCE)
set(CMAKE_C_FLAGS_TEST ${CMAKE_C_FLAGS_DEBUG} CACHE STRING "Flags used by the C compiler during test builds." FORCE)
set(CMAKE_EXE_LINKER_FLAGS_TEST ${CMAKE_EXE_LINKER_FLAGS_DEBUG} CACHE STRING "Flags used for linking binaries during test builds." FORCE)
set(CMAKE_SHARED_LINKER_FLAGS_TEST ${CMAKE_SHARED_LINKER_FLAGS_DEBUG} CACHE STRING "Flags used by the shared libraries linker during test builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_TEST CMAKE_C_FLAGS_TEST CMAKE_EXE_LINKER_FLAGS_TEST CMAKE_SHARED_LINKER_FLAGS_TEST)

# Define Profile
set(CMAKE_CXX_FLAGS_PROFILE ${CMAKE_CXX_FLAGS_RELEASE} CACHE STRING "Flags used by the C++ compiler during profile builds." FORCE)
set(CMAKE_C_FLAGS_PROFILE ${CMAKE_C_FLAGS_RELEASE} CACHE STRING "Flags used by the C compiler during profile builds." FORCE)
set(CMAKE_EXE_LINKER_FLAGS_PROFILE ${CMAKE_EXE_LINKER_FLAGS_RELEASE} CACHE STRING "Flags used for linking binaries during profile builds." FORCE)
set(CMAKE_SHARED_LINKER_FLAGS_PROFILE ${CMAKE_SHARED_LINKER_FLAGS_RELEASE} CACHE STRING "Flags used by the shared libraries linker during profile builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_PROFILE CMAKE_C_FLAGS_PROFILE CMAKE_EXE_LINKER_FLAGS_PROFILE CMAKE_SHARED_LINKER_FLAGS_PROFILE)

set(CMAKE_BUILD_TYPE "${CMAKE_BUILD_TYPE}" CACHE STRING "Choose the type of build, options are: Test Debug Release Profile." FORCE)

################################################ Projects

add_subdirectory(ThirdParty/stb_image)

add_subdirectory(ProjectName/DynamicLibName)
add_subdirectory(ProjectName/ExecutableName)

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ExecutableName)

################################################ Defines

# Todo

# if (WIN32)
# WIN32_LEAN_AND_MEAN
# NOMINMAX
# endif() 