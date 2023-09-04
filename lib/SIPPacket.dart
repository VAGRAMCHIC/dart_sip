import 'dart:convert';
import 'dart:math';


Map<String,String> BaseUACPacket = {
  "via":"",
  "from":"",
  "to":"",
  "callSeq":"",
  "contact":"",
  "maxForwards":"",
  "expires":"",
  "supported":"",
  "userAgent":"",
  "allow":"",
  "contentLen":"",
};

Map<String,String> BaseUASPacket = {
  "via":"",
  "from":"",
  "to":"",
  "callSeq":"",
  "server":"",
  "allow":"",
  "supported":"",
  "wwwAuth":"",
  "contentLen":"",
};


class PacketHandler {
  
  Map<String?,String?> updateUASPacket(Map<String,String> args){
    var packet = new Map<String?,String?>.from(BaseUASPacket);
    for (var arg in args.keys) {
      packet[arg] = args[arg];
    }
    return packet;
  }

  Map<String?,String?> updateUACPacket(Map<String,String> args){
    var packet = new Map<String?,String?>.from(BaseUACPacket);
    for (var arg in args.keys) {
      packet[arg] = args[arg];
    }
    return packet;
  }
  
  String buildPacket(Map<String?,String?> q){
    String out = "";
    for (var p in q.values) {
      p!="" ? out+=p!+"\n": out;
    }
    return out;
  }
}