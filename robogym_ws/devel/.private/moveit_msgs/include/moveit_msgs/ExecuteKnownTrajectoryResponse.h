// Generated by gencpp from file moveit_msgs/ExecuteKnownTrajectoryResponse.msg
// DO NOT EDIT!


#ifndef MOVEIT_MSGS_MESSAGE_EXECUTEKNOWNTRAJECTORYRESPONSE_H
#define MOVEIT_MSGS_MESSAGE_EXECUTEKNOWNTRAJECTORYRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <moveit_msgs/MoveItErrorCodes.h>

namespace moveit_msgs
{
template <class ContainerAllocator>
struct ExecuteKnownTrajectoryResponse_
{
  typedef ExecuteKnownTrajectoryResponse_<ContainerAllocator> Type;

  ExecuteKnownTrajectoryResponse_()
    : error_code()  {
    }
  ExecuteKnownTrajectoryResponse_(const ContainerAllocator& _alloc)
    : error_code(_alloc)  {
  (void)_alloc;
    }



   typedef  ::moveit_msgs::MoveItErrorCodes_<ContainerAllocator>  _error_code_type;
  _error_code_type error_code;





  typedef boost::shared_ptr< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ExecuteKnownTrajectoryResponse_

typedef ::moveit_msgs::ExecuteKnownTrajectoryResponse_<std::allocator<void> > ExecuteKnownTrajectoryResponse;

typedef boost::shared_ptr< ::moveit_msgs::ExecuteKnownTrajectoryResponse > ExecuteKnownTrajectoryResponsePtr;
typedef boost::shared_ptr< ::moveit_msgs::ExecuteKnownTrajectoryResponse const> ExecuteKnownTrajectoryResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator1> & lhs, const ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator2> & rhs)
{
  return lhs.error_code == rhs.error_code;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator1> & lhs, const ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace moveit_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a367304b29bf35b99db616894f470bab";
  }

  static const char* value(const ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa367304b29bf35b9ULL;
  static const uint64_t static_value2 = 0x9db616894f470babULL;
};

template<class ContainerAllocator>
struct DataType< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "moveit_msgs/ExecuteKnownTrajectoryResponse";
  }

  static const char* value(const ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"# Error code - encodes the overall reason for failure\n"
"MoveItErrorCodes error_code\n"
"\n"
"\n"
"================================================================================\n"
"MSG: moveit_msgs/MoveItErrorCodes\n"
"int32 val\n"
"\n"
"# overall behavior\n"
"int32 SUCCESS=1\n"
"int32 FAILURE=99999\n"
"\n"
"int32 PLANNING_FAILED=-1\n"
"int32 INVALID_MOTION_PLAN=-2\n"
"int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3\n"
"int32 CONTROL_FAILED=-4\n"
"int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5\n"
"int32 TIMED_OUT=-6\n"
"int32 PREEMPTED=-7\n"
"\n"
"# planning & kinematics request errors\n"
"int32 START_STATE_IN_COLLISION=-10\n"
"int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11\n"
"\n"
"int32 GOAL_IN_COLLISION=-12\n"
"int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13\n"
"int32 GOAL_CONSTRAINTS_VIOLATED=-14\n"
"\n"
"int32 INVALID_GROUP_NAME=-15\n"
"int32 INVALID_GOAL_CONSTRAINTS=-16\n"
"int32 INVALID_ROBOT_STATE=-17\n"
"int32 INVALID_LINK_NAME=-18\n"
"int32 INVALID_OBJECT_NAME=-19\n"
"\n"
"# system errors\n"
"int32 FRAME_TRANSFORM_FAILURE=-21\n"
"int32 COLLISION_CHECKING_UNAVAILABLE=-22\n"
"int32 ROBOT_STATE_STALE=-23\n"
"int32 SENSOR_INFO_STALE=-24\n"
"int32 COMMUNICATION_FAILURE=-25\n"
"\n"
"# kinematics errors\n"
"int32 NO_IK_SOLUTION=-31\n"
;
  }

  static const char* value(const ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.error_code);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ExecuteKnownTrajectoryResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::moveit_msgs::ExecuteKnownTrajectoryResponse_<ContainerAllocator>& v)
  {
    s << indent << "error_code: ";
    s << std::endl;
    Printer< ::moveit_msgs::MoveItErrorCodes_<ContainerAllocator> >::stream(s, indent + "  ", v.error_code);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOVEIT_MSGS_MESSAGE_EXECUTEKNOWNTRAJECTORYRESPONSE_H
