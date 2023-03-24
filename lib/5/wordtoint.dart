void main() {
  List<String> list2 = [
    'one',
    'two',
    'zero',
    'zero',
    'mail',
    'phone',
    'seven',
    'nine'
  ];
  var outSet = WordToInt().toInt(list2);
  print(outSet);
}

class WordToInt {
  var mapIntWord = {
    "zero": 0,
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9
  };

  Set outSet = {};

  Set toInt(Iterable<String> txt) {
    for (var element in txt) {
      if (mapIntWord.containsKey(element)) {
        int valueWord = mapIntWord[element]!;
        outSet.add(valueWord);
      }
    }
    return outSet;
  }
}
