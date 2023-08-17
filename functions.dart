import 'dart:convert';
import 'dart:typed_data';


String IntToBytes(int char){
  //Converts a integer into byte format string
  String result = "";
  
  while(char > 0){
    result+= (char%2).toString();
    char = char ~/ 2;
  }
  return result;
}

String UtfCharToBytes(String inChar){
  //Converts a single character string into byte format string  
  var utfChar = utf8.encode(inChar);
  var char = utfChar[0];
  String result = "";
  
  while(char > 0){
    result+= (char%2).toString();
    char = char ~/ 2;
  }
  return result;
}

String ByteToBites(String nByte){
  var out = UtfCharToBytes(nByte);
  return out.padLeft(1,"0");
}