
(cl:in-package :asdf)

(defsystem "lane_detector-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Curve" :depends-on ("_package_Curve"))
    (:file "_package_Curve" :depends-on ("_package"))
    (:file "Lane" :depends-on ("_package_Lane"))
    (:file "_package_Lane" :depends-on ("_package"))
    (:file "Lane_Image" :depends-on ("_package_Lane_Image"))
    (:file "_package_Lane_Image" :depends-on ("_package"))
  ))