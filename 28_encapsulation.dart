// Encapsulation - Getters & Setters | Private fields (_variable) | Data hiding

// ============= STUDENT CLASS =============
class Student {
  String _studentId;
  String _name;
  int _age;
  double _gpa;
  List<String> _courses;

  Student(this._studentId, this._name, this._age, this._gpa)
      : _courses = [];

  // Getter for student ID
  String get studentId => _studentId;

  // Getter for name
  String get name => _name;

  // Setter for name with validation
  set name(String value) {
    if (value.isNotEmpty && value.length >= 2) {
      _name = value;
      print('Name updated to: $value');
    } else {
      print('Invalid name! Name must be at least 2 characters');
    }
  }

  // Getter for age
  int get age => _age;

  // Setter for age with validation
  set age(int value) {
    if (value > 0 && value < 120) {
      _age = value;
      print('Age updated to: $value');
    } else {
      print('Invalid age! Age must be between 1 and 120');
    }
  }

  // Getter for GPA
  double get gpa => _gpa;

  // Setter for GPA with validation
  set gpa(double value) {
    if (value >= 0.0 && value <= 4.0) {
      _gpa = value;
      print('GPA updated to: ${value.toStringAsFixed(2)}');
    } else {
      print('Invalid GPA! GPA must be between 0.0 and 4.0');
    }
  }

  // Getter for courses count
  int get courseCount => _courses.length;

  // Getter for courses (returns unmodifiable list)
  List<String> get courses => List.unmodifiable(_courses);

  // Add course
  void addCourse(String course) {
    if (!_courses.contains(course)) {
      _courses.add(course);
      print('Course "$course" added');
    } else {
      print('Course already exists!');
    }
  }

  // Remove course
  void removeCourse(String course) {
    if (_courses.contains(course)) {
      _courses.remove(course);
      print('Course "$course" removed');
    } else {
      print('Course not found!');
    }
  }

  // Get academic standing
  String get academicStanding {
    if (_gpa >= 3.5) return 'Excellent';
    if (_gpa >= 3.0) return 'Good';
    if (_gpa >= 2.0) return 'Average';
    return 'Poor';
  }

  // Display student info
  void displayInfo() {
    print('\n--- STUDENT INFORMATION ---');
    print('Student ID: $_studentId');
    print('Name: $_name');
    print('Age: $_age');
    print('GPA: ${_gpa.toStringAsFixed(2)} (${academicStanding})');
    print('Courses: ${_courses.isEmpty ? 'None' : _courses.join(', ')}');
  }
}

// ============= BANK ACCOUNT CLASS =============
class BankAccount {
  String _accountNumber;
  String _accountHolder;
  double _balance;
  List<String> _transactions;

  BankAccount(this._accountNumber, this._accountHolder, this._balance)
      : _transactions = [] {
    _transactions.add('Account opened with balance: \$${_balance.toStringAsFixed(2)}');
  }

  // Getter for account number
  String get accountNumber => _accountNumber;

  // Getter for account holder
  String get accountHolder => _accountHolder;

  // Setter for account holder
  set accountHolder(String value) {
    if (value.isNotEmpty && value.length >= 2) {
      _accountHolder = value;
      print('Account holder updated');
    } else {
      print('Invalid account holder name!');
    }
  }

  // Getter for balance (read-only)
  double get balance => _balance;

  // Deposit money
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      _transactions.add('Deposit: +\$${amount.toStringAsFixed(2)}');
      print('Deposited \$${amount.toStringAsFixed(2)}');
    } else {
      print('Deposit amount must be positive!');
    }
  }

  // Withdraw money
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      _transactions.add('Withdrawal: -\$${amount.toStringAsFixed(2)}');
      print('Withdrew \$${amount.toStringAsFixed(2)}');
    } else if (amount > _balance) {
      print('Insufficient balance!');
    } else {
      print('Withdrawal amount must be positive!');
    }
  }

  // Transfer to another account
  void transfer(BankAccount recipient, double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      recipient._balance += amount;
      _transactions.add('Transfer: -\$${amount.toStringAsFixed(2)} to ${recipient._accountNumber}');
      recipient._transactions.add('Transfer: +\$${amount.toStringAsFixed(2)} from $_accountNumber');
      print('Transferred \$${amount.toStringAsFixed(2)} to ${recipient._accountHolder}');
    } else {
      print('Transfer failed!');
    }
  }

  // Get transaction history
  List<String> get transactionHistory => List.unmodifiable(_transactions);

  // Display account info
  void displayInfo() {
    print('\n--- ACCOUNT INFORMATION ---');
    print('Account Number: $_accountNumber');
    print('Account Holder: $_accountHolder');
    print('Balance: \$${_balance.toStringAsFixed(2)}');
  }

  // Display transaction history
  void displayTransactions() {
    print('\n--- TRANSACTION HISTORY ---');
    for (var transaction in _transactions) {
      print(transaction);
    }
  }
}

// ============= EMPLOYEE CLASS =============
class Employee {
  String _employeeId;
  String _name;
  String _department;
  double _salary;
  DateTime _hireDate;

  Employee(this._employeeId, this._name, this._department, this._salary,
      this._hireDate);

  // Getter for employee ID
  String get employeeId => _employeeId;

  // Getter for name
  String get name => _name;

  // Setter for name
  set name(String value) {
    if (value.isNotEmpty && value.length >= 2) {
      _name = value;
      print('Employee name updated');
    } else {
      print('Invalid name!');
    }
  }

  // Getter for department
  String get department => _department;

  // Setter for department
  set department(String value) {
    if (value.isNotEmpty) {
      _department = value;
      print('Department updated to: $value');
    } else {
      print('Invalid department!');
    }
  }

  // Getter for salary
  double get salary => _salary;

  // Setter for salary with validation
  set salary(double value) {
    if (value > 0) {
      _salary = value;
      print('Salary updated to: \$${value.toStringAsFixed(2)}');
    } else {
      print('Salary must be positive!');
    }
  }

  // Getter for hire date
  DateTime get hireDate => _hireDate;

  // Get years of experience
  int get yearsOfExperience {
    return DateTime.now().year - _hireDate.year;
  }

  // Get salary grade
  String get salaryGrade {
    if (_salary >= 100000) return 'Grade A (Senior)';
    if (_salary >= 70000) return 'Grade B (Mid-level)';
    if (_salary >= 50000) return 'Grade C (Junior)';
    return 'Grade D (Entry-level)';
  }

  // Give raise
  void giveRaise(double percentage) {
    if (percentage > 0) {
      double raiseAmount = _salary * (percentage / 100);
      _salary += raiseAmount;
      print('Raise of ${percentage}% given! New salary: \$${_salary.toStringAsFixed(2)}');
    } else {
      print('Raise percentage must be positive!');
    }
  }

  // Display employee info
  void displayInfo() {
    print('\n--- EMPLOYEE INFORMATION ---');
    print('Employee ID: $_employeeId');
    print('Name: $_name');
    print('Department: $_department');
    print('Salary: \$${_salary.toStringAsFixed(2)}');
    print('Salary Grade: $salaryGrade');
    print('Hire Date: ${_hireDate.toString().split(' ')[0]}');
    print('Years of Experience: $yearsOfExperience');
  }
}

// ============= MAIN FUNCTION =============
void main() {
  print('========== ENCAPSULATION DEMO ==========\n');

  // ===== STUDENT CLASS DEMO =====
  print('--- STUDENT ENCAPSULATION ---');
  Student student = Student('STU001', 'John Doe', 20, 3.8);
  student.displayInfo();

  print('\n--- MODIFYING STUDENT DATA ---');
  student.name = 'Jane Smith';
  student.age = 21;
  student.gpa = 3.9;
  student.name = 'A'; // Invalid - too short

  student.addCourse('Data Structures');
  student.addCourse('Web Development');
  student.addCourse('Database Design');
  student.addCourse('Web Development'); // Already exists

  student.displayInfo();
  print('');

  // ===== BANK ACCOUNT CLASS DEMO =====
  print('--- BANK ACCOUNT ENCAPSULATION ---');
  BankAccount account1 = BankAccount('ACC001', 'John Doe', 5000.0);
  BankAccount account2 = BankAccount('ACC002', 'Jane Smith', 3000.0);

  account1.displayInfo();
  account2.displayInfo();

  print('\n--- BANK OPERATIONS ---');
  account1.deposit(1000.0);
  account1.withdraw(500.0);
  account1.withdraw(6000.0); // Insufficient balance
  account1.deposit(-100.0); // Invalid amount

  print('\n--- TRANSFER OPERATION ---');
  account1.transfer(account2, 750.0);

  account1.displayInfo();
  account2.displayInfo();

  account1.displayTransactions();
  print('');

  // ===== EMPLOYEE CLASS DEMO =====
  print('--- EMPLOYEE ENCAPSULATION ---');
  Employee employee1 = Employee('EMP001', 'Michael Brown', 'Engineering',
      85000.0, DateTime(2018, 5, 15));
  Employee employee2 = Employee('EMP002', 'Sarah Williams', 'Marketing',
      65000.0, DateTime(2020, 3, 20));

  employee1.displayInfo();
  employee2.displayInfo();

  print('\n--- MODIFYING EMPLOYEE DATA ---');
  employee1.department = 'Management';
  employee1.giveRaise(10);
  employee1.salary = -5000; // Invalid

  employee2.giveRaise(5);
  employee2.displayInfo();
  print('');

  // ===== DEMONSTRATING DATA HIDING =====
  print('--- DATA HIDING EXAMPLE ---');
  print('Student ID (read-only): ${student.studentId}');
  print('Account Number (read-only): ${account1.accountNumber}');
  print('Employee ID (read-only): ${employee1.employeeId}');
  print('Courses (unmodifiable list): ${student.courses}');
  print('Transaction History (unmodifiable list): ${account1.transactionHistory}');
}