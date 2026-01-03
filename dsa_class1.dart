late String a; 

void main (){
  String ? name = null;
  int num;
  var x = 10;

  name = 'Ostad';
  num = 20;

  print ('The sum is ${num + x}');
  print ('The sum is $num + $x');

  var y = '10';
  int length = y.length;
  print(length);
  y = 'Hello';
  print(y.runtimeType);

  int length2 = y.length;
  print(length2);

  

  dynamic z = 'Ostad';
  z = '5';
  int length3 = z.length;
  print(length3);


  final list = [1,2,3];
  list.add (4);
  print (list);


  int a = 10;
  a = 20;
  print (a);


  final name1 = "Akram";
  var nameLength = name1.length;
  print (nameLength);


  for (int i = 0; i <= 5; i++){
    if (i == 3) continue;
    print (i);
  }

  //write a for loop using fo in to print numbers from 1 to 5
  for (var i in [1,2,3,4,5]){
    if (i == 3) continue;
    print (i);
  }

  Product product1 = Product (1, "Laptop", 50000);
  Product product2 = Product (2, "Mobile", 20000);
 
  print (product1);
  print (product2);

   List <int> numbers = [1,2,3,4,5];
   numbers.addAll([6,7,8]);
    print (numbers);
 
} 

class Product {
    int ? ProductId;
    String ? ProductName;
    int ? price;


    Product (this.ProductId, this.ProductName, this.price);

    @override
    String toString (){
      return 'ProductId: $ProductId, ProductName: $ProductName, Price: $price';
    }








  }