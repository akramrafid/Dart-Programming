// Funtion declaration and innovation in Dart

void main() {
  // Function declaration
  int add(int a, int b) {
    return a + b;
  }

  // Calling the function
  int sum = add(5, 10);
  print('Sum: $sum'); // Output: Sum: 15

  // Function with optional parameters
  String greet(String name, [String? greeting]) {
    if (greeting != null) {
      return '$greeting, $name!';
    } else {
      return 'Hello, $name!';
    }
  }

  print(greet('Alice')); // Output: Hello, Alice!
  print(greet('Bob', 'Good morning')); // Output: Good morning, Bob!

  // Function with named parameters
  String introduce({required String name, int? age}) {
    if (age != null) {
      return 'My name is $name and I am $age years old.';
    } else {
      return 'My name is $name.';
    }
  }

  print(introduce(name: 'Charlie')); // Output: My name is Charlie.
  print(introduce(name: 'Diana', age: 30)); // Output: My name is Diana and I am 30 years old.
}

// return types in functions
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

