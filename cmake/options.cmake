#------------------------------------------------------
# Build type
#------------------------------------------------------

if(NOT CMAKE_BUILD_TYPE )
   set( CMAKE_BUILD_TYPE "Debug" )
endif()

#------------------------------------------------------
# Lib Names and Dirs
#------------------------------------------------------

if(WIN32)
    # Postfix of DLLs:
    # Postfix of DLLs:
    set(PROJECT_DLLVERSION "${PROJECT_VERSION_MAJOR}${PROJECT_VERSION_MINOR}${PROJECT_VERSION_PATCH}")
    if(NOT CMAKE_RUNTIME_OUTPUT_DIRECTORY)
      set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin CACHE PATH "Directory for dlls and binaries")
    endif()
    if(NOT CMAKE_LIBRARY_OUTPUT_DIRECTORY)
      set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin CACHE PATH "Directory for link libraries")
    endif()
    if(NOT CMAKE_ARCHIVE_OUTPUT_DIRECTORY)
      set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib CACHE PATH "Directory for archives")
    endif()
else()
    # Postfix of so's:
    set(PROJECT_DLLVERSION)
    if(NOT CMAKE_RUNTIME_OUTPUT_DIRECTORY)
      set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin CACHE PATH "Directory for shared libraries and binaries")
    endif()
    if(NOT CMAKE_LIBRARY_OUTPUT_DIRECTORY)
      set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib CACHE PATH "Directory for static libraries")
    endif()
    if(NOT CMAKE_ARCHIVE_OUTPUT_DIRECTORY)
      set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/share CACHE PATH "Directory for archives")
    endif()
endif()

option(USE_OWN_EIGEN3	"Set to OFF to use a standard eigen3 version" ON)
option(USE_DOUBLE_PRECISION_PNP "Set Double/float precision for posetracker" ON)
option(BUILD_UTILS	"Set to OFF to not compile utils " ON)
option(BUILD_TESTS	"Set to OFF to not compile utils " OFF)
option(BUILD_SHARED_LIBS 	"Set to OFF to build static libraries" ON)
option(BUILD_GLSAMPLES 	"Set to OFF to build static libraries" OFF)

# ----------------------------------------------------------------------------
#   PROJECT CONFIGURATION
#   force some variables that could be defined in the command line to be written to cache
# ----------------------------------------------------------------------------
option(INSTALL_DOC 	"Set to ON to build/install Documentation" OFF)
if (INSTALL_DOC)
    find_package(Doxygen REQUIRED)
    message( STATUS "INSTALL_DOC:         ${INSTALL_DOC} ")
    include("${PROJECT_SOURCE_DIR}/cmake/generateDoc.cmake")
    generate_documentation(${PROJECT_SOURCE_DIR}/cmake/dox.in)
endif()

# ----------------------------------------------------------------------------
#   Uninstall target, for "make uninstall"
# ----------------------------------------------------------------------------
configure_file(cmake/cmake_uninstall.cmake.in cmake_uninstall.cmake IMMEDIATE @ONLY)
add_custom_target(uninstall "${CMAKE_COMMAND}" -P "${PROJECT_BINARY_DIR}/cmake_uninstall.cmake")
