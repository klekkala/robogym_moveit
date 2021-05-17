#!/usr/bin/env python2
from __future__ import print_function
import sys
import copy
import rospy
import moveit_commander
import moveit_msgs.msg
import tf
import geometry_msgs.msg
from math import pi
from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list
from trajectory_msgs.msg import JointTrajectoryPoint


class Planner(object):
	def __init__(self):
		super(Planner, self).__init__()
		moveit_commander.roscpp_initialize(sys.argv)
		rospy.init_node('planner', anonymous=True)

		robot = moveit_commander.RobotCommander()
		scene = moveit_commander.PlanningSceneInterface()

		group_name = "ur5_arm"
		move_group = moveit_commander.MoveGroupCommander(group_name)


		display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path', moveit_msgs.msg.DisplayTrajectory, queue_size=20)

		planning_frame = move_group.get_planning_frame()
		print("============ Planning frame: %s" % planning_frame)
		# We can also print the name of the end-effector link for this group:
		eef_link = move_group.get_end_effector_link()
		print("============ End effector link: %s" % eef_link)
		# We can get a list of all the groups in the robot:
		group_names = robot.get_group_names()
		print("============ Available Planning Groups:", robot.get_group_names())
		# Sometimes for debugging it is useful to print the entire state of the
		# robot:
		print("============ Printing robot state")
		print(robot.get_current_state())
		print("============ Target pose")
		print([sys.argv[1], sys.argv[2], sys.argv[3]])
		print("")

		self.pose = [float(sys.argv[1]), float(sys.argv[2]), float(sys.argv[3])]
		self.robot = robot
		self.scene = scene
		self.move_group = move_group
		self.display_trajectory_publisher = display_trajectory_publisher
		self.planning_frame = planning_frame
		self.eef_link = eef_link
		self.group_names = group_names
		self.box_name = 'object'
		self.start_state = robot.get_current_state()
		print(robot.get_current_state())
		self.execute_step = 0

	def reset(self):
		move_group = self.move_group

		joint_goal = move_group.get_current_joint_values()
		joint_goal[0] = 0
		joint_goal[1] = 0
		joint_goal[2] = 0
		joint_goal[3] = 0
		joint_goal[4] = 0
		joint_goal[5] = 0

		move_group.go(joint_goal)

		self.remove_object()

	def step(self):
		move_group = self.move_group
		joint_positions = self.trajectory.joint_trajectory.points[self.execute_step].positions
		joint_goal = move_group.get_current_joint_values()
		joint_goal[0] = joint_positions[0]
		joint_goal[1] = joint_positions[1]
		joint_goal[2] = joint_positions[2]
		joint_goal[3] = joint_positions[3]
		joint_goal[4] = joint_positions[4]
		joint_goal[5] = joint_positions[5]
		move_group.go(joint_goal, wait=True)
		self.execute_step += 1
		if self.execute_step == len(self.trajectory.joint_trajectory.points):
			return True
		return False

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
		# pose_goal.orientation.w = 1.0
		move_group.set_pose_target(pose_goal)

		plan = move_group.plan()
		self.trajectory = plan[1]
		print(self.trajectory.joint_trajectory)
		# move_group.go(pose_goal)
		# move_group.stop()
		# move_group.clear_pose_targets()



	def add_object(self, timeout=4):
		scene = self.scene

		box_pose = geometry_msgs.msg.PoseStamped()
		box_pose.header.frame_id = "base_link"
		box_pose.pose.position.x = 0.5
		box_pose.pose.position.y = 0.0
		box_pose.pose.position.z = 0.5
		scene.add_box("object", box_pose, size=(0.02, 0.02, 0.1))

	def attach_object(self):
		box_name = self.box_name
		robot = self.robot
		scene = self.scene
		eef_link = self.eef_link
		group_names = self.group_names

		grasping_group = 'hand'
		touch_links = robot.get_link_names(group=grasping_group)
		scene.attach_box(eef_link, box_name, touch_links=touch_links)

	def remove_object(self):
		box_name = "object"
		scene = self.scene
		scene.remove_world_object(box_name)


	def openGripper(self, posture):
		posture.joint_names = ["ur5_finger_joint1", "ur5_finger_joint2"]

		posture.points = list()
		point = JointTrajectoryPoint()
		point.positions = [0.06, 0.06]
		point.time_from_start = rospy.Duration(0.5)
		
		posture.points.append(point)

	def closeGripper(self, posture):
		posture.joint_names = ["ur5_finger_joint1", "ur5_finger_joint2"]

		posture.points = list()
		point = JointTrajectoryPoint()
		point.positions = [0.0, 0.0]
		point.time_from_start = rospy.Duration(0.5)
		
		posture.points.append(point)


	def pick(self):
		move_group = self.move_group
		grasps = []
		g = moveit_msgs.msg.Grasp()
		grasp_post = geometry_msgs.msg.PoseStamped()
		grasp_post.header.frame_id = "base_link"
		grasp_post.pose.position.x = 0.415
		grasp_post.pose.position.y = 0
		grasp_post.pose.position.z = 0.5
		quaternion = tf.transformations.quaternion_from_euler(-pi/2, -pi/2, -pi/2)
		grasp_post.pose.orientation.x = quaternion[0]
		grasp_post.pose.orientation.y = quaternion[1]
		grasp_post.pose.orientation.z = quaternion[2]
		grasp_post.pose.orientation.w = quaternion[3]

		g.grasp_pose = grasp_post

		g.pre_grasp_approach.direction.header.frame_id = "base_link"
		g.pre_grasp_approach.direction.vector.x = 1.0;
		g.pre_grasp_approach.min_distance = 0.095;
		g.pre_grasp_approach.desired_distance = 0.115;

		g.post_grasp_retreat.direction.header.frame_id = "base_link"
		g.post_grasp_retreat.direction.vector.z = 1.0;
		g.post_grasp_retreat.min_distance = 0.1;
		g.post_grasp_retreat.desired_distance = 0.25;

		self.openGripper(g.pre_grasp_posture)
		self.closeGripper(g.grasp_posture)

		grasps.append(g)

		move_group.pick("object", grasps)

	def place(self):
		move_group = self.move_group
		place_location = []
		p = moveit_msgs.msg.PlaceLocation()
		place_post = geometry_msgs.msg.PoseStamped()
		place_post.header.frame_id = "base_link"
		place_post.pose.position.x = 0
		place_post.pose.position.y = 0.5
		place_post.pose.position.z = 0.5
		quaternion = tf.transformations.quaternion_from_euler(0, 0, pi/2)
		place_post.pose.orientation.x = quaternion[0]
		place_post.pose.orientation.y = quaternion[1]
		place_post.pose.orientation.z = quaternion[2]
		place_post.pose.orientation.w = quaternion[3]

		p.place_pose = place_post

		p.pre_place_approach.direction.header.frame_id = "base_link"
		p.pre_place_approach.direction.vector.z = -1.0
		p.pre_place_approach.min_distance = 0.095
		p.pre_place_approach.desired_distance = 0.115

		p.post_place_retreat.direction.header.frame_id = "base_link"
		p.post_place_retreat.direction.vector.y = -1.0
		p.post_place_retreat.min_distance = 0.1
		p.post_place_retreat.desired_distance = 0.25

		self.openGripper(p.post_place_posture)

		place_location.append(p)

		move_group.place("object", place_location)



def main():
	try:
		# print "============ Press `Enter` to begin the tutorial by setting up the moveit_commander ..."
		# raw_input()
		planner = Planner()
		# print "============ Press `Enter` to execute a movement using a joint state goal ..."
		# raw_input()
		# planner.go_to_joint_state()
		# print "============ Press `Enter` to execute a movement using a pose goal ..."
		# raw_input()
		planner.go_to_pose_goal()
	# 	print "============ Press `Enter` to execute a movement using a joint state goal ..."
	# 	raw_input()
	# 	while planner.step() == False:
	# 		planner.step()	
	# 	print "============ Press `Enter` to add_box ..."
	# 	raw_input()
	# 	planner.add_object()
	# 	print "============ Press `Enter` to execute pick ..."
	# 	raw_input()
	# 	planner.pick()
	# 	# print "============ Press `Enter` to attach box ..."
	# 	# raw_input()
	# 	# planner.attach_box()
	# 	print "============ Press `Enter` to place ..."
	# 	raw_input()
	# 	planner.place()
	# 	print "============ Press `Enter` to reset ..."
	# 	raw_input()
	# 	planner.reset()
	# 	print "============ Press `Enter` to execute a movement using a joint state goal ..."
	# 	raw_input()
	# 	planner.go_to_joint_state()
	except rospy.ROSInterruptException:
		return
	except KeyboardInterrupt:
		return

if __name__ == "__main__":
	main()