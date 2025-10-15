//learning datatype in dart
void main() {
  print("Basic Data Types in Dart");

  // Integer
  int age = 25;
  print("\nInteger Example: Age = $age");

  // Double
  double height = 5.9;
  print("\nDouble Example: Height = $height");

  // Boolean
  bool isStudent = true;
  print("\nBoolean Example: Is Student = $isStudent");

  // String
  String name = "Akram";
  print("\nString Example: Name = $name");

  // List (Array)
  List<String> fruits = ["Apple", "Banana", "Orange"];
  print("\nList Example: Fruits = $fruits");

  // Map (Dictionary)
  Map<String, int> scores = {
    "Math": 90,
    "Science": 85,
    "English": 88
  };
  print("\nMap Example: Scores = $scores");

  // Set
  Set<String> uniqueNames = {"Alice", "Bob", "Charlie"};
  print("\nSet Example: Unique Names = $uniqueNames");

  // Dynamic
  dynamic variable = "I can be anything";
  print("\nDynamic Example: Variable = $variable");
  variable = 42;
  print("Dynamic Example after change: Variable = $variable");
}