; Auto-generated. Do not edit!


(cl:in-package lane_detector-msg)


;//! \htmlinclude Lane_Image.msg.html

(cl:defclass <Lane_Image> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (original_image
    :reader original_image
    :initarg :original_image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (lane_mask
    :reader lane_mask
    :initarg :lane_mask
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Lane_Image (<Lane_Image>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Lane_Image>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Lane_Image)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lane_detector-msg:<Lane_Image> is deprecated: use lane_detector-msg:Lane_Image instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Lane_Image>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lane_detector-msg:header-val is deprecated.  Use lane_detector-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'original_image-val :lambda-list '(m))
(cl:defmethod original_image-val ((m <Lane_Image>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lane_detector-msg:original_image-val is deprecated.  Use lane_detector-msg:original_image instead.")
  (original_image m))

(cl:ensure-generic-function 'lane_mask-val :lambda-list '(m))
(cl:defmethod lane_mask-val ((m <Lane_Image>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lane_detector-msg:lane_mask-val is deprecated.  Use lane_detector-msg:lane_mask instead.")
  (lane_mask m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Lane_Image>) ostream)
  "Serializes a message object of type '<Lane_Image>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'original_image) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'lane_mask) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Lane_Image>) istream)
  "Deserializes a message object of type '<Lane_Image>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'original_image) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'lane_mask) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Lane_Image>)))
  "Returns string type for a message object of type '<Lane_Image>"
  "lane_detector/Lane_Image")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Lane_Image)))
  "Returns string type for a message object of type 'Lane_Image"
  "lane_detector/Lane_Image")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Lane_Image>)))
  "Returns md5sum for a message object of type '<Lane_Image>"
  "ba6c3de8d4d49b2a6f0c4fbd559c12fc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Lane_Image)))
  "Returns md5sum for a message object of type 'Lane_Image"
  "ba6c3de8d4d49b2a6f0c4fbd559c12fc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Lane_Image>)))
  "Returns full string definition for message of type '<Lane_Image>"
  (cl:format cl:nil "Header header~%sensor_msgs/Image original_image~%sensor_msgs/Image lane_mask~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Lane_Image)))
  "Returns full string definition for message of type 'Lane_Image"
  (cl:format cl:nil "Header header~%sensor_msgs/Image original_image~%sensor_msgs/Image lane_mask~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Lane_Image>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'original_image))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'lane_mask))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Lane_Image>))
  "Converts a ROS message object to a list"
  (cl:list 'Lane_Image
    (cl:cons ':header (header msg))
    (cl:cons ':original_image (original_image msg))
    (cl:cons ':lane_mask (lane_mask msg))
))
