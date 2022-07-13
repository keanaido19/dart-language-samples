import 'dart:math';

Shape shapeFactory(String type) {
  if ('circle' == type) return Circle(2);
  if ('square' == type) return Square(2);
  throw 'Can\'t create $type';
}

abstract class Shape {
  factory Shape(String type) {
    if ('circle' == type) return Circle(2);
    if ('square' == type) return Square(2);
    throw 'Can\'t create $type';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;

  Circle(this.radius);

  @override
  num get area => pi * pow(radius, 2);
}

class CircleMock implements Circle {
  @override
  num area = 0;
  
  @override
  num radius = 0;

}


class Square implements Shape {
  final num side;

  Square(this.side);

  @override
  num get area => pow(side, 2);
}

void main() {
  // final circle = shapeFactory('circle');
  // final square = shapeFactory('square');

  final circle = Shape('circle');
  final square = Shape('square');

  print(circle.area);
  print(square.area);
}