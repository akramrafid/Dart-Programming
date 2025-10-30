//for-in loop collections 

void main (){
  List<String> fruits = ['Apple', 'Banana', 'Orange', 'Grapes'];

  print('List of fruits:');
  for (var fruit in fruits) {
    print(fruit);
  }

  Map<String, int> fruitPrices = {
    'Apple': 3,
    'Banana': 1,
    'Orange': 2,
    'Grapes': 4
  };

  print('\nFruit prices:');
  for (var entry in fruitPrices.entries) {
    print('${entry.key}: \$${entry.value}');
  }


  //Looping through a set
  Set<String> colors = {'Red', 'Green', 'Blue'};
  print('\nColors:');
  for (var color in colors) {
    print(color);
  }

  //looping through a map using break and continue
  print('\nFruit prices with conditions:');
  for (var entry in fruitPrices.entries) {  
    if (entry.value > 3) {
      print('Skipping ${entry.key} as it is too expensive.');
      continue;
    }
    print('${entry.key}: \$${entry.value}');
    if (entry.key == 'Orange') {
      print('Found Orange, stopping the loop.');
      break;
    }
  }
 
  //nested loop multiplication table
  print('\nMultiplication Table:');
  for (var i = 1; i <= 5; i++) {
    for (var j = 1; j <= 10; j++) {
      var product = i * j;
      print('$i x $j = $product');
    }
    print(''); // Blank line after each row
  }


}