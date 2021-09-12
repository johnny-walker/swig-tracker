cmake_minimum_required(VERSION 3.0)

cmake_policy(SET CMP0074 NEW)
cmake_policy(SET CMP0078 NEW)
cmake_policy(SET CMP0086 NEW)

project(PyLib)

find_package(OpenCV-SWIG REQUIRED)
find_package(SWIG REQUIRED COMPONENTS python)
find_package(Boost REQUIRED)
find_package(OpenCV REQUIRED core)
find_package(Python REQUIRED COMPONENTS Interpreter Development)

include(UseSWIG)

set_property(SOURCE py_lib.i PROPERTY CPLUSPLUS ON)
swig_add_library(py_lib LANGUAGE python SOURCES py_lib.i py_lib.hpp py_lib.cpp)
set_property(
  TARGET py_lib
  PROPERTY SWIG_INCLUDE_DIRECTORIES
    ${OpenCV-SWIG_INCLUDE_DIRS}
    ${OpenCV_INCLUDE_DIRS}
)

target_include_directories(py_lib
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${Python_INCLUDE_DIRS}
    ${OpenCV_INCLUDE_DIRS}
    ${Boost_INCLUDE_DIRS}
)

target_link_libraries(py_lib
  ${OpenCV_LIBRARIES}
  ${Python_LIBRARIES}
)
