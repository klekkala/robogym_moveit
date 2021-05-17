#!/usr/bin/env python


import sys
import copy
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from math import pi
from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list

class Planner(object):
	def __init__(self):
		super(Planner, self).__init__()

		moveit_commander.roscpp_initialize(sys.argv)
		rospy.init_node('planner', anonymous=True)

		robot = moveit_commander.RobotCommander()

		scene = moveit_commander.PlanningSceneInterface()

		group_name = "ur5_arm"
		move_group  = moveit_commander.MoveGroupCommander(group_name)

		display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path', moveit_msgs.msg.DisplayTrajectory, queue_size=20)


		planning_frame = move_group.get_planning_frame()
		print "============ Planning frame: %s" % planning_frame
		# We can also print the name of the end-effector link for this group:
		eef_link = move_group.get_end_effector_link()
		print "============ End effector link: %s" % eef_link
		# We can get a list of all the groups in the robot:
		group_names = robot.get_group_names()
		print "============ Available Planning Groups:", robot.get_group_names()
		# Sometimes for debugging it is useful to print the entire state of the
		# robot:
		print "============ Printing robot state"
		print robot.get_current_state()
		print "============ Target pose"
		print [sys.argv[1], sys.argv[2], sys.argv[3]]
		print ""

		self.pose = [float(sys.argv[1]), float(sys.argv[2]), float(sys.argv[3])]
		self.robot = robot
		self.scene = scene
		self.move_group = move_group
		self.display_trajectory_publisher = display_trajectory_publisher
		self.planning_frame = planning_frame
		self.eef_link = eef_link
		self.group_names = group_names

	def go_to_joint_state(self):
		move_group = self.move_group

		joint_goal = move_group.get_current_joint_values()
		joint_goal[0] = 0
		joint_goal[1] = -pi/2
		joint_goal[2] = pi/2
		joint_goal[3] = 0
		joint_goal[4] = 0
		joint_goal[5] = 0

		move_group.go(joint_goal, wait=True)
		move_group.stop()

	def go_to_pose_goal(self):
		move_group = self.move_group
		pose = self.pose
		pose_goal = geometry_msgs.msg.Pose()
		pose_goal.position.x = pose[0]
		pose_goal.position.y = pose[1]
		pose_goal.position.z = pose[2]
		# pose_goal.orientation.w = pose[3]
		move_group.set_pose_target(pose_goal)

		plan = move_group.go(wait=True)
		move_group.stop()
		move_group.clear_pose_targets()

	def plan_cartesian_path(self, scale=1):
		move_group = self.move_group

		waypoints = []
		wpose = move_group.get_current_pose().pose
		wpose.position.z -= scale * 0.1
		wpose.position.y += scale * 0.2
		waypoints.append(copy.deepcopy(wpose))
		wpose.position.x += scale * 0.1
		waypoints.append(copy.deepcopy(wpose))
		wpose.position.y -= scale * 0.1
		waypoints.append(copy.deepcopy(wpose))

		(plan, fraction) = move_group.compute_cartesian_path(waypoints, 0.01, 0.0)

		return plan, fraction

	def display_trajectory(self, plan):
		robot = self.robot
		display_trajectory_publisher = self.display_trajectory_publisher

		display_trajectory = moveit_msgs.msg.DisplayTrajectory()
		display_trajectory.trajectory_start = robot.get_current_state()
		display_trajectory.trajectory.append(plan)
		display_trajectory_publisher.publish(display_trajectory)

	def execute_plan(self, plan):
		move_group = self.move_group

		move_group.execute(plan, wait=True)



def main():
	try:
		print "============ Press `Enter` to begin the tutorial by setting up the moveit_commander ..."
		raw_input()
		planner = Planner()
		print "============ Press `Enter` to execute a movement using a joint state goal ..."
		raw_input()
		planner.go_to_joint_state()
		print "============ Press `Enter` to execute a movement using a pose goal ..."
		raw_input()
		planner.go_to_pose_goal()
		print "============ Press `Enter` to plan and display a Cartesian path ..."
		raw_input()
		cartesian_plan, fraction = planner.plan_cartesian_path()
		print "============ Press `Enter` to display a saved trajectory (this will replay the Cartesian path)  ..."
		raw_input()
		planner.display_trajectory(cartesian_plan)
		print "============ Press `Enter` to execute a saved path ..."
		raw_input()
		planner.execute_plan(cartesian_plan)
		print "============ Press `Enter` to add a box to the planning scene ..."
	except rospy.ROSInterruptException:
		return
	except KeyboardInterrupt:
		return

if __name__ == '__main__':
	main()