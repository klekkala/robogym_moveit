# CMake generated Testfile for 
# Source directory: /home/zhhm/robogym_ws/src/mir_robot/mir_driver
# Build directory: /home/zhhm/robogym_ws/build/mir_driver
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_mir_driver_roslaunch-check_launch "/home/zhhm/robogym_ws/build/mir_driver/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/melodic/share/catkin/cmake/test/run_tests.py" "/home/zhhm/robogym_ws/build/mir_driver/test_results/mir_driver/roslaunch-check_launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/zhhm/robogym_ws/build/mir_driver/test_results/mir_driver" "/opt/ros/melodic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/home/zhhm/robogym_ws/build/mir_driver/test_results/mir_driver/roslaunch-check_launch.xml\" \"/home/zhhm/robogym_ws/src/mir_robot/mir_driver/launch\" ")
subdirs("gtest")
