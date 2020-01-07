# evo工具 
***Python package for the evaluation of odometry and SLAM***

https://github.com/MichaelGrupp/evo
||
| :---: |
| TUM / KITTI / EuRoc / ROS bag |
||

**Metrics:**
* evo_ape 绝对位姿误差，常作为绝对轨迹误差使用，一般用来评价轨迹的全局一致性。通过姿态关系直接估计和参考对应姿态。然后，计算整个轨迹的统计数据。

* evo_rpe 相对位姿误差，相对于绝对姿态的直接比较，相对姿态误差比较运动（“姿态三角”）。该度量给出了关于局部精度的见解，即漂移。

**Tools:**
* evo_traj    -用于分析，绘制或导出一个或多个轨迹的工具
* evo_res     -用于比较evo_ape或evo_rpe中的一个或多个结果文件的工具
* evo_fig     -用于重新打开序列化图的（实验性）工具（使用--serialize_plot保存）
* evo_config  -用于全局设置和配置文件操作的工具


[1. Installation / Upgrade](#1-installation--upgrade)  
[1.1 pip](#11-pip)  
[1.2 NumPy](#12-numpy)  
[1.3 evo From Source](#13-evo-from-source)  
[1.4 evo test](#14-evo-test)  
[2. 常见数据集格式](#2-常见数据集格式)  
[2.1 TUM格式](#21-tum格式)  
[2.2 EuRoc格式](#22-euroc格式)  
[2.3 KiTTI格式](#23-kitti格式)  
[2.4 格式转换](#24-格式转换)  
[3. 轨迹绘制](#3-轨迹绘制)  
[3.1 单条轨迹绘制](#31-单条轨迹绘制)  




## 1. Installation / Upgrade
### 1.1 Dependencies  
evo has the following dependencies that are *automatically resolved* during installation:

*numpy, matplotlib, scipy, pandas, seaborn, natsort, argcomplete, colorama, pygments, enum34 (only Python 2.7)*

### 1.2 pip
```
sudo apt install python-pip
pip install -U pip
pip --version
```

### 1.3 NumPy
```
pip install numpy --user

python -c "import numpy; print numpy.version.version"
```

### 1.4 evo From Source
```
cd ~/library
git clone https://github.com/MichaelGrupp/evo.git
pip install --editable . --upgrade --no-binary evo --user
```

### 1.5 evo test
```
cd PATH_to_data.csv/
evo_traj euroc euroc.csv --plot
```

## 2. 常见数据集格式
### 2.1 TUM格式
```
timestamp x y z q_x q_y q_z q_w 
每行8个元素，用空格分隔，包含时间戳（单位：秒）、位置和旋转（四元素表示）。
```

### 2.2 EuRoc格式
```
timestamp，px,py,pz,qw,qx,qy,qz,vx,vy,vz,bwx,bwy,bwz,bax,bay,baz
每行17个元素，逗号隔开，时间以纳秒为单位。
```

### 2.3 KiTTI格式
```
r11 r12 r13 tx r21 r22 r23 ty r31 r32 r33 tz
每行12元素，空格隔开，存储变换矩阵的前三行，没有时间。
```

### 2.4 格式转换
```
evo_traj euroc data.csv --save_as_tum
evo_traj euroc data.csv --save_as_kitti
evo_traj euroc data.csv --save_as_bag
```

## 3. 轨迹绘制
### 3.1 单条轨迹绘制
```
evo_traj euroc data.csv --plot
evo_traj tum data.csv --plot
可直接输出 name:data
```
通过这种方式可以看到估计的结果中包含多少 camera_pose, path的大致长度，轨迹的持续时间等
```infos:	36382 poses, 80.626m path length, 181.905s duration```

### 3.2 多条轨迹绘制
绘制不同算法（ORB PTAM等）中与真实轨迹的图  
（a）上面将 EuRoC 数据集中 MH_04_difficult 序列的 groundtruth(.csv文件) 转换为 TUM 形式的轨迹文件，文件名为 data.tum  
（b）通过双目 ORBSLAM 跑 MH_04_difficult 数据集得到 TUM 形式的轨迹文件，文件名为 FrameTrajectory_TUM_Format.txt  
（c）将两个 TUM 形式的轨迹文件放入同一个文件夹 (test_evo) 中  
```
evo_traj tum FrameTrajectory_TUM_Format.txt --ref=data.tum -p
```
```
evo_ape euroc groundtruth.csv Trajectory.txt  -va --plot --save_results results/vins.zip

evo_rpe tum reference.txt estimate.txt --pose_relation angle_deg --delta 1 --delta_unit m

evo_traj kitti KITTI_00_ORB.txt KITTI_00_SPTAM.txt --ref=KITTI_00_gt.txt -p --plot_mode=xz
```


## 4. 评测
### 4.1 APE——计算绝对位姿误差（轨迹对齐）
```
evo_ape tum groundtruth.tum Traj_TUM_Format.txt -va --align --plot_mode xy
```
```
mkdir results
evo_ape tum groundtruth.tum Traj_TUM_Format.txt -va --align --plot_mode xy --save_results results/result.zip
```
*euroc格式的csv文件无法直用于evo_ape命令，转换成tum格式的可以有结果。*

### 4.2 RPE
```
evo_rpe tum reference.txt estimate.txt --pose_relation angle_deg --delta 1 --delta_unit m
```

### 4.3 ***Plot multiple trajectories***  
Using `evo_traj`plot two KITTI pose files and the ground truth:
```
cd test/data
evo_traj kitti KITTI_00_ORB.txt KITTI_00_SPTAM.txt --ref=KITTI_00_gt.txt -p --plot_mode=xz
```

### 4.4 ***Run a metric on trajectories***  
For example, here we calculate the absolute pose error for two trajectories from ORB-SLAM and S-PTAM using `evo_ape` (`KITTI_00_gt.txt` is the reference (ground truth)) and plot and save the individual results to .zip files for `evo_res`:

    *First trajectory (ORB Stereo):*

    ```
    mkdir results
    evo_ape kitti KITTI_00_gt.txt KITTI_00_ORB.txt -va --plot --plot_mode xz --save_results results/ORB.zip
    ```

    ***Second trajectory (S-PTAM):***

    ```
    evo_ape kitti KITTI_00_gt.txt KITTI_00_SPTAM.txt -va --plot --plot_mode xz --save_results results/SPTAM.zip
    ```

### 4.5 ***Process multiple results from a metric***

  `evo_res` can be used to compare multiple result files from the metrics, i.e.:
  * print infos and statistics (default)
  * plot the results
  * save the statistics in a table

  Use the results from above to generate a plot and a table:
  ```
  evo_res results/*.zip -p --save_table results/table.csv
  ```


## 5. evo_config
### 5.1 常用配置
```
evo_config show

恢复默认设置
evo_config reset

修改图的背景为白色
evo_config set plot_seaborn_style whitegrid

调整显示窗口尺寸
evo_config set plot_figsize 9 6

修改线条粗细程度
evo_config set plot_linewidth 2.5

修改坐标字体大小
evo_config set plot_fontscale 1.2

修改线条颜色
evo_config set plot_seaborn_palette bright
```


```
{   "console_logging_format": "%(message)s",
    "euler_angle_sequence": "sxyz",
    "global_logfile_enabled": false,
    "plot_backend": "TkAgg",
    "plot_export_format": "pdf",
    "plot_figsize": [        6,        6    ],      // 结果输出窗口尺寸
    "plot_fontfamily": "sans-serif",
    "plot_fontscale": 1.0,
    "plot_invert_xaxis": false,
    "plot_invert_yaxis": false,
    "plot_linewidth": 1.5,
    "plot_multi_cmap": "none",
    "plot_reference_alpha": 0.5,
    "plot_reference_color": "black",
    "plot_reference_linestyle": "--",
    "plot_seaborn_palette": "deep6",
    "plot_seaborn_style": "darkgrid",
    "plot_split": false,
    "plot_statistics": ["rmse","median","mean","std","min","max"],
    "plot_texsystem": "pdflatex",
    "plot_trajectory_alpha": 0.75,
    "plot_trajectory_cmap": "jet",
    "plot_trajectory_linestyle": "-",
    "plot_usetex": false,
    "plot_xyz_realistic": true,
    "save_traj_in_zip": false,                      // 保存结果
    "table_export_data": "stats",
    "table_export_format": "csv",
    "table_export_transpose": true    }
```


### 5.2 导出和导入配置
```
"对齐　画图　比较"
evo_config generate --pose_relation angle_deg --align --correct_scale  --delta 1 --delta_unit m --verbose --plot --out rpe_config.json

"利用配置文件画图"
evo_rpe tum MH_01_gt.tum vio.csv -c rpe_config.json

"画图　并将结果保存到本地"
evo_rpe tum MH_01_gt.tum vio.csv -c rpe_config.json --save_result MH_01.zip
```

