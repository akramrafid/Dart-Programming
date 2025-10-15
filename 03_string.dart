void main() {
  print("Basic String Operations in Dart");
  String greeting = "Hello";
  String name = "Akram";
  print ("\nString interpolation Example: $greeting, $name!");

  ///multiiline string
  String multiLineString = '''
  This is a multi-line string.
  It can span multiple lines. 
  Useful for long texts or formatted strings. 
  ''';

  print("\nMulti-line String Example:");
  print(multiLineString);



  String rawString = r'This is a raw string. \n will not be interpreted as a newline.';
  print("\nRaw String Example: $rawString");

  String escapedString = "He said, \"Dart is awesome!\"";
  print("\nEscaped String Example: $escapedString");

  String notrawString = 'This is not a raw string. \n will be interpreted as a newline.';
  print("\nNot Raw String Example: $notrawString");



  //String case conversions

  String name1 = "Akram";
  print("\nUppercase: ${name1.toUpperCase()}");
  print("Lowercase: ${name1.toLowerCase()}");
  print("Trimmed: ${"   Akram   ".trim()}");
  print("Trimmed Left: ${"   Akram   ".trimLeft()}");
  print("Trimmed Right: ${"   Akram   ".trimRight()}");
  print("Length: ${name1.length}");
  print("Contains 'k': ${name1.contains('k')}");
  print("Starts with 'A': ${name1.startsWith('A')}");
  print("Ends with 'm': ${name1.endsWith('m')}");
  print("Index of 'r': ${name1.indexOf('r')}");
  print("Substring (1,4): ${name1.substring(1,4)}");

  List<String> parts = name1.split('r');
  print("Split by 'r': $parts");

  //String joining
  List<String> words = ["Dart", "is", "fun"];
  String sentence = words.join(' ');
  print("Joined String: $sentence");
  

  //String replacement
  String original = "Dart is fun";
  String replaced = original.replaceAll("fun", "awesome");
  print("String Replacement: $replaced");

  //String comparison
  String str1 = "Dart";
  String str2 = "dart";
  print("String Comparison (case-sensitive): ${str1 == str2}");
  print("String Comparison (case-insensitive): ${str1.toLowerCase() == str2.toLowerCase()}");
  print("CompareTo: ${str1.compareTo(str2)}"); // 0 if equal, <0 if str1 < str2, >0 if str1 > str2

  //intoString conversion
  int number = 42;
  String numberString = number.toString();
  print("Integer to String: $numberString");
  double pi = 3.14159;
  String piString = pi.toStringAsFixed(2); // 2 decimal places
  print("Double to String with 2 decimal places: $piString");
  bool isTrue = true;
  String boolString = isTrue.toString();
  print("Boolean to String: $boolString");
  



}