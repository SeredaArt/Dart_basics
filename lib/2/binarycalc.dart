import 'dart:math';

void main() {
  BinaryCalc bin = BinaryCalc();
  String answer = bin.toBin(256);
  print("Число в двоичной: $answer");

  num decAnswer = bin.toDec("1010011010");
  print("Число в десятичной: $decAnswer");
}

class BinaryCalc {

  toBin(int a) {
    int ost = 0;
    var result = "";
    while (a > 0) {
      ost = (a % 2);
      a = a ~/ 2;
      result = ost.toString() + result;
    }
    return result;
  }

  toDec(String binary) {
    int length = binary.length;
    num dec = 0;
    int n = length;
    for (int i = 0; i <= length - 1; i++) {
      n = n - 1;
      var last = int.tryParse(binary[n]);
      dec = last! * pow(2, i) + dec;
    }
    return dec;
  }

}