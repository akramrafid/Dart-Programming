void main() {

 //Relational operators in Dart
 // Equal to (==)
 int a = 10;
  int b = 20;
  print("Equal to (==): $a == $b is ${a == b}");
  // Not equal to (!=)
  print("Not equal to (!=): $a != $b is ${a != b}");
  // Greater than (>)
  print("Greater than (>): $a > $b is ${a > b}");
  // Less than (<)
  print("Less than (<): $a < $b is ${a < b}");
  // Greater than or equal to (>=)
  print("Greater than or equal to (>=): $a >= $b is ${a >= b}");
  // Less than or equal to (<=)
  print("Less than or equal to (<=): $a <= $b is ${a <= b}");

  // Comparing strings
  String str1 = "Hello";
  String str2 = "World";
  print("\nString Comparison:");
  print("Equal to (==): '$str1' == '$str2' is ${str1 == str2}");
  print("Not equal to (!=): '$str1' != '$str2' is ${str1 != str2}");
  print("Greater than (>): '$str1' > '$str2' is ${str1.compareTo(str2) > 0}");
  print("Less than (<): '$str1' < '$str2' is ${str1.compareTo(str2) < 0}");
  print("Greater than or equal to (>=): '$str1' >= '$str2' is ${str1.compareTo(str2) >= 0}");
  print("Less than or equal to (<=): '$str1' <= '$str2' is ${str1.compareTo(str2) <= 0}");

  // Comparing doubles
  double x = 5.5;
  double y = 10.5;
  print("\nDouble Comparison:");
  print("Equal to (==): $x == $y is ${x == y}");
  print("Not equal to (!=): $x != $y is ${x != y}");
  print("Greater than (>): $x > $y is ${x > y}");
  print("Less than (<): $x < $y is ${x < y}");
  print("Greater than or equal to (>=): $x >= $y is ${x >= y}");
  print("Less than or equal to (<=): $x <= $y is ${x <= y}");

  // Comparing booleans
  bool bool1 = true;
  bool bool2 = false;
  print("\nBoolean Comparison:");
  print("Equal to (==): $bool1 == $bool2 is ${bool1 == bool2}");
  print("Not equal to (!=): $bool1 != $bool2 is ${bool1 != bool2}");

  // Comparing Strings
  String name1 = "Alice";
  String name2 = "Bob";

  print("\nString Comparison:");
  print("Is '$name1' equal to '$name2'? : ${name1 == name2}");
  print("Is '$name1' not equal to '$name2'? : ${name1 != name2}");
  print("Is '$name1' greater than '$name2'? : ${name1.compareTo(name2) > 0}");
  print("Is '$name1' less than '$name2'? : ${name1.compareTo(name2) < 0}");
  print("Is '$name1' greater than or equal to '$name2'? : ${name1.compareTo(name2) >= 0}");
  print("Is '$name1' less than or equal to '$name2'? : ${name1.compareTo(name2) <= 0}");  

  // Comparing other strings
  String city1 = "Chattogram";
  String city2 = "Dhaka";
  print("\nString Comparison:");
  print("Is '$city1' equal to '$city2'? : ${city1 == city2}");
  print("Is '$city1' not equal to '$city2'? : ${city1 != city2}");  
  print("Is '$city1' greater than '$city2'? : ${city1.compareTo(city2) > 0}");
  print("Is '$city1' less than '$city2'? : ${city1.compareTo(city2) < 0}");
  print("Is '$city1' greater than or equal to '$city2'? : ${city1.compareTo(city2) >= 0}");
  print("Is '$city1' less than or equal to '$city2'? : ${city1.compareTo(city2) <= 0}");  

  

  

  


}