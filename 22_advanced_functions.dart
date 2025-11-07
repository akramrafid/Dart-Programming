// Anonymous functions | Higher-order functions (passing functions as arguments) | Recursive functions | Scope → local vs global variables

void main() { 
  // Anonymous function example
  var numbers = [1, 2, 3, 4, 5];
  var squaredNumbers = numbers.map((n) => n * n).toList();
  print('Squared Numbers: $squaredNumbers');

  // Higher-order function example
  void applyFunction(int a, int b, int Function(int, int) func) {
    print('Result: ${func(a, b)}');
  }

  applyFunction(5, 3, (x, y) => x + y); // Passing an anonymous function

  // Recursive function example
  int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }

  print('Factorial of 5: ${factorial(5)}');

  // Scope example
  var globalVar = 'I am a global variable';

  void checkScope() {
    var localVar = 'I am a local variable';
    print(globalVar); // Accessible
    print(localVar); // Accessible
  }

  checkScope();
  // print(localVar); // Uncommenting this line will cause an error

  // Student scores example
  var students = [
    {'name': 'Alice', 'score': 95},
    {'name': 'Bob', 'score': 85},
    {'name': 'Charlie', 'score': 90}
  ];

  print('\nTotal number of students: ${students.length}');

  if (students.isNotEmpty) {
    int highestScore = students.first['score'] as int;
    int lowestScore = students.last['score'] as int;
    print('Highest Score: $highestScore');
    print('Lowest Score: $lowestScore');
  }


  




}

