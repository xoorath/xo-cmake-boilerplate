cmake_minimum_required (VERSION 3.8)
project(ProjectName VERSION 1.0.0
            DESCRIPTION "Project using a boilerplate"
            LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_SUPPRESS_REGENERATION true)
set(LIBRARY_OUTPUT_PATH "${CMAKE_BINARY_DIR}")
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}")

set(CMAKE_CONFIGURATION_TYPES "Debug;Profile;Release" CACHE STRING "" FORCE)

set(CMAKE_CXX_FLAGS_PROFILE ${CMAKE_CXX_FLAGS_RELEASE} CACHE STRING "Flags used by the C++ compiler during profile builds." FORCE)
set(CMAKE_C_FLAGS_PROFILE ${CMAKE_C_FLAGS_RELEASE} CACHE STRING "Flags used by the C compiler during profile builds." FORCE)
set(CMAKE_EXE_LINKER_FLAGS_PROFILE ${CMAKE_EXE_LINKER_FLAGS_RELEASE} CACHE STRING "Flags used for linking binaries during profile builds." FORCE)
set(CMAKE_SHARED_LINKER_FLAGS_PROFILE ${CMAKE_SHARED_LINKER_FLAGS_RELEASE} CACHE STRING "Flags used by the shared libraries linker during profile builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_PROFILE CMAKE_C_FLAGS_PROFILE CMAKE_EXE_LINKER_FLAGS_PROFILE CMAKE_SHARED_LINKER_FLAGS_PROFILE)
set(CMAKE_BUILD_TYPE "${CMAKE_BUILD_TYPE}" CACHE STRING "Choose the type of build, options are: Debug Release Profile." FORCE)

set(COMPILE_DEFINITIONS_DEBUG DEBUG PROFILE_ENABLED)
set(COMPILE_DEFINITIONS_PROFILE NDEBUG PROFILE_ENABLED)
set(COMPILE_DEFINITIONS_RELEASE NDEBUG)

add_subdirectory(ThirdParty/stb_image)

add_subdirectory(ProjectName/DynamicLibName)
add_subdirectory(ProjectName/ExecutableName)