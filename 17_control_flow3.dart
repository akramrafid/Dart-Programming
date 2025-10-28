import 'dart:io';

void main() {
  //do-while loop 

  String? choice;
  do {
    print ('-- Simple Menu --');
    print ('1. Say Hello');
    print ('2. Say Goodbye');
    print ('3. Exit');
    stdout.write('Enter your choice (1-3): ');

    choice = stdin.readLineSync();
    

    if (choice == '1') {
      print('Hello!\n');
    } else if (choice == '2') {
      print('Goodbye!\n');
    } else if (choice == '3') {
      print('Exiting the menu. Goodbye!');
    } else {
      print('Invalid choice. Please try again.\n');
    } 
  } while (choice != '3');

  print('Exiting the menu. Goodbye!');
  }