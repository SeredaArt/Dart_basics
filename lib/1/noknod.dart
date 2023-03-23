void main() {

  DelimetersCalc nod = DelimetersCalc();
  int result = nod.gcdRun(-450, 678);
  print("НОД равен: $result");

  int resultLcm = nod.lcmRun(450, 678);
  print("НОК равен: $resultLcm");

  List answer = nod.calcSimples(168);
  print(answer);
}

class DelimetersCalc {

  int gcdRun(int a, int b) {

    if (a < 0 || b < 0) {
      throw ArgumentError('НОД вычисляется только для натуральных чисел.', 'Ошибка!');
    }

    while (b != 0) {
      int c = b;
      b = a % b;
      a = c;
    }
    return a.abs();
  }

  int lcmRun(int a, int b) {
    if (a % 1 != 0 || b % 1 != 0) {
      throw('НОК вычисляется только для натуральных чисел.');
    }

    return a ~/ gcdRun(a, b) * b;
  }

  List calcSimples(int a){
    List<int> result = [];

    if (intSimple(a)) {
      print('$a является простым числом');
      result.add(a);
      return result;
    }

    a = a.abs();
    var d = 2;


    while (a > 1) {
      while (a % d == 0) {

        if (intSimple(d)) {
          result.add(d);
          a = a ~/ d;
        }
      }

      if (d == 2)
        d++;
      else
        d += 2;
    }

    return result;
  }

  bool intSimple(int a) {

    List simples = [];

    for (var i = 1; i <= a; i++) {
      if (a % i == 0) {
        simples.add(i);
      }
    }
    return simples.length == 2;
  }
}