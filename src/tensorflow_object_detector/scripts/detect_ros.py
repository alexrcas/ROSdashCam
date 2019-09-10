#!/usr/bin/env python

import os
import sys
import cv2
import numpy as np
import tensorflow as tf

import rospy
from std_msgs.msg import String , Header
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from vision_msgs.msg import Detection2D, Detection2DArray, ObjectHypothesisWithPose

import object_detection
from object_detection.utils import label_map_util
from object_detection.utils import visualization_utils as vis_util

# Definicion y configuracion del modelo, grafo, ficheros de etiquetas, etc
MODEL_NAME =  'ssd_mobilenet_v1_coco_11_06_2017'
MODEL_PATH = os.path.join(os.path.dirname(sys.path[0]),'data','models' , MODEL_NAME)
GRAPH_PATH = MODEL_PATH + '/frozen_inference_graph.pb'
LABEL_NAME = 'mscoco_label_map.pbtxt'
LABELS_PATH = os.path.join(os.path.dirname(sys.path[0]),'data','labels', LABEL_NAME)
NUM_CLASSES = 90

detection_graph = tf.Graph()
with detection_graph.as_default():
    od_graph_def = tf.GraphDef()
    with tf.gfile.GFile(GRAPH_PATH, 'rb') as fid:
        serialized_graph = fid.read()
        od_graph_def.ParseFromString(serialized_graph)
        tf.import_graph_def(od_graph_def, name= '')


# Carga del label map
# El label map es un mapa que relaciona las categorias con un numero. Cuando la red predice '5',
# ese valor corresponde a 'avion'. No es necesario programar esta parte porque ya existen las funciones
labelMap = label_map_util.load_labelmap(LABELS_PATH)
categories = label_map_util.convert_label_map_to_categories(labelMap, max_num_classes=NUM_CLASSES, use_display_name = True)
categoryIndex = label_map_util.create_category_index(categories)

# Ajustes de GPU
# En mi caso no es necesario pero es importante e interesante saber que estan ahi
GPU_FRACTION = 0.4
config = tf.ConfigProto()
config.gpu_options.per_process_gpu_memory_fraction = GPU_FRACTION


class Detector:

    def __init__(self):
        self.image_pub = rospy.Publisher("result", Image, queue_size = 1)
        self.object_pub = rospy.Publisher("objects", Detection2DArray, queue_size = 1)
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("image", Image, self.image_cb, queue_size = 1, buff_size = 2**24)
        self.sess = tf.Session(graph = detection_graph, config = config)

    def image_cb(self, data):
        objectArray = Detection2DArray()
        try:
            # Recordar que es necesario el uso de cv_bridge
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)
        image=cv2.cvtColor(cv_image,cv2.COLOR_BGR2RGB)

        # Representamos y guardamos la imagen como un array. Se usara mas tarde para presentar el resultado
        # con las cajas y etiquetas
        npArrayImage = np.asarray(image)

        npArrayImageExpanded = np.expand_dims(npArrayImage, axis = 0)
        image_tensor = detection_graph.get_tensor_by_name('image_tensor:0')
        # Cada caja representa una seccion de la imagen donde un objeto fue detectado
        boxes = detection_graph.get_tensor_by_name('detection_boxes:0')
        # Obtenemos los scores o nivel de confianza de la prediccion
        scores = detection_graph.get_tensor_by_name('detection_scores:0')
        # Obtenemos la clase que tambien sera mostrada junto con el score
        classes = detection_graph.get_tensor_by_name('detection_classes:0')
        num_detections = detection_graph.get_tensor_by_name('num_detections:0')
        print("Detectando!")
 
        (boxes, scores, classes, num_detections) = self.sess.run([boxes, scores, classes, num_detections], feed_dict = {image_tensor: npArrayImageExpanded})

        objects = vis_util.visualize_boxes_and_labels_on_image_array(
            image,
            np.squeeze(boxes),
            np.squeeze(classes).astype(np.int32),
            np.squeeze(scores),
            categoryIndex,
            use_normalized_coordinates = True,
            line_thickness=2)

        # NOTA: esto podria ser interesante. Leer el comentario largo en la funcion object_predict mas abajo.
        objectArray.detections = []
        objectArray.header = data.header
        object_count = 1

        for i in range(len(objects)):
            object_count += 1
            objectArray.detections.append(self.object_predict(objects[i], data.header, npArrayImage, cv_image))

        self.object_pub.publish(objectArray)

        img=cv2.cvtColor(npArrayImage, cv2.COLOR_BGR2RGB)
        image_out = Image()
        try:
            # Volvemos a convertir la imagen de OpenCV a mensaje de ROS
            image_out = self.bridge.cv2_to_imgmsg(img, "bgr8")
        except CvBridgeError as e:
            print(e)
        image_out.header = data.header
        self.image_pub.publish(image_out)


    def object_predict(self, object_data, header, npArrayImage, image):
        image_height, image_width, channels = image.shape
        obj=Detection2D()
        obj_hypothesis= ObjectHypothesisWithPose()

        object_id=object_data[0]
        object_score=object_data[1]
        dimensions=object_data[2]

        obj.header=header
        obj_hypothesis.id = object_id
        obj_hypothesis.score = object_score
        obj.results.append(obj_hypothesis)
        obj.bbox.size_y = int((dimensions[2]-dimensions[0])*image_height)
        obj.bbox.size_x = int((dimensions[3]-dimensions[1] )*image_width)
        obj.bbox.center.x = int((dimensions[1] + dimensions [3])*image_height/2)
        obj.bbox.center.y = int((dimensions[0] + dimensions[2])*image_width/2)

        return obj

def main(args):
    rospy.init_node('detector_node')
    obj=Detector()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Exit")
    cv2.destroyAllWindows()

if __name__=='__main__':
    main(sys.argv)
