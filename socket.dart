/*

*/
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';



enum SendStatus {
  SUCCESS,
  FAILURE,
}

String hexString = File('testPackets\\StringRegisterPacket').readAsStringSync();
String packet = "";

String sendPacket(String ip, int port, String data){
  RawDatagramSocket.bind(InternetAddress.anyIPv4, 49314).then((RawDatagramSocket udpSocket) {
    Uint8List rawAddress = Uint8List.fromList([192,168,31,140]);
    udpSocket.broadcastEnabled=true;
    udpSocket.send(hexString.codeUnits, InternetAddress.fromRawAddress(rawAddress), port);
    
    var packetData = udpSocket.receive()?.data;
    packet = packetData.toString();
    udpSocket.close();
  });
  print(hexString);
  return packet;
}

String receivePacket(String ip, int port){
  String packet = "";
  RawDatagramSocket.bind(InternetAddress.anyIPv4, port).then((RawDatagramSocket udpSocket) {
    udpSocket.broadcastEnabled=true;
    var packetData = udpSocket.receive()?.data;
    packet = packetData.toString();
    udpSocket.close();
  });
  
  return packet;
}
// PacketSequence Предназначен для обработки отдельных цепочек приема и отпрвки пакетов
// читай как отдельный контекст в asterisk
class PacketSequence{}

// В данном классе предполагается асинхронная или мультипоточнаяя отправка/прием пакетов в сети
// Также управление цепочками папкетов (PacketSequence) 
class PacketManager{}
