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

} 