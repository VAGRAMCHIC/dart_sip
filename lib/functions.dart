import 'dart:convert';
import 'dart:math';

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

