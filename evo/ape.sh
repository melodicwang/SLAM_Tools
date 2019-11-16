#!/bin/sh


echo "Check the file pose_dl.tum."

if test -e pose_dl.tum
then
	echo "pose_dl.tum is already exist."
else
	evo_traj euroc pose_dl.txt --save_as_tum
	echo "Format translation is done."
fi


echo "Ploting is begining."

evo_ape tum /home/melodic/dataset/EuRoc/MH-05/mav0/state_groundtruth_estimate0/data.tum pose_dl.tum -va --align --plot --plot_mode xy

