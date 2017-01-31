# pkg-config
configure_file(${PROJECT_SOURCE_DIR}/cmake/aruco.pc.in aruco.pc @ONLY)
configure_file(${PROJECT_SOURCE_DIR}/cmake/aruco-uninstalled.pc.in aruco-uninstalled.pc @ONLY)
install(FILES "${PROJECT_BINARY_DIR}/aruco-uninstalled.pc" "${PROJECT_BINARY_DIR}/aruco.pc" DESTINATION lib/pkgconfig)
