void main() {
  // GROWABLE VS. FIXED LENGTH LISTS
  var growableList = <int>[1, 2, 3];
  growableList.add(4);
  print('Growable List: $growableList');
  var fixedLengthList = List<int>.filled(3, 0);
  // fixedLengthList.add(4); // This will throw an error
  fixedLengthList[0] = 1;
  fixedLengthList[1] = 2;
  fixedLengthList[2] = 3;
  print('Fixed Length List: $fixedLengthList');
  // LIST LITERALS AND COLLECTION IF
  var numbers = [1, 2, 3, 4, 5];
  var evenNumbers = [
    for (var number in numbers)
      if (number % 2 == 0) number,
  ];
  print('Even Numbers: $evenNumbers');
  var processedNumbers = [
    for (var number in numbers)
      if (number % 2 == 0)
        number * 2
      else
        number * 3,
  ];
  print('Processed Numbers: $processedNumbers');
  var allNumbers = [
    ...numbers,
    6,
    7,
    8,
  ];
  print('All Numbers: $allNumbers');  

  var combinedList = [
    ...numbers,
    ...evenNumbers,
  ];  

  print('Combined List: $combinedList');  
  var uniqueNumbers = {
    ...numbers,
    2,
    3,
    4,
  };  print('Unique Numbers: $uniqueNumbers');    

  var numberSet = <int>{
    1,
    2,
    3,
    2,
    1,
  };  print('Number Set: $numberSet');  

  var numberList = <int>[
    1,
    2,
    3,
    2,
    1,
  ];  print('Number List: $numberList');  

  var numberMap = <int, String>{
    1: 'One',
    2: 'Two',
    3: 'Three',
  };  print('Number Map: $numberMap');  

  var numberMap2 = <String, int>{
    'One': 1,
    'Two': 2,
    'Three': 3,
  };  print('Number Map 2: $numberMap2'); 

  var numberMap3 = <String, String>{
    'One': 'Uno',
    'Two': 'Dos',
    'Three': 'Tres',
  };  print('Number Map 3: $numberMap3'); 

  var numberMap4 = <String, String>{
    for (var number in numbers) number.toString(): 'Number $number',
  };  print('Number Map 4: $numberMap4'); 

  var numberMap5 = <String, String>{  
    for (var number in numbers) 
      if (number % 2 == 0) 
        number.toString(): 'Even $number' 
      else 
        number.toString(): 'Odd $number',
  };  print('Number Map 5: $numberMap5'); 

  var numberMap6 = <String, String>{  
    ...numberMap3,
    'Four': 'Cuatro',
    'Five': 'Cinco',
  };  print('Number Map 6: $numberMap6'); 
  
  





}


