// for loop
void main (){

  //for loop example
  print('For Loop Example:'); 
  for (var i = 0; i < 5; i++) {
    print('Iteration: $i');
  } 

  //while loop example
  print('\nWhile Loop Example:'); 
  int count = 0;
  while (count < 5) {
    print('Count: $count');
    count++;
  } 

  //do-while loop example
  print('\nDo-While Loop Example:');  
  int num = 0;
  do {  
    print('Number: $num');
    num++;
  } while (num < 5);  

  //break statement example
  print('\nBreak Statement Example:');  
  for (var i = 0; i < 5; i++) {
    if (i == 3) {
      print('Breaking at iteration: $i');
      break;
    }
    print('Iteration: $i');
  }

  //continue statement example
  print('\nContinue Statement Example:');
  for (var i = 0; i < 5; i++) {
    if (i == 2) {
      print('Continuing at iteration: $i');
      continue;
    }
    print('Iteration: $i');
  }

  // nested loops example  
  print('\nNested Loops Example:');
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 2; j++) {
      print('Outer Loop: $i, Inner Loop: $j');
    }
  }

  //end of nested loops example
  print('End of Nested Loops Example');

  // Nested loop to print a pattern
  print('\nPattern Printing with Nested Loops:'); 
  int rows = 4;
  for (var i = 1; i <= rows; i++) {
    String stars = '';
    for (var j = 1; j <= i; j++) {
      stars += '* ';
    }
    print(stars);
  } 

  // Multiplication table using nested loops
  print('\nMultiplication Table:');
  for (var i = 1; i <= 5; i++) {
    for (var j = 1; j <= 5; j++) {
      print('$i * $j = ${i * j}');
    }
  }

  print('\nEnd of Multiplication Table');

  // Finding prime numbers using loops
  print('\nPrime Numbers between 1 and 20:');
  for (var num = 2; num <= 20; num++) {
    bool isPrime = true;
    for (var i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      print(num);
    }
  }


  print('\nEnd of Prime Numbers List');

}