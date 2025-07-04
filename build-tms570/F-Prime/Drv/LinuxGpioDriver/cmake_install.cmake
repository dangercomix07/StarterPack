# Install script for directory: /home/ameya/fprimesandbox/StarterPack/lib/fprime/Drv/LinuxGpioDriver

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
<<<<<<< HEAD
  set(CMAKE_INSTALL_PREFIX "/home/ameya/fprimesandbox/StarterPack/build-artifacts")
=======
  set(CMAKE_INSTALL_PREFIX "/usr/local")
>>>>>>> 7a3564c8caf3a77cf1bb6d9611ac07702ad74012
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

