import 'dart:math';

import 'SIPPacket.dart';


class Sequence{
  int CSeq = 0;

  Map<String, String> newSequence(int? q){
   q == null ? CSeq = getRandomNum(): CSeq = q;
    return {"":""};
  }

  Sequence updateSequence(int q){
    CSeq = q;
    return this;
  }

  int getRandomNum(){
    final rand=Random();
    return rand.nextInt(2147483648);
  }
}
