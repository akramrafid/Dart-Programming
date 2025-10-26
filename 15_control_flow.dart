void main () {
  
  // If-Else Statements
  int number = 0;
  if (number > 0) {
    print('$number is positive');
  } else if (number < 0) {
    print('$number is negative');
  } else {
    print('The number is zero');
  }


  //Nested If-Else Statements
  int score = 85;
  if (score >= 90) {
    print('Grade: A');
  } else {
    if (score >= 80) {
      print('Grade: B');
    } else {
      if (score >= 70) {
        print('Grade: C');
      } else {
        print('Grade: F');
      }
    }
  }

  // Switch Statements
  String day = 'Monday';  
  switch (day) {
    case 'Monday':
      print('Start of the work week');
      break;
    case 'Wednesday':
      print('Midweek day');
      break;
    case 'Friday':
      print('End of the work week');
      break;
    default:
      print('Just another day');
  }

  // Pattern Matching with switch
  var value = 42;
  switch (value) {
    case int n when n.isEven:
      print('$n is even');
      break;
    case int n when n.isOdd:
      print('$n is odd');
      break;  
    default:
      print('Not an integer');
  }

}