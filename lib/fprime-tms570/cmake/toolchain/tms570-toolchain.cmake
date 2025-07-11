####
# Template toolchain.cmake.template: 
#
# This file acts as a template for the cmake toolchains. These toolchain files
# specify what tools to use when performing the build as part of CMake. This
# file can be used to quickly set one up.
#
# Follow all the steps in this template to create a toolchain file. Ensure
# to remove the template-failsafe (step 1) and fill in all <SOMETHING> tags.
#
# **Note:** this file should follow the standard CMake toolchain format. See:
# https://cmake.org/cmake/help/v3.12/manual/cmake-toolchains.7.html
#
# **Note:** If the user desires to set compile flags, or F prime specific build options, a platform
#           file should be constructed. See: [platform.md](../platform/platform.md)
#
# ### Filling In CMake Toolchain by Example ###
#
# CMake Toolchain files, at the most basic, define the system name and C and C++ compilers. In
# addition, a find path can be set to search for other utilities. This example will walk through
# setting these values using the appropriate variables. These can be specified using the following
# CMake setting flags:
#
# ```
# CMAKE_SYSTEM_NAME "RaspberryPI"
# # specify the cross compiler
# set(CMAKE_C_COMPILER "/opt/rpi/bin/arm-linux-gnueabihf-gcc")
# set(CMAKE_CXX_COMPILER "/opt/rpi/bin/arm-linux-gnueabihf-g++")
# # where is the target environment
# set(CMAKE_FIND_ROOT_PATH  "/opt/rpi")
# ```
#
# **Note:** if copying the template, delete the message with FATAL_ERROR line. This is a fail-safe
#           to prevent a raw-copy from being treated as a valid toolchain file. 
####

## STEP 2: Specify the target system's name. i.e. raspberry-pi-3
# --- System info ---
set(CMAKE_SYSTEM_NAME Generic)                # Bare-metal target
set(CMAKE_SYSTEM_PROCESSOR cortex-r5)         # ARM R5 core of TMS570LC43
set(CMAKE_CROSSCOMPILING 1)
set(FPRIME_PLATFORM TMS570)                   # F´ platform ID

# --- Toolchain location ---
set(TI_BASE "${CMAKE_CURRENT_LIST_DIR}/../../ti-cgt-arm_20.2.7.LTS")

# STEP 3: Specify the path to C and CXX cross compilers
# --- Compilers ---
set(CMAKE_C_COMPILER "${TI_BASE}/bin/armcl")
set(CMAKE_CXX_COMPILER "${TI_BASE}/bin/armcl")  # armcl handles both C and C++

# Tell CMake not to try building host executables
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# STEP 4: Specify paths to root of toolchain package, for searching for
#         libraries, executables, etc.
set(CMAKE_FIND_ROOT_PATH "${TI_BASE}")

# DO NOT EDIT: F prime searches the host for programs, not the cross
# compile toolchain
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# DO NOT EDIT: F prime searches for libs, includes, and packages in the
# toolchain when cross-compiling.
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Fix for missing standard C and C++ headers
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -I${TI_BASE}/include")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -I${TI_BASE}/include -I${TI_BASE}/include/libcxx")

# --- Debug Info ---
message(STATUS "[TMS570 Toolchain] TI_BASE: ${TI_BASE}")
message(STATUS "[TMS570 Toolchain] C Compiler: ${CMAKE_C_COMPILER}")