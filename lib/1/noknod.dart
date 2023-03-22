void main() {

  DelimetersCalc nod = DelimetersCalc();
  int result = nod.gcdRun(450, 678);
  print("НОД равен: $result");

  double resultLcm = nod.lcmRun(450, 678);
  print("НОК равен: $resultLcm");

  nod.calcSimples(168);
  nod.calcSimples(978);
}

class DelimetersCalc {

  int gcdRun(int a, int b) {

    if (a % 1 != 0 || b % 1 != 0) {
      throw('НОД вычисляется только для натуральных чисел.');
    }

    while (b != 0) {
      int c = b;
      b = a % b;
      a = c;
    }
    return a.abs();
  }

  double lcmRun(int a, int b) {
    if (a % 1 != 0 || b % 1 != 0) {
      throw('НОК вычисляется только для натуральных чисел.');
    }

    return a / gcdRun(a, b) * b;
  }

  dynamic calcSimples(int a){
    if (intSimple(a)) {
      print('$a является простым числом');
      return false;
    }

    a = a.abs();
    var d = 2;
    List<int> result = [];

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

    print(result.join(' * '));
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