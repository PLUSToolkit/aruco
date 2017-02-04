set(sources
    ar_omp.cpp
    cameraparameters.cpp
    checkrectcontour.cpp
    cvdrawingutils.cpp
    dictionary.cpp
    ippe.cpp
    marker.cpp
    markerdetector.cpp
    markerlabeler.cpp
    markermap.cpp
    posetracker.cpp
    markerlabelers/dictionary_based.cpp
    #markerlabelers/svmmarkers.cpp
)

set(headers
    ar_omp.h
    cameraparameters.h
    checkrectcontour.h
    cvdrawingutils.h
    dictionary.h
    ippe.h
    marker.h
    markerdetector.h
    markerlabeler.h
    markermap.h
    posetracker.h
    markerlabelers/dictionary_based.h
    #markerlabelers/svmmarkers.h
)

add_library(aruco ${sources} ${headers})
set_target_properties(aruco PROPERTIES 				# create *nix style library versions + symbolic links
    DEFINE_SYMBOL ARUCO_DSO_EXPORTS
	VERSION ${PROJECT_VERSION}
	SOVERSION ${PROJECT_SOVERSION}
	CLEAN_DIRECT_OUTPUT 1 					        # allow creating static and shared libs without conflicts
    OUTPUT_NAME "aruco${PROJECT_DLLVERSION}" 	    # avoid conflicts between library and binary target names
)

target_link_libraries(aruco PUBLIC opencv_core)

install(TARGETS aruco
	RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
	LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
	ARCHIVE DESTINATION lib COMPONENT main)			# Install the dll.a file in lib directory

install(FILES ${headers}
    DESTINATION include/aruco
	COMPONENT main)

