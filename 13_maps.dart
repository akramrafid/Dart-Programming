void main() {
  // 1. Different ways to create Maps
  // Using literal syntax
  Map<String, dynamic> user = {
    'name': 'Alice',
    'age': 30,
    'city': 'New York'
  };

  // Using Map constructor
  Map<String, int> scores = Map();
   



  // Using Map.from()
  Map<String, int> existingScores = {'Math': 95, 'Science': 90};
  Map<String, int> newScores = Map.from(existingScores);

  // 2. Nested Maps
  Map<String, dynamic> product = {
    'id': 101,
    'name': 'Laptop',
    'specs': {
      'processor': 'Intel i7',
      'ram': '16GB',
      'storage': '512GB SSD'
    }
  };

  // 3. Basic Map Operations
  print('Original user: $user');
  print('Keys: ${user.keys}');
  print('Values: ${user.values}');
  print('Entries: ${user.entries}');

  // 4. Map Methods and Properties
  print('Length: ${user.length}');
  print('Is empty: ${user.isEmpty}');
  print('Is not empty: ${user.isNotEmpty}');
  
  // 5. Accessing and Modifying
  user['country'] = 'USA';  // Adding new key-value
  user.putIfAbsent('phone', () => '123-456-7890');
  user.update('age', (value) => 31, ifAbsent: () => 20);
  
  // 6. Checking and Removing
  if (user.containsKey('age')) {
    print('Age is present: ${user['age']}');
  }
  user.remove('city');

  // 7. Collection if and spread operator
  bool isAdmin = true;
  Map<String, dynamic> adminUser = {
    ...user,
    if (isAdmin) 'role': 'admin',
  };

  // 8. Advanced Iteration
  // Using forEach
  user.forEach((key, value) => print('$key: $value'));

  // Using for-in with entries
  for (var entry in product.entries) {
    print('${entry.key}: ${entry.value}');
    if (entry.key == 'specs') {
      Map<String, String> specs = entry.value;
      specs.forEach((specKey, specValue) {
        print('  $specKey: $specValue');
      });
    }
  }

  // 9. Map Transformations
  // Filtering
  var filteredMap = Map.fromEntries(
    user.entries.where((entry) => entry.value is String)
  );

  // Transform values
  var transformedMap = user.map(
    (key, value) => MapEntry(key, value.toString().toUpperCase())
  );

  // 10. Immutability
  final unmodifiableMap = Map.unmodifiable(user);

  // Print final results
  print('\nFinal Results:');
  print('Original User: $user');
  print('Admin User: $adminUser');
  print('Filtered Map: $filteredMap');
  print('Transformed Map: $transformedMap');
}