{
gnome-terminal -x bash -c "cd ~/sdk && source ./wrappers/ros/devel/setup.bash && roslaunch mynt_eye_ros_wrapper vins_mono.launch"
}&

sleep 1s
{
gnome-terminal -x bash -c "cd ~/MYNT-EYE-VINS-Sample/docker && ./run.sh mynteye_s.launch"
}

# sudo chmod -R 777 XXX.sh
