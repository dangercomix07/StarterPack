# TMS570LC43.cmake

# Target platform for TMS570LC43 LaunchPad (Cortex-R5, VFPv3D16)
set(FPRIME_PLATFORM TMS570LC43)

# -----------------------
# Compiler + Linker Flags
# -----------------------

# Base architecture flags (from your Makefile)
set(FPRIME_C_FLAGS
    "-mv7R5"
    "--code_state=32"
    "--float_support=VFPv3D16"
    "--enum_type=packed"
    "--abi=eabi"
    "--display_error_number"
    "--diag_warning=225"
    "--diag_wrap=off"
    "-g"
)

# Linker flags (also from your Makefile)
set(FPRIME_LINK_FLAGS
    "-z"
    "--rom_model"
    "--be32"
    "--heap_size=0x800"
    "--stack_size=0x800"
    "--warn_sections"
)

# Optional: XML link info (optional in F′ builds, used by CCS)
# set(FPRIME_LINK_FLAGS ${FPRIME_LINK_FLAGS} "--xml_link_info=${CMAKE_BINARY_DIR}/linkInfo.xml")

# -----------------------
# HALCoGen Support
# -----------------------

# Replace these paths with your actual locations
set(HAL_SRC_DIR "${CMAKE_SOURCE_DIR}/tms570-hal/source")
set(HAL_INC_DIR "${CMAKE_SOURCE_DIR}/tms570-hal/include")

# Append HAL includes and sources
include_directories(${HAL_INC_DIR})
file(GLOB HAL_SOURCES "${HAL_SRC_DIR}/*.c")
file(GLOB HAL_ASMS "${HAL_SRC_DIR}/*.asm")

# Add to global source list
set(FPRIME_ADDITIONAL_SOURCES ${HAL_SOURCES} ${HAL_ASMS})

# -----------------------
# Linker Script
# -----------------------

# Tell F´ to use your custom linker script
set(FPRIME_LINKER_SCRIPT "${HAL_SRC_DIR}/HL_sys_link.cmd")

# -----------------------
# Print for Debug
# -----------------------
message(STATUS "[Platform] FPRIME_PLATFORM = ${FPRIME_PLATFORM}")
message(STATUS "[Platform] Using HAL Sources from ${HAL_SRC_DIR}")
message(STATUS "[Platform] Linker Script: ${FPRIME_LINKER_SCRIPT}")
