;; Auto-generated. Do not edit!


(when (boundp 'lane_detector::Lane)
  (if (not (find-package "LANE_DETECTOR"))
    (make-package "LANE_DETECTOR"))
  (shadow 'Lane (find-package "LANE_DETECTOR")))
(unless (find-package "LANE_DETECTOR::LANE")
  (make-package "LANE_DETECTOR::LANE"))

(in-package "ROS")
;;//! \htmlinclude Lane.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass lane_detector::Lane
  :super ros::object
  :slots (_header _lane_curves ))

(defmethod lane_detector::Lane
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lane_curves __lane_curves) (let (r) (dotimes (i 0) (push (instance lane_detector::Curve :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _lane_curves __lane_curves)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lane_curves
   (&rest __lane_curves)
   (if (keywordp (car __lane_curves))
       (send* _lane_curves __lane_curves)
     (progn
       (if __lane_curves (setq _lane_curves (car __lane_curves)))
       _lane_curves)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; lane_detector/Curve[] _lane_curves
    (apply #'+ (send-all _lane_curves :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; lane_detector/Curve[] _lane_curves
     (write-long (length _lane_curves) s)
     (dolist (elem _lane_curves)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; lane_detector/Curve[] _lane_curves
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lane_curves (let (r) (dotimes (i n) (push (instance lane_detector::Curve :init) r)) r))
     (dolist (elem- _lane_curves)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get lane_detector::Lane :md5sum-) "195c77843ea3e8095e18ed577fa2d3a2")
(setf (get lane_detector::Lane :datatype-) "lane_detector/Lane")
(setf (get lane_detector::Lane :definition-)
      "Header header
Curve[] lane_curves
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: lane_detector/Curve
float32 a
float32 b
float32 c
")



(provide :lane_detector/Lane "195c77843ea3e8095e18ed577fa2d3a2")


