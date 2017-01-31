# ----------------------------------------------------------------------------
#   Basic Configuration
# ----------------------------------------------------------------------------
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
PROJECT(aruco)
set(PROJECT_VERSION "2.0.19")
string(REGEX MATCHALL "[0-9]" PROJECT_VERSION_PARTS "${PROJECT_VERSION}")
list(GET PROJECT_VERSION_PARTS 0 PROJECT_VERSION_MAJOR)
list(GET PROJECT_VERSION_PARTS 1 PROJECT_VERSION_MINOR)
list(GET PROJECT_VERSION_PARTS 2 PROJECT_VERSION_PATCH)
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
