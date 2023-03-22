import 'dart:math';

void main() {
  BinaryCalc bin = BinaryCalc();
  String answer = bin.toBin(256);
  print("Число в двоичной: $answer");

  String answer2 = bin.toBin(-256);
  print("Число в двоичной: $answer2");

  num decAnswer = bin.toDec("1010011010");
  print("Число в десятичной: $decAnswer");

  num decAnswer2 = bin.toDec("-1010011010");
  print("Число в десятичной: $decAnswer2");
}

class BinaryCalc {

  String toBin(int a) {
    int ost = 0;
    var result = "";

    int b = a.abs();
    while (b > 0) {
      ost = (b % 2);
      b = b ~/ 2;
      result = ost.toString() + result;
    }
    if (a<0) {
      result = '-$result';
    }

    return result;
  }

  num toDec(String binary) {
    bool inv = false;
    num dec = 0;
    if (binary[0] == '-') {
      binary = binary.replaceAll('-', '');
      inv = true;
    }
    int length = binary.length;
    int n = length;
    for (int i = 0; i <= length-1; i++) {
      n = n-1;
      var last = int.tryParse(binary[n]);
      dec =  last! * pow(2 , i) + dec;
    }
    return dec = inv? -dec : dec;
  }
}