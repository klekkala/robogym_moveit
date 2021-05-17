# CMake generated Testfile for 
# Source directory: /home/zhhm/robogym_ws/src/moveit_resources/prbt_support
# Build directory: /home/zhhm/robogym_ws/build/moveit_resources_prbt_support
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_moveit_resources_prbt_support_roslint_package "/home/zhhm/robogym_ws/build/moveit_resources_prbt_support/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/melodic/share/catkin/cmake/test/run_tests.py" "/home/zhhm/robogym_ws/build/moveit_resources_prbt_support/test_results/moveit_resources_prbt_support/roslint-moveit_resources_prbt_support.xml" "--working-dir" "/home/zhhm/robogym_ws/build/moveit_resources_prbt_support" "--return-code" "/opt/ros/melodic/share/roslint/cmake/../../../lib/roslint/test_wrapper /home/zhhm/robogym_ws/build/moveit_resources_prbt_support/test_results/moveit_resources_prbt_support/roslint-moveit_resources_prbt_support.xml make roslint_moveit_resources_prbt_support")
subdirs("gtest")
