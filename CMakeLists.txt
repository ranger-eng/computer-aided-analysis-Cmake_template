cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(EECE5200 LANGUAGES Fortran C CXX)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/modules)

include_directories(AFTER ${CMAKE_SOURCE_DIR}/include)

add_subdirectory(include)
add_subdirectory(modules)
add_subdirectory(src)


