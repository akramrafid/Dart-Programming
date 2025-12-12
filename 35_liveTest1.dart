/*You need to show your understanding of class, constructor, inheritance, and abstraction by solving the following problems:

1.Create a Student class with properties name and roll. Use a constructor to initialize these values and add a method displayInfo() to print them. Create one student object and display the details.

2.Create a Person class with a property name. Then create a Teacher class that inherits from Person and adds a property subject. Initialize a teacher object and print both the name and subject.

3.Create an abstract class named Shape with an abstract method area(). You have to create set and get method  to access the area(). Then create one subclass Circle with property radius that implements the area() method. Finally, create one circle object and print its area.*/

class Student {
  String name;
  int roll;

  Student(this.name, this.roll);

  void displayInfo() {
    print('Name: $name');
    print('Roll Number: $roll');
  }
}

class Person {
  String name;

  Person(this.name);
}

class Teacher extends Person {
  String subject;

  Teacher(String name, this.subject) : super(name);

  void displayInfo() {
    print("Teacher's Name: $name");
    print('Subject: $subject');
  }
}

abstract class Shape {
  double _area = 0.0;

  double area();

  void set setArea(double value) {
    _area = value;
  }

  double get getArea {
    return _area;
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14159 * radius * radius;
  }
}

void main() {
  
  Student student = Student('Akram Rafid', 231017512);
  student.displayInfo();

  Teacher teacher = Teacher('Jihad Hossain', 'Computer graphics');
  teacher.displayInfo();

  Circle circle = Circle(5);
  double circleArea = circle.area();
  print('Circle Radius: 5');
  print('Circle Area: ${circleArea.toStringAsFixed(2)}');
  circle.setArea = circleArea;
  print('Area: ${circle.getArea.toStringAsFixed(2)}');
}