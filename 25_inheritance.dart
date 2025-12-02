// Inheritance with extends, Super keyword for parent class access, Method overriding

// Inheritance with extends, Super keyword for parent class access, Method overriding

// Parent class (Base class)
class Vehicle {
  String brand;
  String color;
  int year;

  Vehicle(this.brand, this.color, this.year);

  void displayInfo() {
    print('Brand: $brand');
    print('Color: $color');
    print('Year: $year');
  }

  void start() {
    print('$brand vehicle is starting...');
  }

  void stop() {
    print('$brand vehicle is stopping...');
  }

  String getDescription() {
    return '$year $color $brand';
  }
}

// Child class (Derived class) - Car
class Car extends Vehicle {
  int numberOfDoors;
  String fuelType;

  Car(String brand, String color, int year, this.numberOfDoors, this.fuelType)
      : super(brand, color, year);

  // Method overriding
  @override
  void displayInfo() {
    super.displayInfo(); // Calling parent method
    print('Number of Doors: $numberOfDoors');
    print('Fuel Type: $fuelType');
  }

  // Method overriding
  @override
  void start() {
    print('Car engine is starting with a smooth roar...');
  }

  @override
  String getDescription() {
    return '${super.getDescription()} with $numberOfDoors doors';
  }

  void openTrunk() {
    print('Opening trunk of the car...');
  }
}

// Child class (Derived class) - Bike
class Bike extends Vehicle {
  int numberOfGears;
  bool hasStandard;

  Bike(String brand, String color, int year, this.numberOfGears,
      this.hasStandard)
      : super(brand, color, year);

  // Method overriding
  @override
  void displayInfo() {
    super.displayInfo();
    print('Number of Gears: $numberOfGears');
    print('Has Standard: $hasStandard');
  }

  // Method overriding
  @override
  void start() {
    print('Bike engine is starting with a roaring sound...');
  }

  @override
  String getDescription() {
    return '${super.getDescription()} with $numberOfGears gears';
  }

  void ringBell() {
    print('Ring! Ring! Bike bell is ringing...');
  }
}

// Child class (Derived class) - Truck
class Truck extends Vehicle {
  double loadCapacity; // in tons
  int numberOfAxles;

  Truck(String brand, String color, int year, this.loadCapacity,
      this.numberOfAxles)
      : super(brand, color, year);

  // Method overriding
  @override
  void displayInfo() {
    super.displayInfo();
    print('Load Capacity: ${loadCapacity} tons');
    print('Number of Axles: $numberOfAxles');
  }

  // Method overriding
  @override
  void start() {
    print('Truck diesel engine is starting with heavy rumbling...');
  }

  @override
  String getDescription() {
    return '${super.getDescription()} with ${loadCapacity}T capacity';
  }

  void loadCargo(double weight) {
    if (weight <= loadCapacity) {
      print('Cargo of ${weight}T loaded successfully!');
    } else {
      print('Cargo weight exceeds capacity!');
    }
  }
}

void main() {
  print('=== INHERITANCE EXAMPLE ===\n');

  // Creating Car object
  print('--- CAR OBJECT ---');
  Car car = Car('Toyota', 'Red', 2023, 4, 'Petrol');
  car.displayInfo();
  print('Description: ${car.getDescription()}');
  car.start();
  car.stop();
  car.openTrunk();
  print('');

  // Creating Bike object
  print('--- BIKE OBJECT ---');
  Bike bike = Bike('Harley Davidson', 'Black', 2022, 6, true);
  bike.displayInfo();
  print('Description: ${bike.getDescription()}');
  bike.start();
  bike.ringBell();
  bike.stop();
  print('');

  // Creating Truck object
  print('--- TRUCK OBJECT ---');
  Truck truck = Truck('Volvo', 'Silver', 2021, 25.5, 3);
  truck.displayInfo();
  print('Description: ${truck.getDescription()}');
  truck.start();
  truck.loadCargo(20.0);
  truck.loadCargo(30.0);
  truck.stop();
  print('');

  // Demonstrating polymorphism with lists
  print('--- POLYMORPHISM EXAMPLE ---');
  List<Vehicle> vehicles = [car, bike, truck];

  for (var vehicle in vehicles) {
    print('Vehicle: ${vehicle.brand}');
    vehicle.start();
    vehicle.stop();
    print('');
  }
}
