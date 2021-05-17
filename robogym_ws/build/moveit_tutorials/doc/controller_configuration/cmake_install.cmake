# Install script for directory: /home/zhhm/robogym_ws/src/moveit_tutorials/doc/controller_configuration

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/zhhm/robogym_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/libcontroller_manager_example.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/libcontroller_manager_example.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/libcontroller_manager_example.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials" TYPE SHARED_LIBRARY FILES "/home/zhhm/robogym_ws/devel/.private/moveit_tutorials/lib/libcontroller_manager_example.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/libcontroller_manager_example.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/libcontroller_manager_example.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/libcontroller_manager_example.so"
         OLD_RPATH "/home/zhhm/robogym_ws/devel/.private/moveit_ros_planning_interface/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_warehouse/lib:/opt/ros/melodic/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_manipulation/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_move_group/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_perception/lib:/home/zhhm/robogym_ws/devel/.private/moveit_visual_tools/lib:/home/zhhm/robogym_ws/devel/.private/rviz_visual_tools/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_planning/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/zhhm/robogym_ws/devel/.private/moveit_core/lib:/home/zhhm/robogym_ws/devel/.private/geometric_shapes/lib:/usr/lib/x86_64-linux-gnu/hdf5/openmpi:/usr/lib/x86_64-linux-gnu/openmpi/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/libcontroller_manager_example.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_tutorials/doc/controller_configuration" TYPE FILE FILES "/home/zhhm/robogym_ws/src/moveit_tutorials/doc/controller_configuration/moveit_controller_manager_example_plugin_description.xml")
endif()

