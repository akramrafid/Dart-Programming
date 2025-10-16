void main() {

  // Basic arithmetic operations in Dart
  int a = 10;
  int b = 3;

  // Addition
  int sum = a + b;
  print("Addition: $a + $b = $sum");

  // Subtraction
  int difference = a - b;
  print("Subtraction: $a - $b = $difference");

  // Multiplication
  int product = a * b;
  print("Multiplication: $a * $b = $product");

  // Division
  double quotient = a / b;
  print("Division: $a / $b = $quotient");

  // Integer Division
  int intQuotient = a ~/ b;
  print("Integer Division: $a ~/ $b = $intQuotient");

  // Modulus
  int remainder = a % b;
  print("Modulus: $a % $b = $remainder");

  //integer division
  int c = 20;
  int d = 6;
  int intDiv = c ~/ d;
  print("\nInteger Division: $c ~/ $d = $intDiv");

  // Unary Minus
  int unaryMinus = a;
  print("Unary Minus: -$a = $unaryMinus");

  // Pre Increment
  int preIncrement = ++a;
  print("Pre Increment: ++$a = $preIncrement");
  a = 10; // Resetting a to original value
  // Post Increment
  int postIncrement = a++;
  print("Post Increment: $a++ = $postIncrement");
  a = 10; // Resetting a to original value
  print("Value of a after Post Increment: $a");

  // Pre Decrement
  int preDecrement = --b;
  print("Pre Decrement: --$b = $preDecrement");
  b = 3; // Resetting b to original value
  // Post Decrement
  int postDecrement = b--;
  print("Post Decrement: $b-- = $postDecrement");
   
  // Working with double values
  double x = 5.5;
  double y = 2.0;
  double doubleSum = x + y;
  print("\nAddition with Doubles: $x + $y = $doubleSum");

  double doubleQuotient = x / y;
  print("Division with Doubles: $x / $y = $doubleQuotient");

  double doubleRemainder = x % y;
  print("Modulus with Doubles: $x % $y = $doubleRemainder");

  // Mixed operations
  double mixedOperation = a + x * b - y / a;
  print("\nMixed Operation: $a + $x * $b - $y / $a = $mixedOperation");

  // Operator precedence
  int precedenceResult = a + b * c - d ~/ b;
  print("Operator Precedence: $a + $b * $c - $d ~/ $b = $precedenceResult");
  
  // Using parentheses to change precedence
  int parenthesesResult = (a + b) * (c - d) ~/ b;
  print("With Parentheses: ($a + $b) * ($c - $d) ~/ $b = $parenthesesResult");

  // Compound assignment operators
  int compound = 5;
  compound += 3; // compound = compound + 3
  print("\nCompound Assignment (+=): 5 += 3 -> $compound");
  compound *= 2; // compound = compound * 2
  print("Compound Assignment (*=): Result *= 2 -> $compound");
  compound -= 4; // compound = compound - 4
  print("Compound Assignment (-=): Result -= 4 -> $compound");
  compound ~/= 3; // compound = compound ~/ 3
  print("Compound Assignment (~/=): Result ~/= 3 -> $compound");
  compound %= 2; // compound = compound % 2
  print("Compound Assignment (%=): Result %= 2 -> $compound");

  // Bitwise operators
  int bitwiseA = 5;  // 0101
  int bitwiseB = 3;  // 0011

  int bitwiseAnd = bitwiseA & bitwiseB;
  print("\nBitwise AND: $bitwiseA & $bitwiseB = $bitwiseAnd");

  int bitwiseOr = bitwiseA | bitwiseB;
  print("Bitwise OR: $bitwiseA | $bitwiseB = $bitwiseOr");

  int bitwiseXor = bitwiseA ^ bitwiseB;
  print("Bitwise XOR: $bitwiseA ^ $bitwiseB = $bitwiseXor");

  int bitwiseNot = ~bitwiseA;
  print("Bitwise NOT: ~$bitwiseA = $bitwiseNot");

  int leftShift = bitwiseA << 1;
  print("Left Shift: $bitwiseA << 1 = $leftShift");

  int rightShift = bitwiseA >> 1;
  print("Right Shift: $bitwiseA >> 1 = $rightShift");

  //Compound assignment with arithmetic and bitwise operators
  int comp = 4;
  comp += 2; // comp = comp + 2
  print("\nCompound Assignment (+=): 4 += 2 -> $comp");
  comp &= 3; // comp = comp & 3
  print("Compound Assignment (&=): Result &= 3 -> $comp");
  comp ^= 1; // comp = comp ^ 1
  print("Compound Assignment (^=): Result ^= 1 -> $comp");
  comp |= 2; // comp = comp | 2
  print("Compound Assignment (|=): Result |= 2 -> $comp");
  
  comp <<= 1; // comp = comp << 1
  print("Compound Assignment (<<=): Result <<= 1 -> $comp");
  comp >>= 1; // comp = comp >> 1
  print("Compound Assignment (>>=): Result >>= 1 -> $comp");

  


}