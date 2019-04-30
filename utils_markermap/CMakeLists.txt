add_executable(aruco_create_markermap aruco_create_markermap.cpp)
add_executable(aruco_simple_markermap aruco_simple_markermap.cpp)
add_executable(aruco_test_markermap aruco_test_markermap.cpp pcdwriter.cpp)
add_executable(aruco_markermap_pix2meters aruco_markermap_pix2meters.cpp)

target_link_libraries(aruco_create_markermap        aruco opencv_calib3d opencv_imgcodecs)
target_link_libraries(aruco_simple_markermap        aruco opencv_calib3d opencv_imgcodecs opencv_highgui)
target_link_libraries(aruco_test_markermap          aruco opencv_calib3d)
target_link_libraries(aruco_markermap_pix2meters    aruco opencv_calib3d)
target_link_libraries(aruco_test_markermap          aruco opencv_calib3d opencv_highgui)
 
install(TARGETS   aruco_create_markermap  aruco_markermap_pix2meters     aruco_simple_markermap aruco_test_markermap    RUNTIME DESTINATION bin)
