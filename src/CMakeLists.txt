include(FortranCInterface)
FortranCInterface_VERIFY(CXX)
FortranCInterface_HEADER(
    fc_mangle.h
    MACRO_NAMESPACE "FC_"
    SYMBOLS GESS 
)

# EXAMPLE PROGRAM 1
add_executable(F2C_test MAIN_GESS.c)  # add_executable(<binary_name> <Source files>)

target_include_directories(F2C_test
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
)

target_link_libraries(F2C_test
    PUBLIC
    port3
    gfortran
    quadmath
    m
)

# EXAMPLE PROGRAM 2
add_executable(svd_test svd_test.c)  # add_executable(<binary_name> <Source files>)

target_include_directories(svd_test
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
)

target_link_libraries(svd_test
    PUBLIC
    port3
    gfortran
    quadmath
    m
)

# EXAMPLE PROGRAM 3
add_executable(eig_test eig_test.c)  # add_executable(<binary_name> <Source files>)

target_include_directories(eig_test
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
)

target_link_libraries(eig_test
    PUBLIC
    port3
    gfortran
    quadmath
    m
)

