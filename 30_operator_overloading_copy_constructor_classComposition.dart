// Operator Overloading | Copy Constructor | Class Composition

// ============= POINT CLASS WITH OPERATOR OVERLOADING =============
class Point {
  double x;
  double y;

  Point(this.x, this.y);

  // Copy constructor
  Point.copy(Point other) : x = other.x, y = other.y;

  // Addition operator
  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  // Subtraction operator
  Point operator -(Point other) {
    return Point(x - other.x, y - other.y);
  }

  // Multiplication operator (scalar)
  Point operator *(double scalar) {
    return Point(x * scalar, y * scalar);
  }

  // Division operator (scalar)
  Point operator /(double scalar) {
    if (scalar == 0) throw Exception('Cannot divide by zero');
    return Point(x / scalar, y / scalar);
  }

  // Equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Point && x == other.x && y == other.y;
  }

  // Hash code for use in collections
  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  // Less than operator
  bool operator <(Point other) {
    double dist1 = (x * x + y * y);
    double dist2 = (other.x * other.x + other.y * other.y);
    return dist1 < dist2;
  }

  // Greater than operator
  bool operator >(Point other) {
    double dist1 = (x * x + y * y);
    double dist2 = (other.x * other.x + other.y * other.y);
    return dist1 > dist2;
  }

  @override
  String toString() => 'Point($x, $y)';
}

// ============= VECTOR CLASS WITH OPERATOR OVERLOADING =============
class Vector {
  List<double> components;

  Vector(this.components);

  // Copy constructor
  Vector.copy(Vector other) : components = List.from(other.components);

  // Vector addition
  Vector operator +(Vector other) {
    if (components.length != other.components.length) {
      throw Exception('Vectors must have same dimension');
    }
    List<double> result = [];
    for (int i = 0; i < components.length; i++) {
      result.add(components[i] + other.components[i]);
    }
    return Vector(result);
  }

  // Vector subtraction
  Vector operator -(Vector other) {
    if (components.length != other.components.length) {
      throw Exception('Vectors must have same dimension');
    }
    List<double> result = [];
    for (int i = 0; i < components.length; i++) {
      result.add(components[i] - other.components[i]);
    }
    return Vector(result);
  }

  // Scalar multiplication
  Vector operator *(double scalar) {
    return Vector(components.map((c) => c * scalar).toList());
  }

  // Dot product
  double operator &(Vector other) {
    if (components.length != other.components.length) {
      throw Exception('Vectors must have same dimension');
    }
    double result = 0;
    for (int i = 0; i < components.length; i++) {
      result += components[i] * other.components[i];
    }
    return result;
  }

  // Equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Vector) return false;
    if (components.length != other.components.length) return false;
    for (int i = 0; i < components.length; i++) {
      if (components[i] != other.components[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode => components.hashCode;

  @override
  String toString() => 'Vector(${components.join(', ')})';
}

// ============= MONEY CLASS WITH OPERATOR OVERLOADING =============
class Money {
  double amount;
  String currency;

  Money(this.amount, this.currency);

  // Copy constructor
  Money.copy(Money other) : amount = other.amount, currency = other.currency;

  // Addition operator
  Money operator +(Money other) {
    if (currency != other.currency) {
      throw Exception('Cannot add different currencies');
    }
    return Money(amount + other.amount, currency);
  }

  // Subtraction operator
  Money operator -(Money other) {
    if (currency != other.currency) {
      throw Exception('Cannot subtract different currencies');
    }
    return Money(amount - other.amount, currency);
  }

  // Multiplication operator
  Money operator *(double multiplier) {
    return Money(amount * multiplier, currency);
  }

  // Negation operator
  Money operator -() {
    return Money(-amount, currency);
  }

  // Comparison operators
  bool operator >(Money other) {
    if (currency != other.currency) {
      throw Exception('Cannot compare different currencies');
    }
    return amount > other.amount;
  }

  bool operator <(Money other) {
    if (currency != other.currency) {
      throw Exception('Cannot compare different currencies');
    }
    return amount < other.amount;
  }

  bool operator >=(Money other) => this > other || this == other;

  bool operator <=(Money other) => this < other || this == other;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Money && amount == other.amount && currency == other.currency;
  }

  @override
  int get hashCode => amount.hashCode ^ currency.hashCode;

  @override
  String toString() => '$currency ${amount.toStringAsFixed(2)}';
}

// ============= ADDRESS CLASS FOR COMPOSITION =============
class Address {
  String street;
  String city;
  String state;
  String zipCode;

  Address(this.street, this.city, this.state, this.zipCode);

  // Copy constructor
  Address.copy(Address other)
      : street = other.street,
        city = other.city,
        state = other.state,
        zipCode = other.zipCode;

  void displayAddress() {
    print('$street');
    print('$city, $state $zipCode');
  }

  @override
  String toString() => '$street, $city, $state $zipCode';
}

// ============= COMPANY CLASS FOR COMPOSITION =============
class Company {
  String name;
  String industry;
  int employeeCount;

  Company(this.name, this.industry, this.employeeCount);

  // Copy constructor
  Company.copy(Company other)
      : name = other.name,
        industry = other.industry,
        employeeCount = other.employeeCount;

  void displayCompany() {
    print('Company: $name');
    print('Industry: $industry');
    print('Employees: $employeeCount');
  }

  @override
  String toString() => '$name ($industry) - $employeeCount employees';
}

// ============= PERSON CLASS WITH COMPOSITION =============
class Person {
  String name;
  int age;
  Address address;
  Company? company;

  Person(this.name, this.age, this.address, {this.company});

  // Copy constructor with composition
  Person.copy(Person other)
      : name = other.name,
        age = other.age,
        address = Address.copy(other.address),
        company = other.company != null ? Company.copy(other.company!) : null;

  void displayInfo() {
    print('--- PERSON INFORMATION ---');
    print('Name: $name');
    print('Age: $age');
    print('Address:');
    address.displayAddress();
    if (company != null) {
      print('Works at:');
      company!.displayCompany();
    } else {
      print('Currently unemployed');
    }
  }

  @override
  String toString() => '$name, $age, living at $address';
}

// ============= BANK ACCOUNT CLASS WITH COMPOSITION =============
class BankAccount {
  String accountNumber;
  String accountHolder;
  Money balance;
  List<String> transactionHistory;

  BankAccount(this.accountNumber, this.accountHolder, this.balance)
      : transactionHistory = [] {
    transactionHistory.add('Account opened with balance: $balance');
  }

  // Copy constructor
  BankAccount.copy(BankAccount other)
      : accountNumber = other.accountNumber,
        accountHolder = other.accountHolder,
        balance = Money.copy(other.balance),
        transactionHistory = List.from(other.transactionHistory);

  void deposit(Money amount) {
    if (amount.currency != balance.currency) {
      throw Exception('Currency mismatch!');
    }
    balance = balance + amount;
    transactionHistory.add('Deposit: +$amount | New Balance: $balance');
  }

  void withdraw(Money amount) {
    if (amount.currency != balance.currency) {
      throw Exception('Currency mismatch!');
    }
    if (balance < amount) {
      throw Exception('Insufficient balance!');
    }
    balance = balance - amount;
    transactionHistory.add('Withdrawal: -$amount | New Balance: $balance');
  }

  void transfer(BankAccount recipient, Money amount) {
    if (balance.currency != amount.currency) {
      throw Exception('Currency mismatch!');
    }
    withdraw(amount);
    recipient.deposit(amount);
    transactionHistory.add('Transfer to ${recipient.accountHolder}: -$amount');
  }

  void displayInfo() {
    print('Account Number: $accountNumber');
    print('Account Holder: $accountHolder');
    print('Balance: $balance');
  }

  void displayTransactions() {
    print('--- TRANSACTION HISTORY ---');
    for (var transaction in transactionHistory) {
      print(transaction);
    }
  }

  @override
  String toString() => '$accountHolder - $balance';
}

// ============= MAIN FUNCTION =============
void main() {
  print('========== OPERATOR OVERLOADING & COMPOSITION DEMO ==========\n');

  // ===== POINT OPERATOR OVERLOADING =====
  print('--- POINT OPERATOR OVERLOADING ---\n');
  Point p1 = Point(3, 4);
  Point p2 = Point(1, 2);

  print('Point 1: $p1');
  print('Point 2: $p2');
  print('p1 + p2 = ${p1 + p2}');
  print('p1 - p2 = ${p1 - p2}');
  print('p1 * 2 = ${p1 * 2}');
  print('p1 / 2 = ${p1 / 2}');
  print('p1 == p2: ${p1 == p2}');
  print('p1 > p2: ${p1 > p2}');

  // Copy constructor
  Point p3 = Point.copy(p1);
  print('Copy of p1: $p3');
  print('p1 == p3: ${p1 == p3}');
  print('');

  // ===== VECTOR OPERATOR OVERLOADING =====
  print('--- VECTOR OPERATOR OVERLOADING ---\n');
  Vector v1 = Vector([1, 2, 3]);
  Vector v2 = Vector([4, 5, 6]);

  print('Vector 1: $v1');
  print('Vector 2: $v2');
  print('v1 + v2 = ${v1 + v2}');
  print('v1 - v2 = ${v1 - v2}');
  print('v1 * 2 = ${v1 * 2}');
  print('v1 · v2 (dot product) = ${v1 & v2}');
  print('v1 == v2: ${v1 == v2}');

  // Copy constructor
  Vector v3 = Vector.copy(v1);
  print('Copy of v1: $v3');
  print('v1 == v3: ${v1 == v3}');
  print('');

  // ===== MONEY OPERATOR OVERLOADING =====
  print('--- MONEY OPERATOR OVERLOADING ---\n');
  Money m1 = Money(100.0, 'USD');
  Money m2 = Money(50.0, 'USD');

  print('Money 1: $m1');
  print('Money 2: $m2');
  print('m1 + m2 = ${m1 + m2}');
  print('m1 - m2 = ${m1 - m2}');
  print('m1 * 1.5 = ${m1 * 1.5}');
  print('-m1 = ${-m1}');
  print('m1 > m2: ${m1 > m2}');
  print('m1 <= m2: ${m1 <= m2}');

  // Copy constructor
  Money m3 = Money.copy(m1);
  print('Copy of m1: $m3');
  print('m1 == m3: ${m1 == m3}');
  print('');

  // ===== CLASS COMPOSITION =====
  print('--- CLASS COMPOSITION (Person & Company) ---\n');
  Address addr1 = Address('123 Main St', 'New York', 'NY', '10001');
  Company comp1 = Company('Tech Corp', 'Technology', 500);
  Person person1 = Person('John Doe', 30, addr1, company: comp1);

  person1.displayInfo();
  print('');

  // Copy constructor with composition
  Person person2 = Person.copy(person1);
  print('--- COPIED PERSON ---');
  person2.displayInfo();
  print('');

  // ===== BANK ACCOUNT COMPOSITION =====
  print('--- BANK ACCOUNT WITH MONEY COMPOSITION ---\n');
  BankAccount acc1 = BankAccount('ACC001', 'John Doe', Money(5000.0, 'USD'));
  BankAccount acc2 = BankAccount('ACC002', 'Jane Smith', Money(3000.0, 'USD'));

  acc1.displayInfo();
  acc2.displayInfo();
  print('');

  print('--- BANK OPERATIONS ---');
  acc1.deposit(Money(1000.0, 'USD'));
  acc1.withdraw(Money(500.0, 'USD'));
  acc1.transfer(acc2, Money(750.0, 'USD'));

  print('');
  acc1.displayInfo();
  acc2.displayInfo();

  print('');
  acc1.displayTransactions();

  print('');
  // Copy constructor for bank account
  BankAccount acc3 = BankAccount.copy(acc1);
  print('--- COPIED ACCOUNT ---');
  acc3.displayInfo();
}