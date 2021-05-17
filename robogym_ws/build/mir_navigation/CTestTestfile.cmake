# CMake generated Testfile for 
# Source directory: /home/zhhm/robogym_ws/src/mir_robot/mir_navigation
# Build directory: /home/zhhm/robogym_ws/build/mir_navigation
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_mir_navigation_roslaunch-check_launch "/home/zhhm/robogym_ws/build/mir_navigation/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/melodic/share/catkin/cmake/test/run_tests.py" "/home/zhhm/robogym_ws/build/mir_navigation/test_results/mir_navigation/roslaunch-check_launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/zhhm/robogym_ws/build/mir_navigation/test_results/mir_navigation" "/opt/ros/melodic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/home/zhhm/robogym_ws/build/mir_navigation/test_results/mir_navigation/roslaunch-check_launch.xml\" \"/home/zhhm/robogym_ws/src/mir_robot/mir_navigation/launch\" ")
subdirs("gtest")
