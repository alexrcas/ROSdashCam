# ROSdashCam
## Ojo, recordar que es necesario cambiar la fuente de vídeo en los ficheros roslaunch, porque llevan mi ruta local.

### Actualizaciones
- Se han creado más paquetes y se ha añadido un segundo fichero roslaunch. Si se lanza video.launch se ejecuta el detector que se tenía hasta ahora. Si se lanza split_nodes.launch se lanza el detector por un lado (el cual ahora ya solo publica los objetos de tipo box y no la imagen), y el visualizador por otro. El visualidador está suscrito al vídeo, igual que el detector, pero también lo estará a los mensajes "box" de este último, para que pueda pintar las cajitas encima de la imagen. Por último, el visualizador envía la imagen final al nodo image_view
