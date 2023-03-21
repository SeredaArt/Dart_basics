void main() {

  List<String> list = ['car', 'cat', 'dog', 'cat', 'mail', 'phone', 'apple', 'mail', 'cat'];
  var outMap = <String, int>{};
  outMap = WordInText().runCalcWords(list);
  print(outMap);

}

class WordInText {

  var outMap = <String, int>{};

  runCalcWords(Iterable<String> txt) {

    for (var element in txt) {
      if (outMap.containsKey(element)) {
        int valueWord = outMap[element]!;
        outMap[element] = valueWord + 1;
      }
      else {
        outMap[element] = 1;
      }
    }
    return outMap;
  }
}