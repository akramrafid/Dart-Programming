void main (){
 
 //Logical operators in Dart
  bool a = true;
  bool b = false;

  // AND operator (&&)
  bool andResult = a && b;
  print("AND (&&) Operator: $a && $b = $andResult");

  // OR operator (||)
  bool orResult = a || b;
  print("OR (||) Operator: $a || $b = $orResult");

  // NOT operator (!)
  bool notA = !a;
  bool notB = !b;
  print("NOT (!) Operator: !$a = $notA");
  print("NOT (!) Operator: !$b = $notB");

  // Combining logical operators
  bool combinedResult = (a && b) || (!a);
  print("Combined Logical Expression: ($a && $b) || (!$a) = $combinedResult");  

   
  // Short-circuit evaluation
  bool shortCircuitResult = (a && b) || (b && (b = true));
  print("Short-circuit Evaluation: ($a && $b) || ($b && (b = true)) = $shortCircuitResult");  
  print("Value of b after short-circuit evaluation: $b");

  // Conditional (ternary) operator
  int x = 10;
  int y = 20;
  String ternaryResult = (x > y) ? "x is greater than y" : "x is not greater than y";
  print("Ternary Operator: (x > y) ? 'x is greater than y' : 'x is not greater than y' = $ternaryResult");    
  

  // Truth tables for AND, OR, and NOT
  print("\nTruth Table for AND (&&):");
  print("A\tB\tA && B");
  print("true\ttrue\t${true && true}");
  print("true\tfalse\t${true && false}");
  print("false\ttrue\t${false && true}");
  print("false\tfalse\t${false && false}");
  print("\nTruth Table for OR (||):");
  print("A\tB\tA || B");
  print("true\ttrue\t${true || true}");
  print("true\tfalse\t${true || false}");
  print("false\ttrue\t${false || true}");
  print("false\tfalse\t${false || false}");
  print("\nTruth Table for NOT (!):");
  print("A\t!A");
  print("true\t${!true}");
  print("false\t${!false}");
  
  // More complex logical expressions
  bool complexExpression1 = (a || b) && (!a || b);
  bool complexExpression2 = !(a && b) || (a && !b);
  print("\nComplex Logical Expressions:");
  print("Expression 1: (a || b) && (!a || b) = $complexExpression1");
  print("Expression 2: !(a && b) || (a && !b) = $complexExpression2");  

  // Nested logical operators
  bool nestedExpression = ((a && !b) || (b && !a)) && (a || b);
  print("Nested Logical Expression: ((a && !b) || (b && !a  )) && (a || b) = $nestedExpression");

  // Logical operators with non-boolean values
  int num1 = 5;
  int num2 = 10;
  bool nonBooleanExpression = (num1 < num2) && (num2 > 0);
  print("\nLogical Operators with Non-Boolean Values:");  
  print("(num1 < num2) && (num2 > 0) = $nonBooleanExpression"); 
  bool nonBooleanExpression2 = (num1 > num2) || (num2 == 10);
  print("(num1 > num2) || (num2 == 10) = $nonBooleanExpression2");
  
  // Using logical operators in conditions
  if (a && !b) {
    print("\nCondition: a is true and b is false");
  } else {
    print("\nCondition: a is not true or b is not false");
  }   

  // Combining relational and logical operators
  int age = 25;
  bool isAdult = (age >= 18) && (age < 65);
  print("\nCombining Relational and Logical Operators:");
  print("Is age $age considered an adult (18 <= age < 65)? : $isAdult");    
  bool isSenior = (age >= 65) || (age < 0);
  print("Is age $age considered a senior (age >= 65 or age <  0)? : $isSenior");

  // Using logical operators in loops
  print("\nUsing Logical Operators in Loops:"); 
  for (int i = 0; i < 10; i++) {
    if (i % 2 == 0 && i > 5) {
      print("$i is even and greater than 5");
    }
  }   
  


}