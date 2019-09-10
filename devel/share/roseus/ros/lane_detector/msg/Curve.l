;; Auto-generated. Do not edit!


(when (boundp 'lane_detector::Curve)
  (if (not (find-package "LANE_DETECTOR"))
    (make-package "LANE_DETECTOR"))
  (shadow 'Curve (find-package "LANE_DETECTOR")))
(unless (find-package "LANE_DETECTOR::CURVE")
  (make-package "LANE_DETECTOR::CURVE"))

(in-package "ROS")
;;//! \htmlinclude Curve.msg.html


(defclass lane_detector::Curve
  :super ros::object
  :slots (_a _b _c ))

(defmethod lane_detector::Curve
  (:init
   (&key
    ((:a __a) 0.0)
    ((:b __b) 0.0)
    ((:c __c) 0.0)
    )
   (send-super :init)
   (setq _a (float __a))
   (setq _b (float __b))
   (setq _c (float __c))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:c
   (&optional __c)
   (if __c (setq _c __c)) _c)
  (:serialization-length
   ()
   (+
    ;; float32 _a
    4
    ;; float32 _b
    4
    ;; float32 _c
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _a
       (sys::poke _a (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _b
       (sys::poke _b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _c
       (sys::poke _c (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _a
     (setq _a (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _b
     (setq _b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _c
     (setq _c (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get lane_detector::Curve :md5sum-) "d20f63a7e99cd5689c2dcf93cf2f8085")
(setf (get lane_detector::Curve :datatype-) "lane_detector/Curve")
(setf (get lane_detector::Curve :definition-)
      "float32 a
float32 b
float32 c
")



(provide :lane_detector/Curve "d20f63a7e99cd5689c2dcf93cf2f8085")


