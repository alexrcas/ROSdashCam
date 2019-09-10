; Auto-generated. Do not edit!


(cl:in-package lane_detector-msg)


;//! \htmlinclude Curve.msg.html

(cl:defclass <Curve> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:float
    :initform 0.0)
   (b
    :reader b
    :initarg :b
    :type cl:float
    :initform 0.0)
   (c
    :reader c
    :initarg :c
    :type cl:float
    :initform 0.0))
)

(cl:defclass Curve (<Curve>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Curve>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Curve)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lane_detector-msg:<Curve> is deprecated: use lane_detector-msg:Curve instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <Curve>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lane_detector-msg:a-val is deprecated.  Use lane_detector-msg:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <Curve>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lane_detector-msg:b-val is deprecated.  Use lane_detector-msg:b instead.")
  (b m))

(cl:ensure-generic-function 'c-val :lambda-list '(m))
(cl:defmethod c-val ((m <Curve>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lane_detector-msg:c-val is deprecated.  Use lane_detector-msg:c instead.")
  (c m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Curve>) ostream)
  "Serializes a message object of type '<Curve>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'a))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'b))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'c))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Curve>) istream)
  "Deserializes a message object of type '<Curve>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'a) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'b) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'c) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Curve>)))
  "Returns string type for a message object of type '<Curve>"
  "lane_detector/Curve")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Curve)))
  "Returns string type for a message object of type 'Curve"
  "lane_detector/Curve")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Curve>)))
  "Returns md5sum for a message object of type '<Curve>"
  "d20f63a7e99cd5689c2dcf93cf2f8085")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Curve)))
  "Returns md5sum for a message object of type 'Curve"
  "d20f63a7e99cd5689c2dcf93cf2f8085")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Curve>)))
  "Returns full string definition for message of type '<Curve>"
  (cl:format cl:nil "float32 a~%float32 b~%float32 c~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Curve)))
  "Returns full string definition for message of type 'Curve"
  (cl:format cl:nil "float32 a~%float32 b~%float32 c~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Curve>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Curve>))
  "Converts a ROS message object to a list"
  (cl:list 'Curve
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
    (cl:cons ':c (c msg))
))
