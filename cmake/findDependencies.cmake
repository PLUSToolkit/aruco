# ----------------------------------------------------------------------------
#   Find Dependencies
# ----------------------------------------------------------------------------

FIND_PACKAGE(OpenCV 	REQUIRED )
set (ARUCO_REQUIRED_LIBRARIES ${OpenCV_LIBS})
INCLUDE_DIRECTORIES(${OpenCV_INCLUDE_DIRS})

if(OpenCV_VERSION VERSION_LESS "3.0")#Opencv 2 requires the ad-hoc levmarq method for tracking since solvePnp from intrinsicguess does not work
    IF(NOT USE_OWN_EIGEN3)
        find_package( Eigen3 REQUIRED )
    ELSE()
        set(EIGEN3_INCLUDE_DIR "3rdparty/eigen3")
    ENDIF()
    include_directories( ${EIGEN3_INCLUDE_DIR} )

    IF(USE_DOUBLE_PRECISION_PNP)
        ADD_DEFINITIONS(-DDOUBLE_PRECISION_PNP)
    ENDIF()
ENDIF()



# Check if we have OpenCV 3




IF(EXISTS ${GLUT_PATH})
    INCLUDE_DIRECTORIES(${GLUT_PATH}/include)
    SET(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} ${GLUT_PATH}/lib)
ENDIF()

##LOOK FOR OPENGL AND GLUT
#FIND OPENGL LIBRARY. In Android, there is no need since it is included
IF(NOT ANDROID_CREATION)
if(BUILD_GLSAMPLES)
  find_package(OpenGL)
  find_package(GLUT)#standard package
  MESSAGE(STATUS "GLUT_FOUND=${GLUT_FOUND} OPENGL_gl_LIBRARY=${OPENGL_gl_LIBRARY} GLUT_HEADER=${GLUT_HEADER}")
endif()
  IF(NOT GLUT_FOUND) #else, freeglut
    FIND_LIBRARY(GLUT_glut_LIBRARY     NAMES freeglut)
    MESSAGE(STATUS "GLUT_glut_LIBRARY=${GLUT_glut_LIBRARY}")
  ENDIF()
  IF ( (NOT GLUT_glut_LIBRARY AND NOT GLUT_FOUND) OR NOT OPENGL_gl_LIBRARY)
    set(GL_FOUND "NO")
  ELSE()
    set(GL_FOUND "YES")
    set (OPENGL_LIBS  ${OPENGL_gl_LIBRARY} ${OPENGL_glu_LIBRARY} ${GLUT_glut_LIBRARY})
  ENDIF()
ENDIF()
#Omp


if(WIN32)
 
ELSE()
find_package(OpenMP  )
if (OPENMP_FOUND)
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
add_definitions(-DUSE_OMP)
endif()
ENDIF()
