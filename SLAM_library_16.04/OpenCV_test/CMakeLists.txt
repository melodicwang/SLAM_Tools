CMAKE_MINIMUM_REQUIRED( VERSION 3.0 )

SET( CMAKE_CXX_COMPILER "g++" )
SET( CMAKE_BUILD_TYPE "-std=c++11" )
SET( CMAKE_BUILD_TYPE "Debug" )

SET( EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR} )

find_package( OpenCV 2.4.13 REQUIRED )
include_directories( ${OpenCV_DIRS} )

ADD_EXECUTABLE( show photoshow.cpp )
target_link_libraries( show ${OpenCV_LIBS} )