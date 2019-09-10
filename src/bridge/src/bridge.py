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
height = 720

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
            
            RegionOfInterestVertices = [(0, height), (width / 2.1, height / 1.6), (width, height),]

            #Pasamos la imagen a escala de grises
            grayImage = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
            #Aplicamos el algoritmo de Canny para detectar bordes
            cannyed_image = cv2.Canny(grayImage, 100, 200)
            #Recortamos la imagen
            croppedImage = self.getRegionOfInterest(cannyed_image, np.array([RegionOfInterestVertices], np.int32), )
            
            #Utilizamos la transformada de Hough para obtener las lineas que necesitamos
            lines = cv2.HoughLinesP(croppedImage, rho=6, theta=np.pi / 60, threshold=160, lines=np.array([]), minLineLength=40, maxLineGap=25)
            
            
            lineImage = self.drawLines(cv_image, lines)
            cv_image = lineImage

        try:
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
        except CvBridgeError as e:
            print(e)

    #Vertices de la region que nos interesa
    def getRegionOfInterest(self, img, vertices):
        mask = np.zeros_like(img)
        match_mask_color = 255
        cv2.fillPoly(mask, vertices, match_mask_color)
        masked_image = cv2.bitwise_and(img, mask)
        return masked_image
    
    #Este metodo dibuja las lineas que recibe como parametro sobre la imagen
    def drawLines(self, img, lines, color=[255, 0, 0], thickness=3):
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
                #La linea es valida unicamente si supera una cierta pendiente
                slope = (y2 - y1) / (x2 - x1)
                if math.fabs(slope) > 0.5:
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