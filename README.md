# ROSdashCam

## Ojo
- Es necesario cambiar la ruta del vídeo en los ficheros .launch porque tienen la ruta local de mi equipo.

## Actualización
- Se ha preparado a comenzar el proyecto para el paralelismo de los nodos.
- He creado un nodo detector que es igual pero sin publicar la imagen, sino que solamente publica las "boxes", se supone.
- He creado un nodo visualizer que está suscrito al nodo de vídeo pero también al nodo detector (y en el futuro lo estará al detector de carril). Pintará todo sobre el vídeo y lo emitirá para que como siempre, lo recoja y muestre el nodo
image_view.
- Si se lanza video.launch, se ejecuta el detector tradicional (pipeline). Si se lanza split_nodes.launch se ejecutan
estos nuevos nodos. El flujo funciona pero el nodo visualizer no pinta las cajitas, porque no sé exactamente cómo hacerlo
Tengo algunas dudas con el tema de los mensajes. Ver el código fuente del nodo visualizer.

## De cara al futuro
Dejo apuntado esto a modo de idea para no olvidarme.
El nodo visualizer en realidad sería nuestro HUD, ya que cualquier cosa se pintará ahí.
He visto que en ROS hay un paquete llamado **bond** (no sé si será exactamente lo que busco) que sirve para monitorizar nodos, si no he entendido mal. Me gustaría pintar en pantalla entre otras cosas, los nodos en ejecución y su estado, es decir, que se vea en una esquina algo como
- *DETECTOR DE PERSONAS [RUNNING]*
- *DETECTOR DE CARRIL [RUNNING]*
- *DETECTOR DE GATITOS [CAÍDO(RECUPERANDO)]*
Podría emitirse un aviso en rojo cuando un nodo cayese, o algo así.
