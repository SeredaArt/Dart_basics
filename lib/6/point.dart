import 'dart:math';

void main() {
  Point one = Point(10, 10, 10);
  num d = one.distanceTo(Point(5, 5, 5));
  print(d);
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

  num distanceTo(Point another) {
    num d = sqrt(
        pow(another.x - x, 2) + pow(another.y - y, 2) + pow(another.y - y, 2));
    return d;
  }
}