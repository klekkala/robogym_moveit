# CMake generated Testfile for 
# Source directory: /home/zhhm/robogym_ws/src/moveit/moveit_ros/moveit_servo
# Build directory: /home/zhhm/robogym_ws/build/moveit_servo
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_moveit_servo_rostest_test_basic_servo_tests.test "/home/zhhm/robogym_ws/build/moveit_servo/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/melodic/share/catkin/cmake/test/run_tests.py" "/home/zhhm/robogym_ws/build/moveit_servo/test_results/moveit_servo/rostest-test_basic_servo_tests.xml" "--return-code" "/usr/bin/python2 /opt/ros/melodic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/zhhm/robogym_ws/src/moveit/moveit_ros/moveit_servo --package=moveit_servo --results-filename test_basic_servo_tests.xml --results-base-dir \"/home/zhhm/robogym_ws/build/moveit_servo/test_results\" /home/zhhm/robogym_ws/src/moveit/moveit_ros/moveit_servo/test/basic_servo_tests.test ")
add_test(_ctest_moveit_servo_rostest_test_servo_cpp_interface_test.test "/home/zhhm/robogym_ws/build/moveit_servo/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/melodic/share/catkin/cmake/test/run_tests.py" "/home/zhhm/robogym_ws/build/moveit_servo/test_results/moveit_servo/rostest-test_servo_cpp_interface_test.xml" "--return-code" "/usr/bin/python2 /opt/ros/melodic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/zhhm/robogym_ws/src/moveit/moveit_ros/moveit_servo --package=moveit_servo --results-filename test_servo_cpp_interface_test.xml --results-base-dir \"/home/zhhm/robogym_ws/build/moveit_servo/test_results\" /home/zhhm/robogym_ws/src/moveit/moveit_ros/moveit_servo/test/servo_cpp_interface_test.test ")
add_test(_ctest_moveit_servo_rostest_test_pose_tracking_test.test "/home/zhhm/robogym_ws/build/moveit_servo/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/melodic/share/catkin/cmake/test/run_tests.py" "/home/zhhm/robogym_ws/build/moveit_servo/test_results/moveit_servo/rostest-test_pose_tracking_test.xml" "--return-code" "/usr/bin/python2 /opt/ros/melodic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/zhhm/robogym_ws/src/moveit/moveit_ros/moveit_servo --package=moveit_servo --results-filename test_pose_tracking_test.xml --results-base-dir \"/home/zhhm/robogym_ws/build/moveit_servo/test_results\" /home/zhhm/robogym_ws/src/moveit/moveit_ros/moveit_servo/test/pose_tracking_test.test ")
subdirs("gtest")
