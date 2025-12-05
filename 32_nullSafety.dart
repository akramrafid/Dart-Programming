// Null Safety | Nullable vs Non-nullable types | ?, ??, late, !

// ============= NULLABLE AND NON-NULLABLE TYPES =============
class Person {
  String name; // Non-nullable - must be initialized
  String? middleName; // Nullable - can be null
  int age; // Non-nullable
  String? phoneNumber; // Nullable

  Person(this.name, this.age, {this.middleName, this.phoneNumber});

  void displayInfo() {
    print('Name: $name');
    print('Middle Name: ${middleName ?? 'Not provided'}'); // Null coalescing operator
    print('Age: $age');
    print('Phone: ${phoneNumber ?? 'Not provided'}');
  }
}

// ============= LATE KEYWORD EXAMPLE =============
class Student {
  String studentId;
  String name;
  late String email; // Will be initialized later
  late List<String> courses;

  Student(this.studentId, this.name);

  void setEmail(String emailAddress) {
    email = emailAddress;
  }

  void addCourse(String courseName) {
    courses.add(courseName);
  }

  void initializeCourses() {
    courses = [];
  }

  void displayInfo() {
    print('ID: $studentId | Name: $name | Email: $email');
    print('Courses: ${courses.isEmpty ? 'None' : courses.join(', ')}');
  }
}

// ============= NULLABLE RETURN TYPES =============
class Database {
  Map<String, String> users = {
    'user1': 'John',
    'user2': 'Jane',
    'user3': 'Bob',
  };

  // Nullable return type
  String? findUser(String userId) {
    return users[userId];
  }

  // Non-nullable return type
  String findUserOrDefault(String userId) {
    return users[userId] ?? 'User not found';
  }

  // Using ! operator (force unwrap)
  String getUser(String userId) {
    return users[userId]!; // Throws error if null
  }
}

// ============= OPTIONAL PARAMETERS =============
class Product {
  String productId;
  String productName;
  double price;
  String? description; // Nullable optional parameter
  int? quantity; // Nullable optional parameter
  String? category; // Nullable optional parameter

  Product(
    this.productId,
    this.productName,
    this.price, {
    this.description,
    this.quantity,
    this.category,
  });

  void displayInfo() {
    print('ID: $productId | Name: $productName | Price: \$${price.toStringAsFixed(2)}');
    if (description != null) print('Description: $description');
    if (quantity != null) print('Quantity: $quantity');
    if (category != null) print('Category: $category');
  }
}

// ============= NULL CHECKING AND TYPE PROMOTION =============
class Email {
  String? emailAddress;

  Email(this.emailAddress);

  void validateEmail() {
    // Type promotion - after null check, Dart knows it's non-nullable
    if (emailAddress != null) {
      print('Email is valid: $emailAddress');
      print('Email length: ${emailAddress!.length}'); // No error!
    } else {
      print('Email is null');
    }
  }

  void sendEmail() {
    // Using null-aware operator
    emailAddress?.split('@').forEach((part) {
      print('Part: $part');
    });
  }

  String? getEmailDomain() {
    // Using null coalescing assignment operator
    return emailAddress?.split('@').last;
  }
}

// ============= NULLABLE LIST OPERATIONS =============
class Team {
  String teamName;
  List<String>? members; // Nullable list

  Team(this.teamName, {this.members});

  void addMember(String memberName) {
    // Initialize list if null
    members ??= [];
    members!.add(memberName);
  }

  void displayMembers() {
    if (members == null) {
      print('No team members yet');
      return;
    }
    print('Team: $teamName | Members: ${members!.join(', ')}');
  }

  int? getTeamSize() {
    return members?.length; // Null-safe navigation
  }
}

// ============= CONDITIONAL EXPRESSIONS WITH NULL SAFETY =============
class BankAccount {
  String accountNumber;
  double? balance;
  String? accountHolder;

  BankAccount(this.accountNumber, {this.balance, this.accountHolder});

  void displayInfo() {
    print('Account: $accountNumber');
    print('Holder: ${accountHolder ?? 'Unknown'}');
    print('Balance: ${balance != null ? '\$${balance!.toStringAsFixed(2)}' : 'Not set'}');
  }

  void deposit(double amount) {
    balance = (balance ?? 0) + amount;
    print('Deposited: \$${amount.toStringAsFixed(2)} | New Balance: \$${balance!.toStringAsFixed(2)}');
  }
}

// ============= EXTENSION METHODS WITH NULL SAFETY =============
extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  String get safeValue => this ?? 'Value not provided';

  int get safeLength => this?.length ?? 0;
}

extension IntExtension on int? {
  int get valueOrZero => this ?? 0;

  bool get isPositive => (this ?? 0) > 0;
}

// ============= MAIN FUNCTION =============
void main() {
  print('========== NULL SAFETY DEMO ==========\n');

  // ===== NULLABLE VS NON-NULLABLE =====
  print('--- NULLABLE VS NON-NULLABLE TYPES ---\n');
  Person person1 = Person('John Doe', 30, middleName: 'Michael', phoneNumber: '555-1234');
  person1.displayInfo();
  print('');

  Person person2 = Person('Jane Smith', 25);
  person2.displayInfo();
  print('');

  // ===== LATE KEYWORD =====
  print('--- LATE KEYWORD ---\n');
  Student student = Student('STU001', 'Alice Johnson');
  student.initializeCourses();
  student.setEmail('alice@example.com');
  student.addCourse('Dart Programming');
  student.addCourse('Web Development');
  student.displayInfo();
  print('');

  // ===== NULLABLE RETURN TYPES =====
  print('--- NULLABLE RETURN TYPES ---\n');
  Database db = Database();
  String? foundUser = db.findUser('user1');
  print('Found user: ${foundUser ?? 'Not found'}');

  String foundUser2 = db.findUserOrDefault('user99');
  print('Found user: $foundUser2');

  try {
    String user = db.getUser('user99'); // This will throw error
  } catch (e) {
    print('Error: Cannot unwrap null value');
  }
  print('');

  // ===== OPTIONAL PARAMETERS =====
  print('--- OPTIONAL PARAMETERS ---\n');
  Product p1 = Product('P001', 'Laptop', 999.99,
      description: 'High-performance laptop', quantity: 5, category: 'Electronics');
  p1.displayInfo();
  print('');

  Product p2 = Product('P002', 'Mouse', 29.99);
  p2.displayInfo();
  print('');

  // ===== NULL CHECKING AND TYPE PROMOTION =====
  print('--- NULL CHECKING AND TYPE PROMOTION ---\n');
  Email email1 = Email('john@example.com');
  email1.validateEmail();
  email1.sendEmail();
  print('Email domain: ${email1.getEmailDomain()}');
  print('');

  Email email2 = Email(null);
  email2.validateEmail();
  print('');

  // ===== NULLABLE LIST OPERATIONS =====
  print('--- NULLABLE LIST OPERATIONS ---\n');
  Team team1 = Team('Dev Team', members: ['Alice', 'Bob', 'Charlie']);
  team1.displayMembers();
  print('Team size: ${team1.getTeamSize()}');
  print('');

  Team team2 = Team('QA Team');
  team2.displayMembers();
  team2.addMember('David');
  team2.addMember('Eve');
  team2.displayMembers();
  print('Team size: ${team2.getTeamSize()}');
  print('');

  // ===== CONDITIONAL EXPRESSIONS =====
  print('--- CONDITIONAL EXPRESSIONS ---\n');
  BankAccount acc1 = BankAccount('ACC001', balance: 5000.0, accountHolder: 'John');
  acc1.displayInfo();
  print('');

  BankAccount acc2 = BankAccount('ACC002');
  acc2.displayInfo();
  acc2.deposit(1000.0);
  print('');

  // ===== EXTENSION METHODS WITH NULL SAFETY =====
  print('--- EXTENSION METHODS WITH NULL SAFETY ---\n');
  String? name = 'Alice';
  String? nullName;
  String? emptyName = '';

  print('Name "$name" is null or empty: ${name.isNullOrEmpty}');
  print('Name "$nullName" is null or empty: ${nullName.isNullOrEmpty}');
  print('Name "$emptyName" is null or empty: ${emptyName.isNullOrEmpty}');
  print('Safe value of nullName: ${nullName.safeValue}');
  print('Safe length of name: ${name.safeLength}');
  print('');

  int? score = 85;
  int? nullScore;

  print('Score $score value or zero: ${score.valueOrZero}');
  print('Score $nullScore value or zero: ${nullScore.valueOrZero}');
  print('Score $score is positive: ${score.isPositive}');
  print('Score $nullScore is positive: ${nullScore.isPositive}');
}