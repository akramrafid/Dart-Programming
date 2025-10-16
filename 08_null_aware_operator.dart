// Define Person class first so it can be used in main
class Person {
  final String name;
  Person(this.name);
}

void main() { 
  // Null-aware operators in Dart
  int? nullableInt;
  int nonNullableInt = 5;

  // Null-coalescing operator (??)
  // At this point nullableInt is null, so nonNullableInt will be used
  int result = nullableInt ?? nonNullableInt;
  print("Result using ?? operator: $result"); // Will print 5

  // Null-aware assignment operator (??=)
  nullableInt ??= 10; // Assigns 10 because nullableInt is null
  print("After ??= operator, nullableInt: $nullableInt");

  // Now nullableInt is 10, so we can use it directly
  result = nullableInt; // nullableInt is known to be non-null here
  print("Result after nullableInt was assigned: $result"); // Will print 10

  // Null-aware access operator (?.)
  String? nullableString;
  if (DateTime.now().millisecondsSinceEpoch % 2 == 0) {
    nullableString = "Hello";
  }
  print("Length of nullableString using ?.: ${nullableString?.length}"); // May be null or a length

  // Null-aware method call
  List<int>? nullableList;
  if (DateTime.now().millisecondsSinceEpoch % 2 == 0) {
    nullableList = [1, 2, 3];
  }
  print("Length of nullableList using ?.: ${nullableList?.length}"); // May be null or 3

  // Example with a class
  Person? person;
  if (DateTime.now().millisecondsSinceEpoch % 2 == 0) {
    person = Person("Bob");
  }
  print("Person's name using ?.: ${person?.name}"); // May be null or "Bob"

  person = Person("Alice");
  // After initialization, we know person is not null, so we can use . instead of ?.
  print("Person's name after initialization: ${person.name}"); // Now it prints "Alice"  

  // Null operator in login example
  String? username;
  String displayName = username ?? "Guest"; // Uses "Guest" because username is null
  print("Display Name: $displayName");

  // When username has a value
  username = "JohnDoe";
  // Since we know username is not null here, we can assign directly
  displayName = username; // username is now "JohnDoe"
  print("Display Name: $displayName");
}