import 'dart:convert';
import 'dart:math';


Map<String,String> BaseUACPacket = {
  "Head":"",
  "Via":"",
  "From":"",
  "To":"",
  "Call-ID":"",
  "Authorization":"",
  "CSeq":"",
  "Contact":"",
  "Max-Forwards":"",
  "Expires":"",
  "supported":"",
  "User-Agent":"",
  "allow":"",
  "Content-Length":"",
};

Map<String,String> BaseUASPacket = {
  "head":"",
  "Via":"",
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
  
  Map<String?,String?> addField(String field){
    var packet = new Map<String?,String?>.from(BaseUACPacket);
    packet.addEntries({MapEntry(field,"")});
    return packet;
  }

  String buildPacket(Map<String?,String?> q){
    String out = "";
    for (var p in q.values) {
      p!="" ? out+=p!+"\n": out;
    }
    return out;
  }

  Map<String,String> parsePacket(String data){
    List packet=[];
    int k = 0;
    for (int i = 0; i < data.length; i++) {
      if (data[i]=="\n"){
        
        packet.add(data.substring(k,i));
        k=i+1;
      }
    }
    packet.add(data.substring(k,data.length));
    Map<String,String> serializedPacket = new Map();
    List valuses = packet.sublist(1,packet.length);
    serializedPacket.addEntries([MapEntry("Header", packet[0])]);
    for(String item in valuses){
      String key = "", value = "";
      int i = 0;
      while(item[i]!=":"){
            i++;
      }
      key = "${item.substring(0,i)}";
      value = "${item.substring(i+2,item.length)}";
      serializedPacket.addEntries([MapEntry(key,value)]);
    }
    
    return serializedPacket;
  }
}