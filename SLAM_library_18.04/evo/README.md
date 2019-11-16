## evo工具
适用于**TUM** **KITTI** **EuRoc** **ROS bag**等文件 

	evo_traj-用于分析，绘制或导出一个或多个轨迹的工具
	evo_res-用于比较evo_ape或evo_rpe中的一个或多个结果文件的工具
	evo_fig-用于重新打开序列化图的（实验性）工具（使用--serialize_plot保存）
	evo_config-用于全局设置和配置文件操作的工具

[单轨迹显示](#单轨迹显示)  
[多轨迹显示](#多轨迹显示)  
[计算绝对位姿误差（轨迹对齐）](#计算绝对位姿误差轨迹对齐)  
[轨迹文件格式转换](#轨迹文件格式转换)  
[install evo](#install-evo)  
[pip](#pip)  
[NumPy](#numpy)  
[evo From Source](#evo-from-source)  
[evo test](#evo-test)  
[evo_config](#evo_config)  


evo_ape 绝对位姿误差，常作为绝对轨迹误差使用。通过姿态关系直接估计和参考对应姿态。然后，计算整个轨迹的统计数据。这对于测试轨迹的全局一致性是有用的。  
evo_rpe 相对位姿误差，相对于绝对姿态的直接比较，相对姿态误差比较运动（“姿态三角”）。该度量给出了关于局部精度的见解，即漂移。


### 单轨迹显示  
```
evo_traj euroc data.csv --plot
```
可直接输出 name:data

### 多轨迹显示
绘制不同算法（ORB PTAM等）中与真实轨迹的图  
（a）上面将 EuRoC 数据集中 MH_04_difficult 序列的 groundtruth(.csv文件) 转换为 TUM 形式的轨迹文件，文件名为 data.tum  
（b）通过双目 ORBSLAM 跑 MH_04_difficult 数据集得到 TUM 形式的轨迹文件，文件名为 FrameTrajectory_TUM_Format.txt  
（c）将两个 TUM 形式的轨迹文件放入同一个文件夹 (test_evo) 中  
```
evo_traj tum FrameTrajectory_TUM_Format.txt --ref=data.tum -p
```


### 计算绝对位姿误差（轨迹对齐）
```
evo_ape tum data.tum FrameTrajectory_TUM_Format.txt -va --plot
```




### 轨迹文件格式转换
将 EuRoC 数据集中 .csv 文件形式的 groundtruth 转换为 ~ 形式的轨迹文件  
```
evo_traj euroc data.csv --save_as_tum
evo_traj euroc data.csv --save_as_kitti
evo_traj euroc data.csv --save_as_bag
```
TUM 形式的轨迹文件格式：`timestamp x y z q_x q_y q_z q_w`  
<-- 每行8个数，用空格分隔，包含时间戳（单位：秒）、位置和旋转（四元素表示） -->


## install evo

### pip
```
sudo apt install python-pip

pip install -U pip
pip --version
```

### NumPy
```
pip install numpy --user

python -c "import numpy; print numpy.version.version"
```

### evo From Source
```
cd ~/library
git clone https://github.com/MichaelGrupp/evo.git
pip install --editable . --upgrade --no-binary evo --user
```

### evo test
```
cd PATH_to_data.csv/
evo_traj euroc euroc.csv --plot
```


### evo_config
```
evo_config show

{
    "console_logging_format": "%(message)s",
    "euler_angle_sequence": "sxyz",
    "global_logfile_enabled": false,
    "plot_backend": "TkAgg",
    "plot_export_format": "pdf",
    "plot_figsize": [
        6,
        6
    ],
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
    "plot_statistics": [
        "rmse",
        "median",
        "mean",
        "std",
        "min",
        "max"
    ],
    "plot_texsystem": "pdflatex",
    "plot_trajectory_alpha": 0.75,
    "plot_trajectory_cmap": "jet",
    "plot_trajectory_linestyle": "-",
    "plot_usetex": false,
    "plot_xyz_realistic": true,
    "save_traj_in_zip": false,
    "table_export_data": "stats",
    "table_export_format": "csv",
    "table_export_transpose": true
}
```

修改图的背景为白色：
```
evo_config set plot_seaborn_style whitegrid
```

修改线条颜色：
有6个序列可以替换：bright、deep6、colorblind、pastel、dark、muted
```
evo_config set plot_seaborn_palette bright
```

修改线条粗细程度：
```
evo_config set plot_linewidth 1.5
```

调整显示尺寸
```
evo_config set plot_figsize 5 4.5

evo_config reset 恢复默认设置
```














