void main() {

  List resultInt = IntInString().intInText('car 1 3344 1000 dog 6 7 cat 9 0 *');
  print(resultInt);

}

class IntInString {

  List intInText(String txt) {
    Iterable<String> arrayText = txt.split(' ');
    List arrayInt = [];
    for (var element in arrayText) {
      num? isInt = num.tryParse(element);
      if (isInt != null) {
        arrayInt.add(isInt);
      }
    }
    return arrayInt;
  }
}