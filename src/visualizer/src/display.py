#!/usr/bin/env python
from __future__ import print_function

import roslib
roslib.load_manifest('bridge')
import sys
import rospy
import cv2
from std_msgs.msg import String, Header
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
        
        self.boxes_sub = rospy.Subscriber("boxes", Detection2DArray, self.drawBoxes, queue_size = 1)

    def callback(self,data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)
        
        try:
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
        except CvBridgeError as e:
            print(e)

    '''
    Aquí me han surgido varios problemas. El primero es que esta es la única forma en que he podido obtener el mensaje
    de ROS, es decir, pasándolo como argumento en el callback del subscriber.
    Intenté hacer dentro de la función callback de arriba algo como:
    objectArray = Detection2DArray(self.boxes_sub)
    intenté varias combinaciones sin éxito.
    El problema que me plantea tener esto así ahora mismo es que necesito la imagen para pintarle las cajitas y ahora
    mismo las variables tienen scopes distintos, y al no ser funciones normales sino cosas "raras" de ROS no sé exactamente
    cuál sería la forma de hacerlo.
    
    Otro problema, es que dado el objeto Detection2D, tiene una serie de propiedades como las que obtengo aquí debajo
    y que parecen bastante intuitivas. Sin embargo, el atributo scores, que representa el nivel de confianza de la predicción
    es un array (ver vision_msgs) y no entiendo por qué.
    Supongo que se me están escapando algunas cosillas pero ¿iría por buen camino para terminar pintando las cajitas?
    '''
    def drawBoxes(self, array):
        for i in range(len(array.detections)):
            detectionObject = array.detections[i]
            bbox = detectionObject.bbox
            center = bbox.center
            print("Dibujar caja en: ", center.x, center.y)
            print("de dimensiones: ", bbox.size_x, bbox.size_y)
    

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
