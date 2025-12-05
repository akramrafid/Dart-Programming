// Error Handling | Try-catch-finally block | Custom exceptions | Stack trace
// ============= CUSTOM EXCEPTIONS =============
class InvalidAgeException implements Exception {
  String message;
  InvalidAgeException(this.message);
  
  @override
  String toString() => 'InvalidAgeException: $message';
}

class InsufficientBalanceException implements Exception {
  String message;
  InsufficientBalanceException(this.message);
  
  @override
  String toString() => 'InsufficientBalanceException: $message';
}

class DivisionByZeroException implements Exception {
  String message;
  DivisionByZeroException(this.message);
  
  @override
  String toString() => 'DivisionByZeroException: $message';
}

class InvalidEmailException implements Exception {
  String message;
  InvalidEmailException(this.message);
  
  @override
  String toString() => 'InvalidEmailException: $message';
}

class InventoryException implements Exception {
  String message;
  InventoryException(this.message);
  
  @override
  String toString() => 'InventoryException: $message';
}

// ============= PERSON CLASS =============
class Person {
  String name;
  int _age;
  
  Person(this.name, this._age) {
    if (_age < 0 || _age > 150) {
      throw InvalidAgeException('Age must be between 0 and 150');
    }
  }
  
  int get age => _age;
  
  void displayInfo() {
    print('Name: $name | Age: $_age');
  }
}

// ============= BANK ACCOUNT CLASS =============
class BankAccount {
  String accountNumber;
  String accountHolder;
  late double _balance;
  
  BankAccount(this.accountNumber, this.accountHolder, double initialBalance) {
    if (initialBalance < 0) {
      throw InsufficientBalanceException('Initial balance cannot be negative');
    }
    _balance = initialBalance;
  }
  
  double get balance => _balance;
  
  void deposit(double amount) {
    try {
      if (amount <= 0) throw InsufficientBalanceException('Amount must be positive');
      _balance += amount;
      print('✓ Deposited: \$${amount.toStringAsFixed(2)} | Balance: \$${_balance.toStringAsFixed(2)}');
    } catch (e) {
      print('✗ Error: $e');
    }
  }
  
  void withdraw(double amount) {
    try {
      if (amount <= 0) throw InsufficientBalanceException('Amount must be positive');
      if (amount > _balance) throw InsufficientBalanceException('Insufficient balance');
      _balance -= amount;
      print('✓ Withdrawn: \$${amount.toStringAsFixed(2)} | Balance: \$${_balance.toStringAsFixed(2)}');
    } catch (e) {
      print('✗ Error: $e');
    }
  }
  
  void transfer(BankAccount recipient, double amount) {
    try {
      if (amount <= 0) throw InsufficientBalanceException('Amount must be positive');
      if (amount > _balance) throw InsufficientBalanceException('Insufficient balance');
      _balance -= amount;
      recipient._balance += amount;
      print('✓ Transferred: \$${amount.toStringAsFixed(2)} to ${recipient.accountHolder}');
    } catch (e) {
      print('✗ Error: $e');
    }
  }
  
  void displayInfo() {
    print('Account: $accountNumber | Holder: $accountHolder | Balance: \$${_balance.toStringAsFixed(2)}');
  }
}

// ============= CALCULATOR CLASS =============
class Calculator {
  double divide(double a, double b) {
    if (b == 0) throw DivisionByZeroException('Cannot divide by zero');
    return a / b;
  }
  
  double calculate(double a, double b, String op) {
    try {
      switch (op) {
        case '+':
          return a + b;
        case '-':
          return a - b;
        case '*':
          return a * b;
        case '/':
          return divide(a, b);
        default:
          throw Exception('Unknown operation: $op');
      }
    } catch (e) {
      print('Error: $e');
      return 0;
    }
  }
}

// ============= EMAIL VALIDATOR CLASS =============
class EmailValidator {
  void validate(String email) {
    try {
      if (email.isEmpty) throw InvalidEmailException('Email cannot be empty');
      if (!email.contains('@') || !email.contains('.')) {
        throw InvalidEmailException('Invalid email format');
      }
      List<String> parts = email.split('@');
      if (parts[0].isEmpty || parts.length < 2 || parts[1].isEmpty) {
        throw InvalidEmailException('Invalid email parts');
      }
      print('✓ Valid email: $email');
    } on InvalidEmailException catch (e) {
      print('✗ $e');
    }
  }
}

// ============= PRODUCT CLASS =============
class Product {
  String id;
  String name;
  int _quantity;
  
  Product(this.id, this.name, this._quantity);
  
  int get quantity => _quantity;
  
  void sell(int amount) {
    try {
      if (amount <= 0) throw InventoryException('Amount must be positive');
      if (amount > _quantity) throw InventoryException('Insufficient stock');
      _quantity -= amount;
      print('✓ Sold $amount units of $name');
    } on InventoryException catch (e) {
      print('✗ $e');
    }
  }
  
  void restock(int amount) {
    try {
      if (amount <= 0) throw InventoryException('Amount must be positive');
      _quantity += amount;
      print('✓ Restocked $amount units | New qty: $_quantity');
    } on InventoryException catch (e) {
      print('✗ $e');
    }
  }
}

// ============= MAIN FUNCTION =============
void main() {
  print('========== ERROR HANDLING DEMO ==========\n');
  
  // ===== TRY-CATCH-FINALLY =====
  print('--- TRY-CATCH-FINALLY ---');
  try {
    int result = 10 ~/ 2;
    print('10 / 2 = $result');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Finally block executed\n');
  }
  
  // ===== CUSTOM EXCEPTION - INVALID AGE =====
  print('--- INVALID AGE EXCEPTION ---');
  try {
    Person p1 = Person('John', 25);
    p1.displayInfo();
    Person p2 = Person('Jane', -5);
  } on InvalidAgeException catch (e) {
    print('✗ $e\n');
  }
  
  // ===== BANK ACCOUNT =====
  print('--- BANK ACCOUNT OPERATIONS ---');
  try {
    BankAccount acc1 = BankAccount('ACC001', 'Alice', 5000.0);
    BankAccount acc2 = BankAccount('ACC002', 'Bob', 2000.0);
    
    acc1.displayInfo();
    acc2.displayInfo();
    print('');
    
    acc1.deposit(1000.0);
    acc1.withdraw(2000.0);
    acc1.withdraw(10000.0);
    print('');
    
    acc1.transfer(acc2, 1500.0);
    print('');
    
    acc1.displayInfo();
    acc2.displayInfo();
  } catch (e) {
    print('Error: $e');
  }
  print('');
  
  // ===== CALCULATOR =====
  print('--- CALCULATOR OPERATIONS ---');
  Calculator calc = Calculator();
  print('10 + 5 = ${calc.calculate(10, 5, '+')}');
  print('20 / 4 = ${calc.calculate(20, 4, '/')}');
  print('15 / 0 = ${calc.calculate(15, 0, '/')}\n');
  
  // ===== EMAIL VALIDATION =====
  print('--- EMAIL VALIDATION ---');
  EmailValidator validator = EmailValidator();
  validator.validate('john@example.com');
  validator.validate('invalid.email');
  validator.validate('user@');
  validator.validate('');
  print('');
  
  // ===== INVENTORY =====
  print('--- INVENTORY OPERATIONS ---');
  Product laptop = Product('P001', 'Dell Laptop', 10);
  laptop.sell(5);
  laptop.sell(8);
  laptop.sell(-2);
  laptop.restock(15);
  laptop.restock(-5);
  print('');
  
  // ===== MULTIPLE CATCH BLOCKS =====
  print('--- MULTIPLE CATCH BLOCKS ---');
  try {
    int value = int.parse('abc');
    print('Parsed value: $value');
  } on FormatException {
    print('✗ Format exception caught');
  } on RangeError {
    print('✗ Range error caught');
  } catch (e) {
    print('✗ Generic exception: $e');
  }
}