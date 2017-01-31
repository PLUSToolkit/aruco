include_directories(.)

file(GLOB hdrs "*.h*")
file(GLOB srcs "*.c*")

set(detectors_src   markerlabelers/dictionary_based.cpp   )# markerlabelers/svmmarkers.cpp )
set(detectors_hdr   markerlabelers/dictionary_based.h     )# markerlabelers/svmmarkers.h)

set(hdrs ${hdrs} ${detectors_hdr})
set(srcs ${srcs} ${detectors_src})

add_library(aruco ${srcs} ${hdrs})
include_directories(${CMAKE_CURRENT_BINARY_DIR} )
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

install(FILES ${hdrs}
    DESTINATION include/aruco
	COMPONENT main)

