import 'dart:convert';
import 'dart:io';

import 'lib/SIPPacket.dart';
import 'rtp.dart';
import 'socket.dart';

String hexString = File('testPackets\\StringRegisterPacket').readAsStringSync();

void main() {
  //print(sendPacket('192.168.31.140', 5060, hexString));
  var packetHandler = new PacketHandler();
  var packet = packetHandler.updateUACPacket({"via":"vagramchic",
                                                "to":"himself",
                                                "supported":"shiza"});
  print(packetHandler.buildPacket(packet));
}
