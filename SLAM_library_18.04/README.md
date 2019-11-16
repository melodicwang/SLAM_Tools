## [SLAM_library_18.04](#slam_library) 
[1. Eigen](#1-eigen)  
[2. opencv](#2-opencv)  
[3. glog](#3-glog)  
[4. gflags](#4-gflags)  
[5. Ceres-1.14.0](#5-ceres-1140)  
[6. Sophus](#6-sophus---httpgithubcomstrasdatsophus)  
[7. Pangolin](#7-pangolin)  
[8. g2o](#8-g2o)  
[9. PCL](#9-pcl)  
[10. Octomap & octovis](#10-octomap--octovis)  


### 1. Eigen
**install**  
```
sudo apt-get install libeigen3-dev
```
**check version**  
```
pkg-config --cflags libeigen3-dev
```  
**remove**  
```
sudo apt-get remove libeigen3-dev
```  

### 2. opencv

**check**  
```
pkg-config --modversion opencv
```


### 3. glog
**Required Dependencies**
```
sudo apt-get install autoconf automake libtool
```

**install**
```
git clone https://github.com/google/glog
./autogen.sh
./configure
make -j12
sudo make install
```

### 4. gflags

**install**
```
git clone https://github.com/gflags/gflags
mkdir build
cd build/
cmake ..
make -j12
sudo make install
```

## 5. Ceres-1.14.0

https://github.com/ceres-solver/ceres-solver

**Required Dependencies(非共享库)**
```
sudo apt-get install liblapack-dev libsuitesparse-dev libcxsparse3 libgflags-dev libgoogle-glog-dev libgtest-dev
```

**install**
```
git clone https://github.com/ceres-solver/ceres-solver.git
cd ceres
mkdir build
cd build/
cmake ..
make -j12
make test	// 可选
sudo make install
```

## 6. Sophus   (http://github.com/strasdat/Sophus)

**install**
```
git clone http://github.com/strasdat/Sophus.git
cd Sophus/
mkdir build
cd build/
cmake ..
make -j12
[无需安装]
```

## 7. Pangolin
[Pangolin](https://github.com/stevenlovegrove/Pangolin)  
**Required Dependencies**
```
sudo apt install libgl1-mesa-dev libglew-dev
```

**install**
```
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build
cd build/
cmake ..
cmake --build .
```

## 8. g2o
**Required Dependencies**
```
sudo apt-get install libqt4-dev qt4-qmake libqglviewer-dev libsuitesparse-dev libcxsparse3.1.4 libcholmod-dev
```

**install**
```
git clone https://github.com/RainerKuemmerle/g2o.git
cd g2o/
mkdir build
cd build/
cmake ..
make -j12
sudo make install
```

## 9. PCL
**Required Dependencies**

**install**
```
sudo apt-get install libpcl-dev pcl-tools
```


## 10. Octomap & octovis
**Required Dependencies**

**install**
```
sudo apt-get install liboctomap-dev octovis
```
