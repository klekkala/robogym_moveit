# Install script for directory: /home/zhhm/robogym_ws/src/moveit/moveit_ros/planning_interface/move_group_interface

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
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_move_group_interface.so.1.1.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_move_group_interface.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/zhhm/robogym_ws/devel/.private/moveit_ros_planning_interface/lib/libmoveit_move_group_interface.so.1.1.1"
    "/home/zhhm/robogym_ws/devel/.private/moveit_ros_planning_interface/lib/libmoveit_move_group_interface.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_move_group_interface.so.1.1.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_move_group_interface.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/zhhm/robogym_ws/devel/.private/moveit_ros_planning_interface/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_warehouse/lib:/opt/ros/melodic/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_manipulation/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_move_group/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_planning/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/zhhm/robogym_ws/devel/.private/moveit_core/lib:/home/zhhm/robogym_ws/devel/.private/geometric_shapes/lib:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/moveit_ros_planning_interface/_moveit_move_group_interface.so.1.1.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/moveit_ros_planning_interface/_moveit_move_group_interface.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/moveit_ros_planning_interface" TYPE SHARED_LIBRARY FILES
    "/home/zhhm/robogym_ws/devel/.private/moveit_ros_planning_interface/lib/python2.7/dist-packages/moveit_ros_planning_interface/_moveit_move_group_interface.so.1.1.1"
    "/home/zhhm/robogym_ws/devel/.private/moveit_ros_planning_interface/lib/python2.7/dist-packages/moveit_ros_planning_interface/_moveit_move_group_interface.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/moveit_ros_planning_interface/_moveit_move_group_interface.so.1.1.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/moveit_ros_planning_interface/_moveit_move_group_interface.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/zhhm/robogym_ws/devel/.private/moveit_ros_planning_interface/lib:/opt/ros/melodic/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_warehouse/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_manipulation/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_move_group/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_planning/lib:/home/zhhm/robogym_ws/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/zhhm/robogym_ws/devel/.private/moveit_core/lib:/home/zhhm/robogym_ws/devel/.private/geometric_shapes/lib:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/zhhm/robogym_ws/src/moveit/moveit_ros/planning_interface/move_group_interface/include/")
endif()
