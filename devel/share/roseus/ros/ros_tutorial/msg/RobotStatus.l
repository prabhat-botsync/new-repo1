;; Auto-generated. Do not edit!


(when (boundp 'ros_tutorial::RobotStatus)
  (if (not (find-package "ROS_TUTORIAL"))
    (make-package "ROS_TUTORIAL"))
  (shadow 'RobotStatus (find-package "ROS_TUTORIAL")))
(unless (find-package "ROS_TUTORIAL::ROBOTSTATUS")
  (make-package "ROS_TUTORIAL::ROBOTSTATUS"))

(in-package "ROS")
;;//! \htmlinclude RobotStatus.msg.html


(defclass ros_tutorial::RobotStatus
  :super ros::object
  :slots (_robot_id _battery _is_loaded ))

(defmethod ros_tutorial::RobotStatus
  (:init
   (&key
    ((:robot_id __robot_id) "")
    ((:battery __battery) 0.0)
    ((:is_loaded __is_loaded) nil)
    )
   (send-super :init)
   (setq _robot_id (string __robot_id))
   (setq _battery (float __battery))
   (setq _is_loaded __is_loaded)
   self)
  (:robot_id
   (&optional __robot_id)
   (if __robot_id (setq _robot_id __robot_id)) _robot_id)
  (:battery
   (&optional __battery)
   (if __battery (setq _battery __battery)) _battery)
  (:is_loaded
   (&optional __is_loaded)
   (if __is_loaded (setq _is_loaded __is_loaded)) _is_loaded)
  (:serialization-length
   ()
   (+
    ;; string _robot_id
    4 (length _robot_id)
    ;; float32 _battery
    4
    ;; bool _is_loaded
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _robot_id
       (write-long (length _robot_id) s) (princ _robot_id s)
     ;; float32 _battery
       (sys::poke _battery (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _is_loaded
       (if _is_loaded (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _robot_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _battery
     (setq _battery (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _is_loaded
     (setq _is_loaded (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ros_tutorial::RobotStatus :md5sum-) "85a94cf16a4b07901025c9058def70e5")
(setf (get ros_tutorial::RobotStatus :datatype-) "ros_tutorial/RobotStatus")
(setf (get ros_tutorial::RobotStatus :definition-)
      "string robot_id
float32 battery
bool is_loaded

")



(provide :ros_tutorial/RobotStatus "85a94cf16a4b07901025c9058def70e5")


