# ----------------------------------------------------------------------------
#   Basic Configuration
# ----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.0)
project(aruco 
    VERSION "2.0.19"
    LANGUAGES CXX
)
set(PROJECT_SOVERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}")

include(cmake/options.cmake)
include(cmake/findDependencies.cmake)
include(cmake/compilerOptions.cmake)


#------------------------------------------------
# DIRS
#------------------------------------------------
ADD_SUBDIRECTORY(src)
IF(BUILD_UTILS)
  ADD_SUBDIRECTORY(utils)
  ADD_SUBDIRECTORY(utils_markermap)
  ADD_SUBDIRECTORY(utils_calibration)
#  ADD_SUBDIRECTORY(utils_svm)
ENDIF()
IF(GL_FOUND AND BUILD_GLSAMPLES)
  ADD_SUBDIRECTORY(utils_gl)
ENDIF()
IF(BUILD_TESTS)
  ADD_SUBDIRECTORY(tests)
ENDIF()

include(cmake/printInfo.cmake)

# pkg-config
configure_file(aruco.pc.in aruco.pc @ONLY)
configure_file(aruco-uninstalled.pc.in aruco-uninstalled.pc @ONLY)
install(FILES "${PROJECT_BINARY_DIR}/aruco-uninstalled.pc" "${PROJECT_BINARY_DIR}/aruco.pc" DESTINATION lib/pkgconfig)
