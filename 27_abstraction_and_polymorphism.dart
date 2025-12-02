// Abstraction & Polymorphism | Abstract classes | Interface implementation | Method overriding

// ============= ABSTRACT ANIMAL CLASS =============
abstract class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  // Abstract method - must be implemented by subclasses
  void makeSound();

  // Abstract method
  void eat();

  // Concrete method
  void displayInfo() {
    print('Name: $name | Age: $age years');
  }

  // Abstract method
  String getDescription();
}

// ============= DOG CLASS (implements Animal) =============
class Dog extends Animal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void makeSound() {
    print('$name says: Woof! Woof!');
  }

  @override
  void eat() {
    print('$name is eating dog food');
  }

  @override
  String getDescription() {
    return '$name is a $breed dog, $age years old';
  }

  void fetch() {
    print('$name is fetching the ball!');
  }
}

// ============= CAT CLASS (implements Animal) =============
class Cat extends Animal {
  String color;

  Cat(String name, int age, this.color) : super(name, age);

  @override
  void makeSound() {
    print('$name says: Meow! Meow!');
  }

  @override
  void eat() {
    print('$name is eating cat food');
  }

  @override
  String getDescription() {
    return '$name is a $color cat, $age years old';
  }

  void scratch() {
    print('$name is scratching the furniture!');
  }
}

// ============= BIRD CLASS (implements Animal) =============
class Bird extends Animal {
  double wingSpan;

  Bird(String name, int age, this.wingSpan) : super(name, age);

  @override
  void makeSound() {
    print('$name says: Tweet! Tweet!');
  }

  @override
  void eat() {
    print('$name is eating seeds');
  }

  @override
  String getDescription() {
    return '$name is a bird with $wingSpan meter wingspan, $age years old';
  }

  void fly() {
    print('$name is flying high in the sky!');
  }
}

// ============= ABSTRACT VEHICLE CLASS =============
abstract class Vehicle {
  String brand;
  String model;
  int year;

  Vehicle(this.brand, this.model, this.year);

  void start();
  void stop();
  void accelerate();
  
  void displayDetails() {
    print('Brand: $brand | Model: $model | Year: $year');
  }
}

// ============= CAR CLASS (implements Vehicle) =============
class Car extends Vehicle {
  int numberOfDoors;

  Car(String brand, String model, int year, this.numberOfDoors)
      : super(brand, model, year);

  @override
  void start() {
    print('$brand $model car engine started');
  }

  @override
  void stop() {
    print('$brand $model car engine stopped');
  }

  @override
  void accelerate() {
    print('$brand $model car accelerating smoothly');
  }

  void openTrunk() {
    print('Car trunk is open');
  }
}

// ============= BIKE CLASS (implements Vehicle) =============
class Bike extends Vehicle {
  bool hasStandard;

  Bike(String brand, String model, int year, this.hasStandard)
      : super(brand, model, year);

  @override
  void start() {
    print('$brand $model bike engine started with a roar');
  }

  @override
  void stop() {
    print('$brand $model bike engine stopped');
  }

  @override
  void accelerate() {
    print('$brand $model bike accelerating rapidly');
  }

  void wheelie() {
    print('Bike doing a wheelie!');
  }
}

// ============= TRUCK CLASS (implements Vehicle) =============
class Truck extends Vehicle {
  double loadCapacity;

  Truck(String brand, String model, int year, this.loadCapacity)
      : super(brand, model, year);

  @override
  void start() {
    print('$brand $model truck diesel engine started');
  }

  @override
  void stop() {
    print('$brand $model truck engine stopped');
  }

  @override
  void accelerate() {
    print('$brand $model truck accelerating heavily');
  }

  void loadCargo(double weight) {
    if (weight <= loadCapacity) {
      print('Cargo of ${weight}T loaded successfully!');
    } else {
      print('Cargo exceeds capacity!');
    }
  }
}

// ============= MAIN FUNCTION =============
void main() {
  print('========== ABSTRACTION & POLYMORPHISM DEMO ==========\n');

  // ===== ANIMALS POLYMORPHISM =====
  print('--- ANIMALS POLYMORPHISM ---\n');
  
  List<Animal> animals = [
    Dog('Buddy', 5, 'Golden Retriever'),
    Cat('Whiskers', 3, 'Orange'),
    Bird('Tweety', 2, 1.5),
  ];

  for (var animal in animals) {
    animal.displayInfo();
    animal.makeSound();
    animal.eat();
    print('Description: ${animal.getDescription()}\n');
  }

  // Calling specific methods
  print('--- SPECIFIC ANIMAL ACTIONS ---\n');
  Dog dog = Dog('Rex', 4, 'Labrador');
  dog.fetch();

  Cat cat = Cat('Mittens', 2, 'White');
  cat.scratch();

  Bird bird = Bird('Chirpy', 1, 2.0);
  bird.fly();
  print('');

  // ===== VEHICLES POLYMORPHISM =====
  print('--- VEHICLES POLYMORPHISM ---\n');
  
  List<Vehicle> vehicles = [
    Car('Toyota', 'Camry', 2023, 4),
    Bike('Harley Davidson', 'Street 750', 2022, true),
    Truck('Volvo', 'FH16', 2021, 25.0),
  ];

  for (var vehicle in vehicles) {
    vehicle.displayDetails();
    vehicle.start();
    vehicle.accelerate();
    vehicle.stop();
    print('');
  }

  // Calling specific methods
  print('--- SPECIFIC VEHICLE ACTIONS ---\n');
  Car car = Car('Honda', 'Civic', 2023, 4);
  car.openTrunk();

  Bike bike = Bike('Yamaha', 'YZF-R1', 2022, true);
  bike.wheelie();

  Truck truck = Truck('MAN', 'TGX', 2021, 30.0);
  truck.loadCargo(25.0);
  truck.loadCargo(35.0);
  print('');

  // ===== POLYMORPHIC BEHAVIOR =====
  print('--- POLYMORPHIC BEHAVIOR EXAMPLE ---\n');
  performAnimalActions(Dog('Buddy', 3, 'Poodle'));
  performAnimalActions(Cat('Kitty', 2, 'Black'));
  performAnimalActions(Bird('Polly', 1, 1.2));
}

// Polymorphic function for animals
void performAnimalActions(Animal animal) {
  print('Performing actions for: ${animal.name}');
  animal.makeSound();
  animal.eat();
  print('');
}