# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from mir_msgs/MissionCtrlState.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class MissionCtrlState(genpy.Message):
  _md5sum = "ebe4dc80faabdec3ee007c4111ff87dd"
  _type = "mir_msgs/MissionCtrlState"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """uint8 STATE_IDLE = 0
uint8 STATE_WAIT_POS_LOCK = 1
uint8 STATE_WAIT_AREA_LOCK = 2
uint8 STATE_WAIT_MAP_TRANSITION = 10
uint8 STATE_WAIT_LIFT_START_FLOOR = 11
uint8 STATE_WAIT_LIFT_END_FLOOR = 12

int32 state
int32 pos_id
"""
  # Pseudo-constants
  STATE_IDLE = 0
  STATE_WAIT_POS_LOCK = 1
  STATE_WAIT_AREA_LOCK = 2
  STATE_WAIT_MAP_TRANSITION = 10
  STATE_WAIT_LIFT_START_FLOOR = 11
  STATE_WAIT_LIFT_END_FLOOR = 12

  __slots__ = ['state','pos_id']
  _slot_types = ['int32','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       state,pos_id

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(MissionCtrlState, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.state is None:
        self.state = 0
      if self.pos_id is None:
        self.pos_id = 0
    else:
      self.state = 0
      self.pos_id = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_2i().pack(_x.state, _x.pos_id))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 8
      (_x.state, _x.pos_id,) = _get_struct_2i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_2i().pack(_x.state, _x.pos_id))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 8
      (_x.state, _x.pos_id,) = _get_struct_2i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2i = None
def _get_struct_2i():
    global _struct_2i
    if _struct_2i is None:
        _struct_2i = struct.Struct("<2i")
    return _struct_2i
