# ----------------------------------------------------------------------------
# display status message for important variables
# ----------------------------------------------------------------------------
message( STATUS )
message( STATUS "-------------------------------------------------------------------------------" )
message( STATUS "General configuration for ${PROJECT_NAME} ${PROJECT_VERSION}")
message( STATUS "-------------------------------------------------------------------------------" )
message( STATUS )
message( STATUS "Compiler:"                   "${CMAKE_COMPILER}"   "${CMAKE_CXX_COMPILER}")
message( STATUS "C++ flags (Release):       ${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE}")
message( STATUS "C++ flags (Debug):         ${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG}")
message( STATUS "CMAKE_CXX_FLAGS:         ${CMAKE_CXX_FLAGS}")
message( STATUS "CMAKE_BINARY_DIR:         ${CMAKE_BINARY_DIR}")

message( STATUS )
message( STATUS "CMAKE_SYSTEM_PROCESSOR = ${CMAKE_SYSTEM_PROCESSOR}" )
message( STATUS "BUILD_SHARED_LIBS = ${BUILD_SHARED_LIBS}" )
message( STATUS "CMAKE_INSTALL_PREFIX = ${CMAKE_INSTALL_PREFIX}" )
message( STATUS "CMAKE_BUILD_TYPE = ${CMAKE_BUILD_TYPE}" )

message( STATUS )
message( STATUS "---------------------------     Documentation     -----------------------------" )
message( STATUS )
message( STATUS "INSTALL_DOC = ${INSTALL_DOC}" )
message( STATUS "USE_LATEX = ${USE_LATEX}" )
message( STATUS "USE_DOT = ${USE_DOT}" )
message( STATUS "USE_CHM = ${USE_CHM}" )
message( STATUS )
message( STATUS "FOUND OPENGL=${GL_FOUND}    LIBS=${OPENGL_LIBS}")
message( STATUS "OpenCV_LIB_DIR=${OpenCV_LIB_DIR} OpenCV_INCLUDE_DIRS=${OpenCV_INCLUDE_DIRS}")
message( STATUS "CMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}")
message( STATUS "USE_OWN_EIGEN3=${USE_OWN_EIGEN3} EIGEN3_INCLUDE_DIR=${EIGEN3_INCLUDE_DIR}")


message( STATUS )
message( STATUS )
message( STATUS "Change a value with: cmake -D<Variable>=<Value>" )
message( STATUS )
