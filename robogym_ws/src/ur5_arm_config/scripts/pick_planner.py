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

		self.planning_frame = move_group.get_planning_frame()
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


	def add_object(self, timeout=4):
		box_name = self.box_name
		scene = self.scene

		box_pose = geometry_msgs.msg.Pose()
		box_pose.position.x = 0.5
		box_pose.position.y = 0.0
		box_pose.position.z = 0.5
		scene.add_box("object", box_pose, size=(0.1, 0.1, 0.1))

	def openGripper(self, posture):
		posture.joint_names = ["ur5_finger_joint1", "ur5_finger_joint2"]

		posture.points = list()
		point = JointTrajecotryPoint()
		point.positions = [0.06, 0.06]
		point.time_from_start = Duration(0.5)
		
		posture.points.append(point)

	def closeGripper(self, posture):
		posture.joint_names = ["ur5_finger_joint1", "ur5_finger_joint2"]

		posture.points = list()
		point = JointTrajecotryPoint()
		point.positions = [0.0, 0.0]
		point.time_from_start = Duration(0.5)
		
		posture.points.append(point)


	def pick(self):
		move_group = self.move_group
		grasps = []
		g = Grasp()
		grasp_post = geometry_msgs.msg.PoseStamped()
		grasp_post.header.frame_id = "base_link"
		grasp_post.pose.position.x = 0.415
		grasp_post.pose.position.y = 0
		grasp_post.pose.position.z = 0.5
		quaternion = tf.transformations.quaternion_from_euler(-pi/2, -pi/4, -pi/2)
		grasp_post.pose.orientation.x = quaternion[0]
		grasp_post.pose.orientation.y = quaternion[1]
		grasp_post.pose.orientation.z = quaternion[2]
		grasp_post.pose.orientation.w = quaternion[3]

		g.grasp_pose = grasp_pose

		g.pre_grasp_approach.direction.header.frame_id = "base_link"
		g.pre_grasp_approach.direction.vector.x = 1.0;
		g.pre_grasp_approach.min_distance = 0.095;
		g.pre_grasp_approach.desired_distance = 0.115;

		g.post_grasp_approach.direction.header.frame_id = "base_link"
		g.post_grasp_retreat.direction.vector.z = 1.0;
		g.post_grasp_retreat.min_distance = 0.1;
		g.post_grasp_retreat.desired_distance = 0.25;

		openGripper(g.pre_grasp_approach)
		closeGripper(g.grasps_post)

		grasps.append(g)

		move_group.pick("object", grasps)

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
		print "============ Press `Enter` to add_box ..."
		raw_input()
		planner.add_object()
		print "============ Press `Enter` to execute pick ..."
		raw_input()
		planner.pick()

	except rospy.ROSInterruptException:
		return
	except KeyboardInterrupt:
		return


if __name__ == "__main__":
	main()