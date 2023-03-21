void main() {

  DelimetersCalc nod = DelimetersCalc();
  int result = nod.gcdRun(450, 678);
  print("НОД равен: $result");

  double resultLcm = nod.lcmRun(450, 678);
  print("НОК равен: $resultLcm");

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