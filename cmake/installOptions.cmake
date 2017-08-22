#-----------------------------------------------------------------------------
# Export targets
SET(_targets aruco)
if(BUILD_UTILS)
  list(APPEND _targets aruco_print_dictionary)
  list(APPEND _targets aruco_print_marker)
  list(APPEND _targets aruco_simple)
  list(APPEND _targets aruco_test)
  list(APPEND _targets aruco_tracker)

  list(APPEND _targets aruco_calibration)
  list(APPEND _targets aruco_calibration_fromimages)

  list(APPEND _targets aruco_create_markermap)
  list(APPEND _targets aruco_simple_markermap)
  list(APPEND _targets aruco_test_markermap)
  list(APPEND _targets aruco_markermap_pix2meters)
endif()
if(GL_FOUND AND BUILD_GLSAMPLES)
  list(APPEND _targets aruco_test_gl)
  list(APPEND _targets aruco_test_markermap_gl)
endif()

export(TARGETS ${_targets}
  FILE "${PROJECT_BINARY_DIR}/arucoTargets.cmake"
  )

# Make build config file
SET(_targetFileLocation "${PROJECT_BINARY_DIR}/arucoTargets.cmake")
configure_file(cmake/arucoConfig.cmake.in arucoConfig.cmake IMMEDIATE @ONLY)

# Make install config file
SET(_targetFileLocation "\${CMAKE_CURRENT_LIST_DIR}/arucoTargets.cmake")
configure_file(cmake/arucoConfig.cmake.in arucoConfig_install.cmake IMMEDIATE @ONLY)
install(FILES "${PROJECT_BINARY_DIR}/arucoConfig_install.cmake" 
  DESTINATION lib/cmake/aruco
  RENAME arucoConfig.cmake)
install(EXPORT arucoConfig
  DESTINATION lib/cmake/aruco
  FILE arucoTargets.cmake
  )

#-----------------------------------------------------------------------------
# pkg-config
configure_file(${PROJECT_SOURCE_DIR}/cmake/aruco.pc.in aruco.pc @ONLY)
configure_file(${PROJECT_SOURCE_DIR}/cmake/aruco-uninstalled.pc.in aruco-uninstalled.pc @ONLY)
install(FILES "${PROJECT_BINARY_DIR}/aruco-uninstalled.pc" "${PROJECT_BINARY_DIR}/aruco.pc" DESTINATION lib/pkgconfig)

install(FILES "${PROJECT_SOURCE_DIR}/utils_calibration/aruco_calibration_board_a4.pdf"   "${PROJECT_SOURCE_DIR}/utils_calibration/aruco_calibration_board_a4.yml" DESTINATION share/aruco/utils_calibration)
