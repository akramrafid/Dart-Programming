// Classes and Objects | Constructors | Getters and Setters | Static members | Instance variables

class Product {
  String productId;
  String productName;
  double _price;
  int _quantity;
  String category;

  Product(this.productId, this.productName, this._price, this._quantity, this.category);

  double get price => _price;
  set price(double value) {
    if (value > 0) _price = value;
  }

  int get quantity => _quantity;
  set quantity(int value) {
    if (value >= 0) _quantity = value;
  }

  double get totalValue => _price * _quantity;

  String get stockStatus {
    if (_quantity <= 0) return 'Out of Stock';
    if (_quantity < 10) return 'Low Stock';
    if (_quantity < 50) return 'Medium Stock';
    return 'High Stock';
  }

  void displayInfo() {
    print('ID: $productId | Name: $productName | Price: \$${_price.toStringAsFixed(2)} | Qty: $_quantity | Status: $stockStatus');
  }

  bool sell(int amount) {
    if (amount > 0 && amount <= _quantity) {
      _quantity -= amount;
      return true;
    }
    return false;
  }
}

class Inventory {
  String warehouseId;
  String location;
  List<Product> products = [];
  static int totalWarehouses = 0;
  static double totalValue = 0.0;

  Inventory(this.warehouseId, this.location) {
    totalWarehouses++;
  }

  void addProduct(Product product) {
    products.add(product);
    totalValue += product.totalValue;
  }

  Product? findProduct(String id) {
    for (var p in products) {
      if (p.productId == id) return p;
    }
    return null;
  }

  void displaySummary() {
    double total = 0;
    int items = 0;
    for (var p in products) {
      total += p.totalValue;
      items += p.quantity;
    }
    print('\n=== Warehouse $warehouseId ($location) ===');
    print('Products: ${products.length} | Items: $items | Value: \$${total.toStringAsFixed(2)}');
  }
}

class Order {
  String orderId;
  Map<String, int> items = {};
  double _total = 0;
  String status = 'Pending';
  static int totalOrders = 0;
  static double totalRevenue = 0.0;

  Order(this.orderId) {
    totalOrders++;
  }

  void addItem(String productId, int qty, double price) {
    items[productId] = (items[productId] ?? 0) + qty;
    _total += price * qty;
  }

  void complete() {
    if (items.isNotEmpty) {
      status = 'Completed';
      totalRevenue += _total;
    }
  }

  void display() {
    print('\nOrder: $orderId | Status: $status | Items: ${items.length} | Total: \$${_total.toStringAsFixed(2)}');
  }
}

void main() {
  print('========== INVENTORY MANAGEMENT SYSTEM ==========\n');

  // Create warehouses
  Inventory warehouse1 = Inventory('WH001', 'New York');
  Inventory warehouse2 = Inventory('WH002', 'Los Angeles');

  // Create products
  Product laptop = Product('P001', 'Dell Laptop', 899.99, 15, 'Electronics');
  Product mouse = Product('P002', 'Wireless Mouse', 29.99, 50, 'Electronics');
  Product keyboard = Product('P003', 'Mechanical Keyboard', 79.99, 30, 'Electronics');
  Product chair = Product('P004', 'Office Chair', 199.99, 10, 'Furniture');
  Product desk = Product('P005', 'Standing Desk', 399.99, 5, 'Furniture');

  // Add to warehouse 1
  warehouse1.addProduct(laptop);
  warehouse1.addProduct(mouse);
  warehouse1.addProduct(keyboard);

  // Add to warehouse 2
  warehouse2.addProduct(desk);
  warehouse2.addProduct(chair);

  // Display inventory
  warehouse1.displaySummary();
  warehouse2.displaySummary();

  // Product operations
  print('\n--- SALES ---');
  if (laptop.sell(2)) print('Sold 2 laptops');
  if (mouse.sell(10)) print('Sold 10 mice');

  // Create orders
  print('\n--- ORDERS ---');
  Order order1 = Order('ORD001');
  order1.addItem('P001', 1, laptop.price);
  order1.addItem('P002', 3, mouse.price);
  order1.complete();
  order1.display();

  Order order2 = Order('ORD002');
  order2.addItem('P004', 2, chair.price);
  order2.addItem('P005', 1, desk.price);
  order2.complete();
  order2.display();

  // Statistics
  print('\n=== STATISTICS ===');
  print('Total Warehouses: ${Inventory.totalWarehouses}');
  print('Total Inventory Value: \$${Inventory.totalValue.toStringAsFixed(2)}');
  print('Total Orders: ${Order.totalOrders}');
  print('Total Revenue: \$${Order.totalRevenue.toStringAsFixed(2)}');
}