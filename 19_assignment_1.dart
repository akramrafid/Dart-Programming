/*Requirements:
The program should accept student information (name, ID, and score) from the user input.
Store all records in a List of Map
Create a grading system that gives each student a letter grade (A+ grade to F grade) based on their score.
Ensure student IDs are unique.
Display the following outputs:
A sorted list of students by score (descending order).
The total number of students entered.
The highest and lowest scores among all students.
*/

import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  while (true) {
    stdout.write('Enter student name (or "exit" to stop): ');
    String? name = stdin.readLineSync();
    if (name == null || name.toLowerCase() == 'exit') break;

    stdout.write('Enter student ID: ');
    int? id = int.tryParse(stdin.readLineSync()!);


    bool idExists = students.any((student) => student['id'] == id);
    if (idExists) {
      print('ID already exists. Please enter a unique ID.\n');
      continue;
    }

    stdout.write('Enter student score: ');
    int score = int.parse(stdin.readLineSync()!);

    String grade;
    if (score >= 80 && score <= 100) {
      grade = 'A+';
    } else if (score >= 70) {
      grade = 'A';
    } else if (score >= 60) {
      grade = 'A−';
    } else if (score >= 50) {
      grade = 'B';
    } else if (score >= 40) {
      grade = 'C';
    } else if (score >= 33) {
      grade = 'D';
    } else {
      grade = 'F';
    }

    students.add({
      'name': name,
      'id': id,
      'score': score,
      'grade': grade,
    });

  }
  students.sort((a, b) => b['score'].compareTo(a['score']));

  print('\nOur Students: ');
  for (var s in students) {
    print('Name: ${s['name']}, ID: ${s['id']}, Score: ${s['score']}, Grade: ${s['grade']}');
  }

  if (students.isNotEmpty) {
    print('\nTotal Students: ${students.length}');
    print('Highest Score: ${students.first['name']} = ${students.first['score']}');
    print('Lowest Score: ${students.last['name']} = ${students.last['score']}');
  }
}

