// Advanced Functions in Dart
void main() {
  // Example of a higher-order function
  List<int> numbers = [1, 2, 3, 4, 5];

  // Using map to apply a function to each element
  List<int> squaredNumbers = numbers.map((num) => num * num).toList();
  print('Squared Numbers: $squaredNumbers');

  // Example of a closure
  Function makeAdder(int addBy) {
    return (int i) => addBy + i;
  }

  var add2 = makeAdder(2);
  var add5 = makeAdder(5);

  print('Add 2 to 3: ${add2(3)}'); // Outputs: 5
  print('Add 5 to 3: ${add5(3)}'); // Outputs: 8

  // Example of anonymous functions
  List<String> names = ['Alice', 'Bob', 'Charlie'];
  names.forEach((name) {
    print('Hello, $name!');
  });

  // Example of a function that returns another function
  Function multiplyBy(int factor) {
    return (int value) => value * factor;
  }

  var double = multiplyBy(2);
  var triple = multiplyBy(3);

  print('Double 5: ${double(5)}'); // Outputs: 10
  print('Triple 5: ${triple(5)}');
  // Outputs: 15
  
   
}




