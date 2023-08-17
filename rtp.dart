import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:isolate';
import 'dart:convert';
import 'package:time/time.dart';

String ByteToBits(String char) {
  var nByte = utf8.encode(char);
  return nByte.toString();
}
