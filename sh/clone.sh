#!/bin/sh

#chmod +x filename

echo "git clone ceres-solver ..."
git clone https://github.com/ceres-solver/ceres-solver.git

echo "git clone Sophus ..."
git clone http://github.com/strasdat/Sophus.git

echo "git clone Pangolin ..."
git clone https://github.com/stevenlovegrove/Pangolin.git

echo "git clone g2o ..."
git clone https://github.com/RainerKuemmerle/g2o.git

echo "git clone done."
