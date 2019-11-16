## SLAM系统性能评估

|评估指标||||
|:-|:-|:-|:-|
|ATE|绝对轨迹误差|||
|PRE|相对位姿误差|||
|MSE|均方差、方差|预测数据和原始数据对应点误差的平方和的均值。|Mean squared error|
|RMSE|均方根误差、标准差|回归系统的拟合标准差，是MSE的平方根。|Root mean squared error|
|MAE|平均绝对误差|绝对误差的平均值。||
|SSE|误差平方和|拟合数据和原始数据对应点的误差的平方和。|The sum of squares due to error|
|SSR||预测数据与原始数据均值之差的平方和|Sum of squares of the regression|
|SST||原始数据和均值之差的平方和|Total sum of squares|
||确定系数|SSR和SST的比值|R-square|
|STD|标准差|||




## ATE——绝对轨迹误差
    ATE——先对齐两轨迹并评价直接绝对构成差异。[1]

    ATE：绝对轨迹误差，直接计算相机位姿的真实值与SLAM系统的估计值之间的差，程序首先根据位姿的时间戳将真实值和估计值进行对齐，然后计算每对位姿之间的差值，并最终以图表的形式输出，该标准非常适合于评估视觉SLAM系统的性能。

    对于视觉SLAM系统，估计轨迹的全局一致性是一个重要的量。全局一致性可以通过比较估计和地面真实轨迹之间的绝对距离来评估。由于两个轨迹都可以在任意坐标系中指定，所以它们首先需要对齐。

    在平移分量的所有时间指标上计算均方根误差，或者，也可以使用RPE通过平均所有可能的时间间隔来评估轨迹的全局误差。

    注意，RPE考虑平移和旋转误差，而ATE只考虑平移误差。结果，RPE总是比ATE稍大（或者如果没有旋转误差相等）

    从实用的角度来看，ATE具有直观的可视化，便于视觉检查。

## RPE——相对位姿误差
    RPE——测量估计运动与真实运动之间的差异。

    RPE：相对位姿误差，用于计算相同两个时间戳上的位姿变化量的差，同样，在用时间戳对齐之后，真实位姿和估计位姿均每隔一段相同时间计算位姿的变化量，然后对该变化量作差，以获得相对位姿误差，该标准适合于估计系统的漂移。[2]

## MSE
    该统计参数是预测数据和原始数据对应点误差的平方和的均值，也就是SSE/n，和SSE没有太大的区别。

## RMSE——均方根误差
    Root Mean Square Error，该统计参数，也叫回归系统的拟合标准差，是MSE的平方根。

    观测值与真值偏差的平方和

    观测次数 m 比值的平方根

    用来衡量观测值与真值之间的偏差


## MAE——平均绝对误差
    绝对误差的平均值

    能更好地反映预测值误差的实际情况

## SSE
    SSE越接近于0，说明模型选择和拟合更好，数据预测也越成功。

## R-square
    “确定系数”是通过数据的变化来表征一个拟合的好坏。由上面的表达式可以知道“确定系数”的正常取值范围为[0 1]，越接近1，表明方程的变量对y的解释能力越强，这个模型对数据拟合的也较好

## evo评估工具
    在 evo 框架中，并不关心标定问题，它使用了 Umeyama 算法对两个轨迹做拟合，用拟合的结果来进行评估。


## 参考文献
    [1] Sturm J, Engelhard N, Endres F, et al. A benchmark for the evaluation of RGB-D SLAM systems[C]. 2012 IEEE/RSJ International Conference on Intelligent Robots and Systems, 2012: 573-580.

    [2] Z. Zhang D S. A Tutorial on Quantitative Trajectory Evaluation for Visual(-Inertial) Odometry[J]. IEEE/RSJ International Conference on Intelligent Robots and Systems(IROS), 2018.

    https://blog.csdn.net/ben_wind/article/details/79135348

