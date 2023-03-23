void main() {
  List <num>? arrayInt = [];
  arrayInt = NumInString().numInText('car 1 3344 1000 dog 6 7 cat 9 0 *');
  print(arrayInt);
}


class NumInString {

  List <num>? numInText(String txt) {
    Iterable<String> arrayText = txt.split(' ');
    List <num>? arrayInt = [];
    for (var element in arrayText) {
      num? isNum= num.tryParse(element);
      if (isNum != null) {
        arrayInt.add(isNum);
      }
    }
    return arrayInt;
  }
}