#!/usr/bin/env python
from __future__ import print_function

import roslib
roslib.load_manifest('bridge')
import sys
import rospy
import cv2
from std_msgs.msg import String, Header
from std_msgs.msg import Int32MultiArray
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
import math
from vision_msgs.msg import Detection2D, Detection2DArray, ObjectHypothesisWithPose



class image_converter:

    def __init__(self):
        self.image_pub = rospy.Publisher("visualizer_output",Image)

        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("image", Image, self.callback)
        self.lanes_sub = rospy.Subscriber("lanes", Int32MultiArray, self.drawLanes)
        
        self.boxes_sub = rospy.Subscriber("boxes", Detection2DArray, self.drawBoxes, queue_size = 1)
        self.detection = ''
        self.laneData = ''

    def callback(self,data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
            if self.detection:

                print(self.detection.detections.classes)
        except CvBridgeError as e:
            print(e)
            
        if self.laneData != None:
            self.draw_lines(cv_image, self.laneData.data)
        
        try:
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
        except CvBridgeError as e:
            print(e)


    def drawBoxes(self, array):
        for i in range(len(array.detections)):
            '''
            detectionObject = array.detections[i]
            bbox = detectionObject.bbox
            center = bbox.center
            print("Dibujar caja en: ", center.x, center.y)
            print("de dimensiones: ", bbox.size_x, bbox.size_y)
            self.detection = detectionObject
            '''
        self.detection = array
        
    def drawLanes(self, data):
        self.laneData = data
 
        
    def draw_lines(self, img, lines, color=[255, 0, 0], thickness=3):
        if lines is None:
            return
        img = np.copy(img)
        line_img = np.zeros(
            (
                img.shape[0],
                img.shape[1],
                3
            ),
            dtype=np.uint8,
        )
        for line in lines:
            for x1, y1, x2, y2 in line:
                cv2.line(line_img, (x1, y1), (x2, y2), color, thickness)
        img = cv2.addWeighted(img, 0.8, line_img, 1.0, 0.0)
        return img
    

def main(args):
    rospy.init_node('visualizer', anonymous=True)
    ic = image_converter()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
        cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)