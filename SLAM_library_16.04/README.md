## [SLAM_library_16.04](#slam_library)  
[1. Eigen-3.3.3](#1-eigen-333)  
[2. glog](#2-glog)  
[3. gflags](#3-gflags)  
[4. Ceres-1.14.0](#4-ceres-1140)  
[5. Sophus](#5-sophus)  
[6. Pangolin](#6-pangolin)  
[7. g2o](#7-g2o)  
[8. PCL](#8-pcl)  
[9. Octomap & octovis](#9-octomap--octovis)


## 1. Eigen-3.3.3
**build**
```
cd Eigen-3.3.3/
mdkir build
cd build/
cmake ..
make -j12
sudo make -j12 install
```
**check**
```
pkg-config --cflags libeigen3-dev
```


## 2. glog
**Required Dependencies**

`sudo apt-get install autoconf automake libtool`

**build**
```
git clone https://github.com/google/glog
./autogen.sh
./configure
make -j12
sudo make -j12 install
```


## 3. gflags

```
git clone https://github.com/gflags/gflags
mkdir build
cd build/
cmake ..
make -j12
sudo make -j12 install
```


## 4. Ceres-1.14.0

https://github.com/ceres-solver/ceres-solver

**Required Dependencies(非共享库)**
```
sudo apt-get install libgoogle-glog-dev libatlas-base-dev libsuitesparse-dev
```

**build**
```
git clone https://github.com/ceres-solver/ceres-solver.git
cd ceres
mkdir build
cd build/
cmake ..
make -j12
make test	// 可选
sudo make -j12 install
```


## 5. Sophus
[Sophus](http://github.com/strasdat/Sophus)

**build**
```
git clone http://github.com/strasdat/Sophus.git
cd Sophus/
mkdir build
cd build/
cmake ..
make -j12
sudo make -j12 install
```


## 6. Pangolin
一款开源的OPENGL显示库，可以用来视频显示、而且开发容易。
[Pangolin](https://github.com/stevenlovegrove/Pangolin)
OpenGL（Open Graphics Library，开放式图形库）是用于渲染2D、3D矢量图形的跨语言、跨平台的应用程序编程接口（API）。
**Required Dependencies**
```
sudo apt install libgl1-mesa-dev libglew-dev
```

**build**
```
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build
cd build/
cmake ..
cmake --build .
sudo make -j12 install
```


## 7. g2o

**Required Dependencies**

`sudo apt-get install libqt4-dev qt4-qmake libqglviewer-dev libsuitesparse-dev libcxsparse3.1.4 libcholmod`  
!-此处需要按Tab补充版本号 --

**build**

```
git clone https://github.com/RainerKuemmerle/g2o.git
cd g2o/
mkdir build
cd build/
cmake ..
make -j12
sudo make -j12 install
```


## 8. PCL

**Required Dependencies**
**Eigen** **Boost** **FlANN** **VTK** **OpenNI** **QHull** **
```
sudo apt-get install libproj-dev
```

**install**
```
sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get update
sudo apt-get install libpcl-dev pcl-tools
```


## 9. Octomap & octovis

**Required Dependencies**
```
sudo apt-get install doxygen libqt4-dev qt4-qmake libqglviewer-dev-qt4
```

**build**
```
git clone https://github.com/OctoMap/octomap.git
cd octomap/octomap
mkdir build
cd build/
cmake ..
make -j12
sudo make -j12 install

cd octomap/octovis
mkdir build
cd build/
cmake ..
make -j12
sudo make -j12 install
```
