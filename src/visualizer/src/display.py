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
from vision_msgs.msg import Detection2D, Detection2DArray, ObjectHypothesisWithPose



class image_converter:

    def __init__(self):
        self.image_pub = rospy.Publisher("visualizer_output",Image)

        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("image", Image, self.callback)
        
        self.boxes_sub = rospy.Subscriber("boxes", Detection2DArray, queue_size = 1)

    def callback(self,data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)
          
        # Se supone que aqui recibimos el Detection2DArray, que esta compuesto de objetos Object2D para pintarlos
        # He probado un par de cosas pero no funciona del todo, obtengo tipos de datos raros, obtengo excepciones...
        # imagino que los tiros deberian ir por algo asi
        objectsArray =  Detection2DArray(self.boxes_sub)
        # Recorremos el array y para cada objeto obtenemos su propiedad center y size y lo pintamos mediante openCV o lo que sea
        # ...
        
        try:
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
        except CvBridgeError as e:
            print(e)


    

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
