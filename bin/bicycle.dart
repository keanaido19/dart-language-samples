import 'dart:io';

class Bicycle {
  int cadence;
  int _speed = 0;
  int gear;

  Bicycle(this.cadence, this.gear);

  int get speed => _speed;

  set speed(int value) {
    _speed = value;
  }

  void speedUp(int increment) => _speed += increment;

  void applyBrake(int decrement) => speedUp(-decrement);

  @override
  String toString() => 'Bicycle: $speed mph';
}

void main() {
  var bike = Bicycle(2, 1);
  print(bike);
}