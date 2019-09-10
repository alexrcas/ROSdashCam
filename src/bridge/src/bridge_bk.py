#!/usr/bin/env python
from __future__ import print_function

import roslib
roslib.load_manifest('bridge')
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
import math
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

width = 1280
height = 800

class image_converter:

    def __init__(self):
        self.image_pub = rospy.Publisher("opencv_bridge_output",Image)

        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("image",Image,self.callback)

    def callback(self,data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        

        (rows,cols,channels) = cv_image.shape
        if cols > 60 and rows > 60 :
            
            region_of_interest_vertices = [(0, height), (width / 2, height / 2), (width, height),]


            gray_image = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
            cannyed_image = cv2.Canny(gray_image, 100, 200)
            cropped_image = self.region_of_interest(cannyed_image, np.array([region_of_interest_vertices], np.int32), )
            
            lines = cv2.HoughLinesP(cropped_image, rho=6, theta=np.pi / 60, threshold=160, lines=np.array([]), minLineLength=40, maxLineGap=25)
            line_image = self.draw_lines(cv_image, lines)
            
            cv_image = line_image

        try:
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
        except CvBridgeError as e:
            print(e)

    def region_of_interest(self, img, vertices):
        # Define a blank matrix that matches the image height/width.
        mask = np.zeros_like(img)
        # Retrieve the number of color channels of the image.
        # Create a match color with the same color channel counts.
        match_mask_color = 255
        # Fill inside the polygon
        cv2.fillPoly(mask, vertices, match_mask_color)
        # Returning the image only where mask pixels match
        masked_image = cv2.bitwise_and(img, mask)
        return masked_image
    
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
    rospy.init_node('image_converter', anonymous=True)
    ic = image_converter()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
        cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)