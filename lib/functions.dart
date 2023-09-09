import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

String UtfCharToBytesSequence(String inChar){
  String result = "";
  List<int> out = utf8.encode(inChar);
  for(int i=out.length;i>0;--i){
    while(out[i-1] > 0){
      result+= (out[i-1]%2).toString();
      out[i-1] = out[i-1] ~/ 2;
    }
  }
  if(result.length<8){
   result = "0"+result;
  }
  return result.split('').reversed.join();
}

String stringToBits(String input){
  String result = "";
  for (var char in input.split('')) {
    result+=UtfCharToBytesSequence(char);
  } 
  return result[result.length-1]+result.substring(0,result.length-1);
}

String md5Decode(String nonce, String secret){
  return md5.convert(utf8.encode(nonce+secret)).toString();
}

