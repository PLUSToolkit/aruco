add_executable(aruco_calibration aruco_calibration.cpp )
add_executable(aruco_calibration_fromimages aruco_calibration_fromimages.cpp )

target_link_libraries(aruco_calibration             aruco opencv_calib3d opencv_highgui)
target_link_libraries(aruco_calibration_fromimages  aruco opencv_calib3d opencv_highgui)

install(TARGETS      aruco_calibration aruco_calibration_fromimages RUNTIME DESTINATION bin)
