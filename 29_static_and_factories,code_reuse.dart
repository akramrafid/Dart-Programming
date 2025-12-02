// Static & Factories, Code Reuse | Static variables and methods | Factory constructors | Singleton pattern | Mixins | Extensions

import 'dart:math';

// ============= STATIC VARIABLES AND METHODS =============
class Counter {
  static int _count = 0;
  static const int MAX_COUNT = 100;
  late int _instanceId;

  Counter() {
    _count++;
    _instanceId = _count;
  }

  static int get totalInstances => _count;

  static void resetCount() {
    _count = 0;
    print('Counter reset to 0');
  }

  void displayInstanceInfo() {
    print('Instance ID: $_instanceId | Total Instances: $_count');
  }
}

// ============= FACTORY CONSTRUCTOR PATTERN =============
class Database {
  static final Database _instance = Database._internal();
  late String _connectionString;
  late bool _isConnected;

  Database._internal() {
    _connectionString = '';
    _isConnected = false;
  }

  factory Database() {
    return _instance;
  }

  void connect(String connectionString) {
    _connectionString = connectionString;
    _isConnected = true;
    print('Connected to database: $connectionString');
  }

  void disconnect() {
    _isConnected = false;
    print('Disconnected from database');
  }

  bool get isConnected => _isConnected;

  void displayStatus() {
    print('Connection String: $_connectionString');
    print('Connected: $_isConnected');
  }
}

// ============= FACTORY WITH DIFFERENT TYPES =============
abstract class Vehicle {
  String get description;
  void drive();

  factory Vehicle(String type) {
    switch (type.toLowerCase()) {
      case 'car':
        return Car();
      case 'bike':
        return Bike();
      case 'truck':
        return Truck();
      default:
        throw Exception('Unknown vehicle type');
    }
  }
}

class Car implements Vehicle {
  @override
  String get description => 'A four-wheeled car';

  @override
  void drive() {
    print('Driving a car: Comfortable and safe');
  }
}

class Bike implements Vehicle {
  @override
  String get description => 'A two-wheeled bike';

  @override
  void drive() {
    print('Riding a bike: Fast and agile');
  }
}

class Truck implements Vehicle {
  @override
  String get description => 'A heavy-duty truck';

  @override
  void drive() {
    print('Driving a truck: Powerful and sturdy');
  }
}

// ============= MIXIN FOR CODE REUSE =============
mixin Flyable {
  void fly() {
    print('Flying through the air');
  }

  void land() {
    print('Landing safely');
  }
}

mixin Swimmable {
  void swim() {
    print('Swimming in water');
  }

  void dive() {
    print('Diving deep underwater');
  }
}

mixin Walkable {
  void walk() {
    print('Walking on ground');
  }

  void run() {
    print('Running fast');
  }
}

// ============= CLASSES USING MIXINS =============
class Bird with Flyable, Walkable {
  String name;

  Bird(this.name);

  void displayInfo() {
    print('Bird: $name');
  }
}

class Fish with Swimmable {
  String name;

  Fish(this.name);

  void displayInfo() {
    print('Fish: $name');
  }
}

class Duck with Flyable, Swimmable, Walkable {
  String name;

  Duck(this.name);

  void displayInfo() {
    print('Duck: $name');
  }
}

class Dog with Walkable {
  String name;
  String breed;

  Dog(this.name, this.breed);

  void displayInfo() {
    print('Dog: $name ($breed)');
  }

  void bark() {
    print('Woof! Woof!');
  }
}

// ============= EXTENSIONS FOR CODE REUSE =============
extension StringExtension on String {
  bool get isValidEmail => contains('@') && contains('.');

  String get capitalize {
    if (isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get reverse => split('').reversed.join('');

  int get wordCount => trim().isEmpty ? 0 : trim().split(' ').length;
}

extension ListExtension<T> on List<T> {
  T? getRandomElement() {
    if (isEmpty) return null;
    return this[Random().nextInt(length)];
  }

  List<T> get reversed2 => reversed.toList();

  void printAll() {
    for (var item in this) {
      print(item);
    }
  }
}

extension NumExtension on num {
  bool get isEven => this % 2 == 0;

  bool get isOdd => this % 2 != 0;

  num get squared => this * this;

  num get cubed => this * this * this;
}

// ============= MAIN FUNCTION =============
void main() {
  print('========== STATIC & FACTORIES CODE REUSE DEMO ==========\n');

  // ===== STATIC VARIABLES AND METHODS =====
  print('--- STATIC VARIABLES AND METHODS ---\n');
  Counter counter1 = Counter();
  counter1.displayInstanceInfo();

  Counter counter2 = Counter();
  counter2.displayInstanceInfo();

  Counter counter3 = Counter();
  counter3.displayInstanceInfo();

  print('Total instances created: ${Counter.totalInstances}');
  Counter.resetCount();
  print('Total instances after reset: ${Counter.totalInstances}\n');

  // ===== SINGLETON PATTERN =====
  print('--- SINGLETON PATTERN (Database) ---\n');
  Database db1 = Database();
  Database db2 = Database();

  db1.connect('Server=localhost;Port=5432;DB=myapp');
  print('DB1 Same instance as DB2: ${identical(db1, db2)}');

  db2.displayStatus();
  db2.disconnect();
  print('');

  // ===== FACTORY CONSTRUCTOR WITH DIFFERENT TYPES =====
  print('--- FACTORY CONSTRUCTOR PATTERN ---\n');
  Vehicle car = Vehicle('car');
  print(car.description);
  car.drive();

  Vehicle bike = Vehicle('bike');
  print(bike.description);
  bike.drive();

  Vehicle truck = Vehicle('truck');
  print(truck.description);
  truck.drive();
  print('');

  // ===== MIXINS FOR CODE REUSE =====
  print('--- MIXINS FOR CODE REUSE ---\n');
  Bird sparrow = Bird('Sparrow');
  sparrow.displayInfo();
  sparrow.fly();
  sparrow.walk();
  print('');

  Fish goldfish = Fish('Goldfish');
  goldfish.displayInfo();
  goldfish.swim();
  goldfish.dive();
  print('');

  Duck mallard = Duck('Mallard');
  mallard.displayInfo();
  mallard.fly();
  mallard.swim();
  mallard.walk();
  print('');

  Dog labrador = Dog('Buddy', 'Labrador');
  labrador.displayInfo();
  labrador.walk();
  labrador.run();
  labrador.bark();
  print('');

  // ===== EXTENSIONS FOR CODE REUSE =====
  print('--- STRING EXTENSIONS ---\n');
  String email = 'john@example.com';
  print('Email: $email | Valid: ${email.isValidEmail}');

  String name = 'john doe';
  print('Original: $name | Capitalized: ${name.capitalize}');

  String word = 'hello';
  print('Original: $word | Reversed: ${word.reverse}');

  String sentence = 'This is a test sentence';
  print('Sentence: $sentence | Word count: ${sentence.wordCount}');
  print('');

  // ===== NUMBER EXTENSIONS =====
  print('--- NUMBER EXTENSIONS ---\n');
  int number1 = 4;
  print('Number: $number1 | Even: ${number1.isEven} | Odd: ${number1.isOdd}');

  int number2 = 5;
  print('Number: $number2 | Even: ${number2.isEven} | Odd: ${number2.isOdd}');

  int number3 = 3;
  print('Number: $number3 | Squared: ${number3.squared} | Cubed: ${number3.cubed}');
  print('');

  // ===== LIST EXTENSIONS =====
  print('--- LIST EXTENSIONS ---\n');
  List<String> fruits = ['Apple', 'Banana', 'Cherry', 'Date'];
  print('Fruits:');
  fruits.printAll();
  print('Random fruit: ${fruits.getRandomElement()}');
  print('Reversed: ${fruits.reversed2}');
}