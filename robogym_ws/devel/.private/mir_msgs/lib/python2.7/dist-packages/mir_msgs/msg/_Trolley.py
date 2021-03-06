# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from mir_msgs/Trolley.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class Trolley(genpy.Message):
  _md5sum = "f7f198bfa8fab1128035d129c5beedb7"
  _type = "mir_msgs/Trolley"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int32 id
float32 length
float32 width
float32 height
float32 offset_locked_wheels
"""
  __slots__ = ['id','length','width','height','offset_locked_wheels']
  _slot_types = ['int32','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       id,length,width,height,offset_locked_wheels

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Trolley, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.id is None:
        self.id = 0
      if self.length is None:
        self.length = 0.
      if self.width is None:
        self.width = 0.
      if self.height is None:
        self.height = 0.
      if self.offset_locked_wheels is None:
        self.offset_locked_wheels = 0.
    else:
      self.id = 0
      self.length = 0.
      self.width = 0.
      self.height = 0.
      self.offset_locked_wheels = 0.

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
      buff.write(_get_struct_i4f().pack(_x.id, _x.length, _x.width, _x.height, _x.offset_locked_wheels))
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
      end += 20
      (_x.id, _x.length, _x.width, _x.height, _x.offset_locked_wheels,) = _get_struct_i4f().unpack(str[start:end])
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
      buff.write(_get_struct_i4f().pack(_x.id, _x.length, _x.width, _x.height, _x.offset_locked_wheels))
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
      end += 20
      (_x.id, _x.length, _x.width, _x.height, _x.offset_locked_wheels,) = _get_struct_i4f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_i4f = None
def _get_struct_i4f():
    global _struct_i4f
    if _struct_i4f is None:
        _struct_i4f = struct.Struct("<i4f")
    return _struct_i4f
