# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "lane_detector: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ilane_detector:/home/alex/catkin_ws/src/LaneNetRos/msg;-Istd_msgs:/opt/ros/lunar/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/lunar/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/lunar/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lane_detector_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg" NAME_WE)
add_custom_target(_lane_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lane_detector" "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg" ""
)

get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg" NAME_WE)
add_custom_target(_lane_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lane_detector" "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg" "lane_detector/Curve:std_msgs/Header"
)

get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg" NAME_WE)
add_custom_target(_lane_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lane_detector" "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg" "sensor_msgs/Image:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lane_detector
)
_generate_msg_cpp(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/lunar/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lane_detector
)
_generate_msg_cpp(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lane_detector
)

### Generating Services

### Generating Module File
_generate_module_cpp(lane_detector
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lane_detector
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lane_detector_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lane_detector_generate_messages lane_detector_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_cpp _lane_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_cpp _lane_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_cpp _lane_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lane_detector_gencpp)
add_dependencies(lane_detector_gencpp lane_detector_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lane_detector_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lane_detector
)
_generate_msg_eus(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/lunar/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lane_detector
)
_generate_msg_eus(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lane_detector
)

### Generating Services

### Generating Module File
_generate_module_eus(lane_detector
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lane_detector
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(lane_detector_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(lane_detector_generate_messages lane_detector_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_eus _lane_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_eus _lane_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_eus _lane_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lane_detector_geneus)
add_dependencies(lane_detector_geneus lane_detector_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lane_detector_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lane_detector
)
_generate_msg_lisp(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/lunar/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lane_detector
)
_generate_msg_lisp(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lane_detector
)

### Generating Services

### Generating Module File
_generate_module_lisp(lane_detector
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lane_detector
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lane_detector_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lane_detector_generate_messages lane_detector_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_lisp _lane_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_lisp _lane_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_lisp _lane_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lane_detector_genlisp)
add_dependencies(lane_detector_genlisp lane_detector_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lane_detector_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lane_detector
)
_generate_msg_nodejs(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/lunar/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lane_detector
)
_generate_msg_nodejs(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lane_detector
)

### Generating Services

### Generating Module File
_generate_module_nodejs(lane_detector
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lane_detector
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(lane_detector_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(lane_detector_generate_messages lane_detector_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_nodejs _lane_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_nodejs _lane_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_nodejs _lane_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lane_detector_gennodejs)
add_dependencies(lane_detector_gennodejs lane_detector_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lane_detector_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lane_detector
)
_generate_msg_py(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/lunar/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lane_detector
)
_generate_msg_py(lane_detector
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg;/opt/ros/lunar/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lane_detector
)

### Generating Services

### Generating Module File
_generate_module_py(lane_detector
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lane_detector
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lane_detector_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lane_detector_generate_messages lane_detector_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Curve.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_py _lane_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_py _lane_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/catkin_ws/src/LaneNetRos/msg/Lane_Image.msg" NAME_WE)
add_dependencies(lane_detector_generate_messages_py _lane_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lane_detector_genpy)
add_dependencies(lane_detector_genpy lane_detector_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lane_detector_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lane_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lane_detector
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(lane_detector_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(lane_detector_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lane_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lane_detector
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(lane_detector_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(lane_detector_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lane_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lane_detector
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(lane_detector_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(lane_detector_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lane_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lane_detector
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(lane_detector_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(lane_detector_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lane_detector)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lane_detector\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lane_detector
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(lane_detector_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(lane_detector_generate_messages_py sensor_msgs_generate_messages_py)
endif()
