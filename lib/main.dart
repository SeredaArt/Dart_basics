import 'dart:math';

void main() {

  DelimetersCalc nod = DelimetersCalc();
  int result = nod.gcdRun(450, 678);
  print("НОД равен: $result");

  double resultLcm = nod.lcmRun(450, 678);
  print("НОК равен: $resultLcm");

  BinaryCalc bin = BinaryCalc();
  String answer = bin.toBin(256);
  print("Число в двоичной: $answer");

  num decAnswer = bin.toDec("1010011010");
  print("Число в десятичной: $decAnswer");

  List resultInt = IntInString().intInText('car 1 3344 1000 dog 6 7 cat 9 0 *');
  print(resultInt);

  List<String> list = ['car', 'cat', 'dog', 'cat', 'mail', 'phone', 'apple', 'mail', 'cat'];
  var outMap = <String, int>{};
  outMap = WordInText().runCalcWords(list);
  print(outMap);

  List<String> list2 = ['one', 'two', 'zero', 'zero', 'mail', 'phone', 'seven', 'nine'];
  var outSet = WordToInt().toInt(list2);
  print(outSet);

 Point one = Point(10, 10, 10);
 num d = one.distanceTo(Point(5, 5, 5));
 print(d);

 var fivePoint =Point.five();
  double x = fivePoint.x;
  double y = fivePoint.y;
  double z = fivePoint.z;
  print("factory: ($x, $y, $z)");

  num sqrtN = 0;
  sqrtN.calcSqrtN(32, 5);
  sqrtN.calcSqrtN(246, 4);
  sqrtN.calcSqrtN(156.7, 7);
  //sqrtN.calcSqrtN(-567, 4);

  final first = User('user@mail.ru');
  //print(first.email);
  final admin  = AdminUser('admin@mail.ru');
  //print(admin.getMailSystem());
  final generalUser = GeneralUser('generic@yandex.ru');
  //print(generalUser.email);

  final userManager = UserManager();
  userManager.add(first);
  userManager.add(admin);
  userManager.add(generalUser);

  userManager.usersMails();

  userManager.del(first);
  userManager.usersMails();
}

class DelimetersCalc {

  gcdRun(int a, int b) {
    while (b != 0) {
      int c = b;
      b = a % b;
      a = c;
    }
    return a.abs();
  }

  double lcmRun(int a, int b) {
    return a / gcdRun(a, b) * b;
  }
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

class IntInString {

  intInText(String txt) {
    Iterable<String> arrayText = txt.split(' ');
    List arrayInt = [];
    for (var element in arrayText) {
      num? isInt = int.tryParse(element);
      if (isInt != null) {
        arrayInt.add(isInt);
      }
    }
    return arrayInt;
  }
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
    "nine": 9,
  };

  Set outSet = {};

  toInt(Iterable<String> txt) {
    for (var element in txt) {
      if (mapIntWord.containsKey(element)) {
        int valueWord = mapIntWord[element]!;
        outSet.add(valueWord);
      }
    }
    return outSet;
  }
}

class Point {

  final double x;
  final double y;
  final double z;

  Point(this.x, this.y, this.z) ;

  factory Point.zero()
  {
    return Point(0, 0, 0);

  }

  factory Point.vector()
  {
    return Point(1, 1, 1);

  }

  factory Point.five()
  {
    return Point(5, 5, 5);

  }

  distanceTo(Point another) {
    num d = sqrt(
        pow(another.x - x, 2) + pow(another.y - y, 2) + pow(another.y - y, 2));
    return d;
  }
}

extension SqrtN on num{

  double invert(double m){
  return m = m<0? -m : m;
}

  void calcSqrtN(double a, double n)
  {
    if ((a < 0) & (n%2==0))  {
      throw('Из отрицательных чисел корень четной степени не существует.');
    }

    double acc = 0.00001;
    double root = a/n;
    double rn = a;
    int i = 0;
    while(invert(root - rn) >= acc) {
      rn = a;
      for(int j = 1; j < n; j++){
        rn = rn / root;
      }
      root = rn / n + root * (1.0 - 1.0 / n);
      i++;
    }
    print('Итерация $i');
    print('Корень $n-ой степени из $a=$root');
  }
}

class User{
  final String email;

  User(this.email);
}

class AdminUser extends User with MailSystem{

  AdminUser(String email) : super(email);

}

class GeneralUser extends User{

  GeneralUser(String email) : super(email);

}

mixin MailSystem on User {
  getMailSystem(){
    return email.split('@')[1];
    }
}

class UserManager<T extends User>{

  List users = [];

  add(T){
    users.add(T);
  }

  del(T){
    users.remove(T);
  }

  usersMails() {

    for (var elements in users) {
      if (elements is AdminUser) {
        print(elements.getMailSystem());
      }
       else {
         print(elements.email);
      }
    }
  }
}




