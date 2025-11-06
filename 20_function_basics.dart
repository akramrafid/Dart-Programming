// Funtion declaration and innovation in Dart

void main() {
  int add(int a, int b) {
    return a + b;
  }

  int sum = add(5, 10);
  print('Sum: $sum'); 

  
  String greet(String name, [String? greeting]) {
    if (greeting != null) {
      return '$greeting, $name!';
    } else {
      return 'Hello, $name!';
    }
  }

  print(greet('Alice')); 
  print(greet('Bob', 'Good morning')); 

  
  String introduce({required String name, int? age}) {
    if (age != null) {
      return 'My name is $name and I am $age years old.';
    } else {
      return 'My name is $name.';
    }
  }

  print(introduce(name: 'Charlie')); 
  print(introduce(name: 'Diana', age: 30)); 
}


int multiply(int a, int b) {
  return a * b;
}

void printMessage(String message) {
  print(message);
}

double divide(int a, int b) {
  if (b == 0) {
    throw ArgumentError('Division by zero is not allowed.');
  }
  return a / b;
}

