import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:isolate';
import 'dart:convert';
import 'package:time/time.dart';



Map<String,String> RTPProtocol = {
  "RTP": "udp",
  "AVP": "RTP/AVP",
  "SAVP": "RTP/SAVP"
};

Map<String,dynamic> TransmitType = {
  "RECVONLY": "recvonly",
    "SENDRECV": "sendrecv",
    "SENDONLY": "sendonly",
    "INACTIVE": "inactive"
};

class PayLoadType{}

class RTPPacketManager{
  //var buffer = 
}


String ByteToBits(String char) {
  var nByte = utf8.encode(char);
  
  return nByte.toString();
}
