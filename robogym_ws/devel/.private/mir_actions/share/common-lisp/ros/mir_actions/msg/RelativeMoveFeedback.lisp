; Auto-generated. Do not edit!


(cl:in-package mir_actions-msg)


;//! \htmlinclude RelativeMoveFeedback.msg.html

(cl:defclass <RelativeMoveFeedback> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:fixnum
    :initform 0)
   (current_goal
    :reader current_goal
    :initarg :current_goal
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (dist_to_goal
    :reader dist_to_goal
    :initarg :dist_to_goal
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass RelativeMoveFeedback (<RelativeMoveFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RelativeMoveFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RelativeMoveFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mir_actions-msg:<RelativeMoveFeedback> is deprecated: use mir_actions-msg:RelativeMoveFeedback instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <RelativeMoveFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mir_actions-msg:state-val is deprecated.  Use mir_actions-msg:state instead.")
  (state m))

(cl:ensure-generic-function 'current_goal-val :lambda-list '(m))
(cl:defmethod current_goal-val ((m <RelativeMoveFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mir_actions-msg:current_goal-val is deprecated.  Use mir_actions-msg:current_goal instead.")
  (current_goal m))

(cl:ensure-generic-function 'dist_to_goal-val :lambda-list '(m))
(cl:defmethod dist_to_goal-val ((m <RelativeMoveFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mir_actions-msg:dist_to_goal-val is deprecated.  Use mir_actions-msg:dist_to_goal instead.")
  (dist_to_goal m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<RelativeMoveFeedback>)))
    "Constants for message type '<RelativeMoveFeedback>"
  '((:DOCKING . 0)
    (:COLLISION . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'RelativeMoveFeedback)))
    "Constants for message type 'RelativeMoveFeedback"
  '((:DOCKING . 0)
    (:COLLISION . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RelativeMoveFeedback>) ostream)
  "Serializes a message object of type '<RelativeMoveFeedback>"
  (cl:let* ((signed (cl:slot-value msg 'state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'current_goal) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'dist_to_goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RelativeMoveFeedback>) istream)
  "Deserializes a message object of type '<RelativeMoveFeedback>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'current_goal) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'dist_to_goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RelativeMoveFeedback>)))
  "Returns string type for a message object of type '<RelativeMoveFeedback>"
  "mir_actions/RelativeMoveFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RelativeMoveFeedback)))
  "Returns string type for a message object of type 'RelativeMoveFeedback"
  "mir_actions/RelativeMoveFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RelativeMoveFeedback>)))
  "Returns md5sum for a message object of type '<RelativeMoveFeedback>"
  "95b697bacf828ff88c46362efe2f6b7e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RelativeMoveFeedback)))
  "Returns md5sum for a message object of type 'RelativeMoveFeedback"
  "95b697bacf828ff88c46362efe2f6b7e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RelativeMoveFeedback>)))
  "Returns full string definition for message of type '<RelativeMoveFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback~%int8 DOCKING = 0~%int8 COLLISION = 1~%int8 state~%geometry_msgs/PoseStamped current_goal~%geometry_msgs/PoseStamped dist_to_goal~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RelativeMoveFeedback)))
  "Returns full string definition for message of type 'RelativeMoveFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback~%int8 DOCKING = 0~%int8 COLLISION = 1~%int8 state~%geometry_msgs/PoseStamped current_goal~%geometry_msgs/PoseStamped dist_to_goal~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RelativeMoveFeedback>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'current_goal))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'dist_to_goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RelativeMoveFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'RelativeMoveFeedback
    (cl:cons ':state (state msg))
    (cl:cons ':current_goal (current_goal msg))
    (cl:cons ':dist_to_goal (dist_to_goal msg))
))