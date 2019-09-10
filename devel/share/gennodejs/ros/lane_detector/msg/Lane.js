// Auto-generated. Do not edit!

// (in-package lane_detector.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Curve = require('./Curve.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Lane {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.lane_curves = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('lane_curves')) {
        this.lane_curves = initObj.lane_curves
      }
      else {
        this.lane_curves = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Lane
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [lane_curves]
    // Serialize the length for message field [lane_curves]
    bufferOffset = _serializer.uint32(obj.lane_curves.length, buffer, bufferOffset);
    obj.lane_curves.forEach((val) => {
      bufferOffset = Curve.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Lane
    let len;
    let data = new Lane(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [lane_curves]
    // Deserialize array length for message field [lane_curves]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.lane_curves = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.lane_curves[i] = Curve.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 12 * object.lane_curves.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lane_detector/Lane';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '195c77843ea3e8095e18ed577fa2d3a2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    Curve[] lane_curves
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: lane_detector/Curve
    float32 a
    float32 b
    float32 c
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Lane(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.lane_curves !== undefined) {
      resolved.lane_curves = new Array(msg.lane_curves.length);
      for (let i = 0; i < resolved.lane_curves.length; ++i) {
        resolved.lane_curves[i] = Curve.Resolve(msg.lane_curves[i]);
      }
    }
    else {
      resolved.lane_curves = []
    }

    return resolved;
    }
};

module.exports = Lane;
