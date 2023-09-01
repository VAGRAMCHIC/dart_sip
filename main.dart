import 'dart:convert';
import 'dart:io';

import 'functions.dart';
import 'rtp.dart';
import 'socket.dart';

String hexString = File('testPackets\\StringRegisterPacket').readAsStringSync();

void main() {
  print(sendPacket('192.168.31.140', 5060, hexString));
}
