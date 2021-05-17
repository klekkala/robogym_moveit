# CMake generated Testfile for 
# Source directory: /home/zhhm/robogym_ws/src/mir_robot/mir_description
# Build directory: /home/zhhm/robogym_ws/build/mir_description
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_mir_description_roslaunch-check_launch "/home/zhhm/robogym_ws/build/mir_description/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/melodic/share/catkin/cmake/test/run_tests.py" "/home/zhhm/robogym_ws/build/mir_description/test_results/mir_description/roslaunch-check_launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/zhhm/robogym_ws/build/mir_description/test_results/mir_description" "/opt/ros/melodic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/home/zhhm/robogym_ws/build/mir_description/test_results/mir_description/roslaunch-check_launch.xml\" \"/home/zhhm/robogym_ws/src/mir_robot/mir_description/launch\" ")
subdirs("gtest")
