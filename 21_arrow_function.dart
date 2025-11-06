// Arrow function in dart

void main() { 
  // Arrow function for addition
  int add(int a, int b) => a + b;

  int sum = add(5, 10);
  print('Sum: $sum'); 

  // Arrow function for greeting
  String greet(String name, [String? greeting]) => 
      greeting != null ? '$greeting, $name!' : 'Hello, $name!';

  print(greet('Alice')); 
  print(greet('Bob', 'Good morning')); 

  // Arrow function for introduction
  String introduce({required String name, int? age}) => 
      age != null ? 'My name is $name and I am $age years old.' : 'My name is $name.';

  print(introduce(name: 'Charlie')); 
  print(introduce(name: 'Diana', age: 30)); 
}

int multiply(int a, int b) => a * b;  
void printMessage(String message) => print(message);
double divide(int a, int b) {
  if (b == 0) {
    throw ArgumentError('Division by zero is not allowed.');
  }
  return a / b;
} 

int findMax(int a, int b) => a > b ? a : b;
bool isEven(int number) => number % 2 == 0;


