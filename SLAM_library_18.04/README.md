## SLAM_library_18.04 
  

 
## 1 ROS
### 1.1 Configure your Ubuntu repositories
    Configure your Ubuntu repositories to allow "restricted," "universe," and "multiverse." 

### 1.2 Setup your sources.list
```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
```

### 1.3 Set up your keys
```
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
```

### 1.4 Installation
```
sudo apt update
sudo apt install ros-melodic-desktop-full
```

### 1.5 Initialize rosdep
```
sudo rosdep init
rosdep update
```

### 1.6 Environment setup
```
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

### 1.7 Dependencies for building packages
```
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential
```

## 2. Ceres
### 2.1 Required Dependencies(非共享库)
```
sudo apt-get install liblapack-dev libsuitesparse-dev libcxsparse3 libgflags-dev libgoogle-glog-dev libgtest-dev
```

### 2.2 Installation
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

## 3. Sophus
```
git clone http://github.com/strasdat/Sophus.git
```
### 3.1 在编译之前需要打开　sophus/so2.cpp　文件，将
```
    unit_complex_.real() = 1. ;
    unit_complex_.imag() = 0. ;     
    改为
    unit_complex_.real(1.) ;
    unit_complex_.imag(0.) ;
```
## 3.2 Installation
```
cd Sophus/
mkdir build
cd build/
cmake ..
make -j12
[无需安装]
```

## 4. Pangolin
### 4.1 Required Dependencies
```
sudo apt install libgl1-mesa-dev libglew-dev libxkbcommon-dev
```
### 4.2 Installation
```
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build
cd build/
cmake ..
cmake --build .
```

## 5. g2o
### 5.1 Required Dependencies
```
sudo apt-get install libqt4-dev qt4-qmake libsuitesparse-dev libcxsparse3.1.4 libcholmod-dev
```
### 5.2 Installation
```
git clone https://github.com/RainerKuemmerle/g2o.git
cd g2o/
mkdir build
cd build/
cmake ..
make -j12
sudo make install
```

## 5. PCL
### 5.1 Required Dependencies

### 5.2 Installation
```
sudo apt-get install libpcl-dev pcl-tools
```


## 6. Octomap & octovis
### 6.1 Required Dependencies

### 6.2 Installation
```
sudo apt-get install liboctomap-dev octovis
```

## 10. Eigen
### 10.1 Installation
```
sudo apt-get install libeigen3-dev
```
### 10.2 Check version  
```
pkg-config --cflags libeigen3-dev
```  
## 10.3 Remove
```
sudo apt-get remove libeigen3-dev
``` 

### 11. opencv

### 11.2 Check version  
```
pkg-config --modversion opencv
```


### 12. glog
### 12.1 Required Dependencies
```
sudo apt-get install autoconf automake libtool
```

### 12.2 Installation
```
sudo apt-get install autoconf automake libtool

git clone https://github.com/google/glog
./autogen.sh
./configure
make -j12
sudo make install
```

## 13. gflags
### 13.1 Required Dependencies

### 13.2 Installation
```
sudo apt install libgflags-dev
```
