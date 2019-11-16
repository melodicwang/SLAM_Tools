# CMakeLists.txt

### Eigen
```
不需要find_package( Eigen3 3.3.4 REQUIRED )
不需要target_link_libraries

include_directories( "/usr/include/eigen3" )
ADD_EXECUTABLE( king king.c )
```

### Sophus
```
find_package( Sophus REQUIRED )
include_directories( ${Sophus_INCLUDE_DIRS} )

ADD_EXECUTABLE( king king.c )
target_link_libraries( useSophus ${Sophus_LIBRARIES} )
```

### OpenCV
```
find_package( OpenCV 3.3.1 REQUIRED )
if(NOT OpenCV_FOUND)
    find_package(OpenCV 2.4.3 QUIET)
    if(NOT OpenCV_FOUND)
        message(FATAL_ERROR "OpenCV > 2.4.3 not found.")
    endif()
endif()

include_directories( ${OpenCV_INCLUDE_DIRS} )

ADD_EXECUTABLE( king king.c )
target_link_libraries( king ${OpenCV_LIBS}

#message(WARNING "OpenCV_VERSION: ${OpenCV_VERSION}")    
```

### g2o
```
list( APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules )
set( G2O_ROOT /home/z2/mcode/git/ORB_SLAM2/Thirdparty/g2o )
find_package( G2O REQUIRED )

ADD_EXECUTABLE( king king.c )
target_link_libraries( ${PROJECT_NAME} ${G2O_LIBS} )
```

### PCL
```
find_package( PCL REQUIRED COMPONENTS common io )
include_directories( ${PCL_INCLUDE_DIRS} )
include_directories( "/usr/include/pcl-1.7/pcl" )
add_definitions( ${PCL_DEFINITIONS} )

ADD_EXECUTABLE( king king.c )
target_link_libraries( king ${PCL_LIBRARIES} )
```

### Pangolin
```
find_package( Pangolin REQUIRED )
include_directories( ${Pangolin_INCLUDE_DIRS} )

ADD_EXECUTABLE( king king.c )
target_link_libraries( pangolin_test ${Pangolin_LIBRARIES} )
```

### CSparse
```
find_package( CSparse REQUIRED )
include_directories( ${PROJECT_NAME} ${CSPARSE_INCLUDE_DIR} )
```


## 根目录下的CMake文件
```
cmake_minimum_required( VERSION 3.0 )

项目名 不能出现空格
project( king )

set( CMAKE_CXX_COMPILER "g++" )
set( CMAKE_BUILD_TYPE "Debug" )
set( CMAKE_CXX_FLAGS "-std=c++11 -O3" )

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
set(LIBRARY_OUTPUT_PATH    ${PROJECT_SOURCE_DIR}/lib)

include_directories( ${PROJECT_SOURCE_DIR}/include )
link_directories(    ${PROJECT_SOURCE_DIR}/lib )

add_subdirectory( ${PROJECT_SOURCE_DIR}/src ) 
```
