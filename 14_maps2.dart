void main() {
  // Nested Maps
  Map<String, dynamic> company = {  
    'name': 'TechCorp',
    'employees': {
      'emp1': {
        'name': 'John Doe',
        'position': 'Developer'
      },
      'emp2': {
        'name': 'Jane Smith',
        'position': 'Designer'
      }
    }
  };  

  // Accessing nested map values
  print('Company Name: ${company['name']}');  
  print('Employee 1 Name: ${company['employees']['emp1']['name']}');
  print('Employee 2 Position: ${company['employees']['emp2']['position']}');

  // Modifying nested map values
  company['employees']['emp1']['position'] = 'Senior Developer';  
  print('Updated Employee 1 Position: ${company['employees']['emp1']['position']}');

  // Iterating through nested maps
  (company['employees'] as Map<String, dynamic>).forEach((key, value) {
    print('Employee ID: $key, Name: ${value['name']}, Position: ${value['position']}');
  });

  // Using Map.fromEntries()
  var entries = [ 
    MapEntry('fruit', 'Apple'), 
    MapEntry('vegetable', 'Carrot'), 
    MapEntry('grain', 'Rice') 
  ];
  var foodMap = Map.fromEntries(entries);
  print('Food Map: $foodMap');

  // Using Map.of()
  var originalMap = {'a': 1, 'b': 2, 'c': 3};
  var copiedMap = Map.of(originalMap);  
  print('Copied Map: $copiedMap');

  // Using Map.castFrom()
  Map<dynamic, dynamic> dynamicMap = {'x': 10, 'y': 20};
  Map<String, int> stringIntMap = Map.castFrom<dynamic, dynamic, String, int>(dynamicMap);
  print('Casted Map: $stringIntMap'); 

  // ✅ Safest fix: explicitly cast and use a new variable for emp1
  var employees = Map<String, dynamic>.from(company['employees']);

  var emp1 = Map<String, dynamic>.from(employees['emp1']);
  emp1['position'] = 'Lead Developer';
  employees['emp1'] = emp1;

  // Update the main company map
  company['employees'] = employees;

  print('Updated Employee 1 Position: ${company['employees']['emp1']['position']}');

  // Using Map.putIfAbsent()
  (company['employees'] as Map<String, dynamic>).putIfAbsent('emp3', () => {
    'name': 'Alice Johnson',
    'position': 'Manager'
  }); 

  print('Added Employee 3: ${company['employees']['emp3']['name']}, Position: ${company['employees']['emp3']['position']}');

  // Print final company structure
  print('\nFinal Company Structure:');
  print(company);
}
