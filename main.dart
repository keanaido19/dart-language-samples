import 'dart:math';
import 'package:characters/characters.dart';

var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.unlaunched(String name) : this(name, null);

  // Method
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work with getters.

    var launchDate = this.launchDate;
    if (null != launchDate) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear (%years years ago)');
    }
  }
}

void printInteger(int aNumber) {
  print('The number is $aNumber');
}

void main() {
  print('Hello, World!');
  for (var variable in [name, year, antennaDiameter, flybyObjects, image]) {
    print(variable);
  }

  if (year >= 2001) {
    print("21st century");
  } else if (year >= 1901) {
    print("20th century");
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year++;
  }

  var result = fibonacci(20);
  print(result);

  var number = 42;
  printInteger(number);

  const Object i = 3;
  const list = [i as int];
  const map = {if (i is int) i: 'int'};
  const set = {if (list is List<int>) ...list};

  var one = int.parse('1');
  assert(one == 1);

  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  String piAsString = 3.141592653589.toStringAsFixed(2);
  assert(piAsString == '3.14');

  assert((3 << 1) == 6);
  assert((6 | 1) == 7);
  
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;
  
  var s1 = 'This '
    'is '
    'one '
    'sentence.';

  var s2 = '''
  This is a
  multi-line string.''';

  var s3 = """This is also
  multi-line string.""";

  print(s1 + "\n" + s2 + "\n" + s3);
  print([s1, s2, s3].join("\n"));

  var rawS = r"We got raw Strings back boiii\n";

  print(rawS);

  var fullName = '';
  assert(fullName.isEmpty);

  var NaN = 0 / 0;
  print(NaN);
  print(NaN.isNaN);

  var list1 = [1, 2, 3];
  var list2 = [0, ...list1];
  assert(list2.length == 4);

  var list3;
  list2 = [0, ...?list3];
  assert(list2.length == 1);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) if (i % 2 == 1) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);

  var names = <String>{};
// Set<String> names = {}; // This works, too.
// var names = {}; // Creates a map, not a set.

  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  assert(elements.length == 5);

  for (var element in elements) print(element);

  var elementsList = [for (var element in elements) element];

  var lol = {
    for (var element in elementsList) elementsList.indexOf(element): element
  };
  print(lol);

  void printTing(String element, {int x = 1}) {
    print(element + '$x');
  }

  // elementsList.forEach(printTing);
  elementsList.forEach((pie) => print(pie));

  var hi = 'Hi 🇩🇰';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
  print('The last character: ${hi.characters.last}\n');

  flybyObjects.where((name) => name.contains('turn')).forEach((print));

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  Function makeAdder(int addBy) {
    return (int i) => i >= 1000 ? addBy + i : makeAdder(addBy)(i + addBy);
  }

  print(makeAdder(10)(1));
}