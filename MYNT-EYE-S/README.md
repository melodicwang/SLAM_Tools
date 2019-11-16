## MYNT-EYE-S-SDK + ubuntu16.04 配置
---
目录  
[1 准备工作](#1-准备工作)  
[1.1 安装ROS Kinetic（官方文档）](#11-安装ros-kinetic官方文档)  
[1.2 安装相机驱动SDK](#12-安装相机驱动sdk)  
[1.3 安装docker](#13-安装docker)  
[2 运行 vins_mono](#2-运行-vins_mono)  
[2.1 编译](#21-编译)  
[2.2 以docker方式启动](#22-以docker方式启动)  
[2.3 以master方式启动](#23-以master方式启动)  
[3](#3  )  
[4 相关操作](#4-相关操作)  
[4.1 显示节点关系](#41-显示节点关系)  
[5 更新源码中的配置文件](#5-更新源码中的配置文件)  
[5.1 获取相机参数](#51-获取相机参数)  
[5.2 获取imu的参数](#52-获取imu的参数)  
[5.3 修改源代码的参数文件](#53-修改源代码的参数文件)  

#### Prerequisites
`Ubuntu 16.04`  `ROS Kinetic` `OpenCV 3.3.1` `Eigen 3.3.3` `Ceres Solver`

## 1 准备工作
### 1.1 安装ROS Kinetic（官方文档）
```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential
```

### 1.2 安装相机驱动SDK
```
git clone https://github.com/slightech/MYNT-EYE-S-SDK.git

cd ~/MYNT-EYE-S-SDK

mkdir build
cd build
cmake ..
make -j12

cd ..
make init
make ros
make samples
```

如果出现error 找不到 OpenCVConfig.cmake opencv-config.cmake
在编译的时候执行
```
export OpenCV_DIR=/opt/ros/kinetic/share/OpenCV-3.3.1-dev/
```

### 1.3 安装docker
```
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker melodic

Relaunch the terminal or logout and re-login if you get Permission denied error.
```


## 2 运行 vins_mono

### 2.1 编译

```
mkdir catkin_ws/src
cd catkin_ws/src
git clone -b docker_feat https://github.com/slightech/MYNT-EYE-VINS-Sample.git

cd MYNT-EYE-VINS-Sample/docker
sudo make build
```

### 2.2 以docker方式启动
```
cd MYNT-EYE-S-SDK
source ./wrappers/ros/devel/setup.bash
roslaunch mynt_eye_ros_wrapper vins_mono.launch
```
```
cd path/to/MYNT-EYE-VINS-Sample/docker
./run.sh mynteye_s.launch
```

### 2.3 以master方式启动
```
cd MYNT-EYE-S-SDK-master
source wrappers/ros/devel/setup.bash
roslaunch mynt_eye_ros_wrapper mynteye.launch
```
```
cd ~/catkin_mynt/
roslaunch vins_estimator mynteye_s.launch
```


## 3



## 4 相关操作
### 4.1 显示节点关系
```
rqt_graph
```


## 5 更新源码中的配置文件
### 5.1 获取相机参数
```
cd ROS_WORKSPACE/mynt_eye_sdk
make samples                                     #编译sdk文件的sample,已执行则跳过
./samples/_output/bin/tutorials/get_img_params   #获得相机的参数
```

获得的相机参数：[程序是单目，所以只需要左眼参数]
```
I/get_img_params.cc:44 Intrinsics left: {equidistant, width: 752, height: 480,
k2: -0.02371063612399215,    // K表示等距畸变系数
k3: 0.00364168720784161,
k4: -0.00718742091605031,
k5: 0.00168468027599216,
mu: 366.96855865040998879,   //  mu,mv对应focal
mv: 366.94913556509141017,
u0: 366.54897802554643249,   //  (u0,vo)对应主点坐标 principal point
v0: 235.72364460715840551}
I/get_img_params.cc:46 Extrinsics right to left: {
rotation: [ 0.99984394326274761,0.00207484509445021, -0.01754377777542641,
            -0.00214542695051451, 0.99998967721916765, -0.00400532124865298,
            0.01753528625370900, 0.00404233508494050, 0.99983807352143850],
translation: [-120.69624235049222705, 0.31003342123826194, -1.94389196516372209]}
```

### 5.2 获取imu的参数
S1030的imu的是没有标定的，所以获取imu参数为0

### 5.3 修改源代码的参数文件
需要修改的文件为：
`~/ROS_WORKSPACE/vins_mono_mynt_eye/src/config/mynteye/mynteye_s_config`

相机投影参数 fx、fy、cx、cy  
相机畸变参数 coeffs[5]=[k1,k2,p1,p2,k3]

imu噪声以及随机游走参数
得到的参数是3维的，但是源码的参数文件的数据只有一维？


