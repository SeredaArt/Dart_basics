void main() {
  num sqrtN = 0;
  sqrtN.calcSqrtN(32, 5);
  sqrtN.calcSqrtN(246, 4);
  sqrtN.calcSqrtN(156.7, 7);
  sqrtN.calcSqrtN(-567, 4);
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