#------------------------------------------------------
# Build type
#------------------------------------------------------

IF(NOT CMAKE_BUILD_TYPE )
   SET( CMAKE_BUILD_TYPE "Debug" )
ENDIF()

#------------------------------------------------------
# Lib Names and Dirs
#------------------------------------------------------

if(WIN32)
    # Postfix of DLLs:
    # Postfix of DLLs:
    SET(PROJECT_DLLVERSION "${PROJECT_VERSION_MAJOR}${PROJECT_VERSION_MINOR}${PROJECT_VERSION_PATCH}")
    SET(RUNTIME_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin CACHE PATH "Directory for dlls and binaries")
    SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin CACHE PATH "Directory for binaries")
    SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin CACHE PATH "Directory for dlls")

else()
    # Postfix of so's:
    set(PROJECT_DLLVERSION)
#    SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_INSTALL_PREFIX}/lib/cmake/ /usr/lib/cmake)
endif()

OPTION(USE_OWN_EIGEN3	"Set to OFF to use a standard eigen3 version" ON)
OPTION(USE_DOUBLE_PRECISION_PNP "Set Double/float precision for posetracker" ON)
OPTION(BUILD_UTILS	"Set to OFF to not compile utils " ON)
OPTION(BUILD_TESTS	"Set to OFF to not compile utils " OFF)
OPTION(BUILD_SHARED_LIBS 	"Set to OFF to build static libraries" ON)
OPTION(BUILD_GLSAMPLES 	"Set to OFF to build static libraries" OFF)

# ----------------------------------------------------------------------------
#   PROJECT CONFIGURATION
#   force some variables that could be defined in the command line to be written to cache
# ----------------------------------------------------------------------------
OPTION(INSTALL_DOC 	"Set to ON to build/install Documentation" OFF)
IF (INSTALL_DOC)
    FIND_PACKAGE(Doxygen REQUIRED)
    MESSAGE( STATUS "INSTALL_DOC:         ${INSTALL_DOC} ")
    INCLUDE("${PROJECT_SOURCE_DIR}/generateDoc.cmake")
    GENERATE_DOCUMENTATION(${PROJECT_SOURCE_DIR}/dox.in)
ENDIF()

# ----------------------------------------------------------------------------
#   Uninstall target, for "make uninstall"
# ----------------------------------------------------------------------------
CONFIGURE_FILE("${PROJECT_SOURCE_DIR}/cmake/cmake_uninstall.cmake.in" "${PROJECT_BINARY_DIR}/cmake_uninstall.cmake" IMMEDIATE @ONLY)
ADD_CUSTOM_TARGET(uninstall "${CMAKE_COMMAND}" -P "${PROJECT_BINARY_DIR}/cmake_uninstall.cmake")

# ----------------------------------------------------------------------------
# create configuration file from .in file (If you use windows take care with paths)
# ----------------------------------------------------------------------------

CONFIGURE_FILE("${PROJECT_SOURCE_DIR}/config.cmake.in" "${PROJECT_BINARY_DIR}/Find${PROJECT_NAME}.cmake")
INSTALL(FILES "${PROJECT_BINARY_DIR}/Find${PROJECT_NAME}.cmake" DESTINATION lib/cmake/ )
