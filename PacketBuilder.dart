import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:crypto/crypto.dart';

const String chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890-_";

enum PacketType{
  REGISTER,  INVITE,  NOTIFY,
  OPTIONS,  SUBSCRIBE,  PUBLISH,
  MESSAGE,  REFER,  UPDATE,
  INFO,  KDMQ
}

class SIPPacketParams{
  String from = "From";
  String to = "To";
  String maxForwards = "Max-Forwards";
  String callID = "Call-ID";
  String cSeq = "CSeq";
  String userAgent = "User-Agent";
  String contact = "Contact";
  String expires = "Expires";
  String contentLength = "Content-Length"; 
  String server = "Server";
  String wwwAuth = "WWW-Authenticate";
  String via = "Via";
  String authorization = "Authorization";
  String date = "Date";
}

enum Protocol{
  SIP,
  UDP,
  TCP,
  TLS
}


// Базоваые параметры пакета.
// Классы пакетов предполагают конструторы строк с возможностью точечного изменения отдельных параметров
class BasePacket{
  Random rnd = Random();
  String callID = "";
  String cSeq = "";
  String maxForwards = "";
  String branch = "";
  String contact = "";

  String getRandomString(int length){  
  return String.fromCharCodes(Iterable.generate(length, 
          (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  void setCallIdString(){
    callID = "Call-ID: ${md5.convert(utf8.encode(getRandomString(25+rnd.nextInt(50))))}";
  }
  String getCallIdString(){return callID;}

  void setCSeqString(PacketType pType){
    cSeq = "CSeq: ${(2000+rnd.nextInt(4294965295)).toString()} ${pType.name}";
  }
  String getCSeqString(){return cSeq;}

  void setMaxForwardsString(){
    maxForwards = "Max-Forwards: 70";
  }
  String getMaxForwardsString(){return maxForwards;}

  void setBranchString(){
    var branchBytes = md5.convert(utf8.encode(getRandomString(32)));
    branch = "z9hG4bK${utf8.decode(branchBytes.bytes)}";
  }
  String getBranchString(){return branch;}

  void setContactString(String sipId, String host){
    contact = "<sip:${sipId}:${host};ob>";
  }
  String getContactString(){return contact;}
}

// Расширенияе базового образа пакета до отправлеяемого типа
class SentPacket extends BasePacket{

  SentPacket(String host, String uasHhost, PacketType pType){
    String UAShost = uasHhost;
  }

  String via = "";
  
  void setViaString(String hostUri, String? rport){
    if(rport==null)
      via = "Via: SIP/2.0/UDP ${hostUri};rport;branch=${branch}";
    else
      via = "Via: SIP/2.0/UDP ${hostUri};rport=${rport};branch=${branch}";
  }
  String getViaString(){return via;}
  
  String setHeaderString(String UAShost){
    return "REGISTER sip:${UAShost} SIP/2.0";
  }


  String buildPacket(){
    //return"${setHeaderString(host)}${}${}${}${}${}";
    return "";
  }

}

// Расширенияе базового образа пакета до принимаемого типа
class RespocePacket extends BasePacket{

}

class ErrorMessageHandler{}



class UserAgent{}

class UserAgentClient{}

class UserAgentServer{}