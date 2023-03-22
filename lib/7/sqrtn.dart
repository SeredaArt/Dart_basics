void main() {

  32.calcSqrtN(5);
  246.calcSqrtN(4);
  157.7.calcSqrtN(7);
  567.calcSqrtN(4);

}

extension SqrtN on num{

  double invert(double m){
    return m = m<0? -m : m;
  }

  void calcSqrtN (double n)
    {
    if ((this < 0) & (n%2==0))  {
      throw('Из отрицательных чисел корень четной степени не существует.');
    }
    num a = this;
    double acc = 0.00001;
    double root = a/n;
    double rn = a.toDouble();
    int i = 0;
    while(invert(root - rn) >= acc) {
      rn = a.toDouble();
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