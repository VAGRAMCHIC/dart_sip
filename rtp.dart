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

class PayLoadType{
  PayLoadType(){
    var cls;
    Map<int,String>;
    int channel = 0;
    int clock = 0;
    String description = "";
  }
  
  List<Object> PCMU = [0, 8000, 1, "PCMU"];
  List<Object> GSM = [3, 8000, 1, "GSM"];
  List<Object> G723 = [4, 8000, 1, "G723"];
  List<Object> DVI4_8000 = [5, 8000, 1, "DVI4"];
  List<Object> DVI4_16000 = [6, 16000, 1, "DVI4"];
  List<Object> LPC = [7, 8000, 1, "LPC"];
  List<Object> PCMA = [8, 8000, 1, "PCMA"];
  List<Object> G722 = [9, 8000, 1, "G722"];
  List<Object> L16_2 = [10, 44100, 2, "L16"];
  List<Object> L16 = [11, 44100, 1, "L16"];
  List<Object> QCELP = [12, 8000, 1, "QCELP"];
  List<Object> CN = [13, 8000, 1, "CN"];
  //MPA channel varries, should be defined in the RTP packet.
  List<Object> MPA = [14, 90000, 0, "MPA"];
  List<Object> G728 = [15, 8000, 1, "G728"];
  List<Object> DVI4_11025 = [16, 11025, 1, "DVI4"];
  List<Object> DVI4_22050 = [17, 22050, 1, "DVI4"];
  List<Object> G729 = [18, 8000, 1, "G729"];
  //video
  List<Object> CELB = [25, 90000, 0, "CelB"];
  List<Object> JPEG = [26, 90000, 0, "JPEG"];
  List<Object> NV = [28, 90000, 0, "nv"];
  List<Object> H261 = [31, 90000, 0, "H261"];
  List<Object> MPV = [32, 90000, 0, "MPV"];

  List<Object> MP2T = [33, 90000, 1, "MP2T"];
  List<Object> H263 = [34, 90000, 0, "H263"];
  // Non-codec
  List<Object> EVENT = ["telephone-event", 8000, 0, "telephone-event"];
  List<Object> UNKNOWN = ["UNKNOWN", 0, 0, "UNKNOWN CODEC"];
}

class RTPPacketManager{
  //var buffer = 
}


String ByteToBits(String char) {
  var nByte = utf8.encode(char);
  
  //nByte = ("0"* new String.fromCharCodes(8-nByte.length))+new String.fromCharCodes(nByte);
  return nByte.toString()+"0";
}
