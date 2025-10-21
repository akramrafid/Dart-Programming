void main () {

  //method 1 : using 'var'
  var mySet = <String>{}
  ..add("apple")
  ..add("banana")
  ..add("orange");
  print(mySet);

  //method 2 : using 'Set' keyword
  Set<int> myNumberSet = {};
  myNumberSet.add(1); 
  myNumberSet.add(2);
  myNumberSet.add(3);
  print(myNumberSet);


  //Union, Intersection and Difference
  Set<int> setA = {1, 2, 3, 4};
  Set<int> setB = {3, 4, 5, 6};
  Set<int> unionSet = setA.union(setB);
  Set<int> intersectionSet = setA.intersection(setB);
  Set<int> differenceSet = setA.difference(setB);
  print("Union: $unionSet");
  print("Intersection: $intersectionSet");
  print("Difference: $differenceSet");

  






}