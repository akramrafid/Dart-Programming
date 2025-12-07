class Book {
  String title;
  String author;
  double price;

  Book(this.title, this.author, this.price);

  double discountedPrice(double discountPercent) {
    if (discountPercent < 0 || discountPercent > 100) {
      throw Exception('Discount percent must be between 0 and 100');
    }
    return price - (price * discountPercent / 100);
  }

  void displayInfo() {
    print('Title: $title');
    print('Author: $author');
    print('Original Price: \$${price.toStringAsFixed(2)}');
  }

  @override
  String toString() => '$title by $author - \$${price.toStringAsFixed(2)}';
}

class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);

  void displayInfo() {
    print('Name: $name');
    print('Salary: \$${salary.toStringAsFixed(2)}');
  }
}

class Manager extends Employee {
  String department;

  Manager(String name, double salary, this.department) : super(name, salary);

  @override
  void displayInfo() {
    print('Manager Information:');
    print('Name: $name');
    print('Salary: \$${salary.toStringAsFixed(2)}');
    print('Department: $department');
  }
}

class Developer extends Employee {
  String programmingLanguage;

  Developer(String name, double salary, this.programmingLanguage)
      : super(name, salary);

  @override
  void displayInfo() {
    print('Developer Information:');
    print('Name: $name');
    print('Salary: \$${salary.toStringAsFixed(2)}');
    print('Programming Language: $programmingLanguage');
  }
}

abstract class Appliance {
  String name;

  Appliance(this.name);

  void turnOn();
  void turnOff();
}

class Fan extends Appliance {
  Fan(String name) : super(name);

  @override
  void turnOn() {
    print('$name is now running');
  }

  @override
  void turnOff() {
    print('$name has stopped');
  }
}

class Light extends Appliance {
  Light(String name) : super(name);

  @override
  void turnOn() {
    print('$name is switched on');
  }

  @override
  void turnOff() {
    print('$name is switched off');
  }
}

void main() {
 
  Book book1 = Book('Himu', 'Humayun Ahmed', 15.99);
  Book book2 = Book('Amar Bondhu Rashed', 'Jafor Iqbal', 18.50);

  print('Book 1:');
  book1.displayInfo();
  print('Discounted Price (20%): \$${book1.discountedPrice(20).toStringAsFixed(2)}');
  print('');

  print('Book 2:');
  book2.displayInfo();
  print('Discounted Price (15%): \$${book2.discountedPrice(15).toStringAsFixed(2)}');
  print('');


  Manager manager = Manager('Jihad', 85000.0, 'Engineering');
  manager.displayInfo();
  print('');

  Developer developer = Developer('Rahat', 75000.0, 'Flutter');
  developer.displayInfo();
  print('');


  Fan fan = Fan('Ceiling Fan');
  fan.turnOn();
  fan.turnOff();
  print('');

  Light light = Light('Living Room Light');
  light.turnOn();
  light.turnOff();
}