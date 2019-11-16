### pcl_test


##### dependencies
```
opencv 
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )

eigen 
include_directories( "/usr/include/eigen3/" )
```


##### build
```
mkdir build
cd build
cmake ..
make -j12
./joinmap
```
