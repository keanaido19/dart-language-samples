String scream(int length) => "A${'a' * length}h";


void main() {
  final values = [1, 2, 3, 5, 10, 50];
  for (var value in values) {
    print(scream(value));
  }

  values.map(scream).forEach(print);

  values.skip(1).take(3).map(scream).forEach(print);

}