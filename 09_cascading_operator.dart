void main() {   
    
    //without cascading operator
    var buffer1 = StringBuffer();
    buffer1.write('Hello');
    buffer1.write(' ');
    buffer1.write('World');
    String result1 = buffer1.toString();
    print('Without cascading operator: $result1');
    //with cascading operator
    var buffer2 = StringBuffer()
      ..write('Hello')
      ..write(' ')
      ..write('World');
    String result2 = buffer2.toString();
    print('With cascading operator: $result2');

    //with collection if
    var numbers = [1, 2, 3];
    var evenNumbers = <int>[
      for (var number in numbers)
        if (number % 2 == 0) number,
    ];
    print('Even numbers using cascading operator: $evenNumbers');

    //with collection if
    var mixedNumbers = [1, 2, 3, 4, 5];
    var processedNumbers = <int>[   
      for (var number in mixedNumbers)
        if (number % 2 == 0) 
          number * 2 
        else 
          number * 3,
    ];      

    print('Processed numbers using cascading operator: $processedNumbers');
    print('Processed numbers using cascading operator: $processedNumbers');

    

}