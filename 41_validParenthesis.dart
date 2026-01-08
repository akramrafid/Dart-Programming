bool isValid(String s) {
  // Map to store bracket pairs
  final Map<String, String> brackets = {
    ')': '(',
    ']': '[',
    '}': '{',
  };

  // Stack to store opening brackets
  final List<String> stack = [];

  // Iterate through each character in the string
  for (int i = 0; i < s.length; i++) {
    String char = s[i];

    // If it's a closing bracket
    if (brackets.containsKey(char)) {
      // Check if stack is empty or top doesn't match
      if (stack.isEmpty || stack.last != brackets[char]) {
        return false;
      }
      // Pop the matching opening bracket
      stack.removeLast();
    } else {
      // It's an opening bracket, push to stack
      stack.add(char);
    }
  }

  // Valid if stack is empty (all brackets matched)
  return stack.isEmpty;
}

void main() {
  // Test Case 1
  String test1 = "()";
  print("Input: $test1");
  print("Output: ${isValid(test1)}"); // Expected: true
  print('');

  // Test Case 2
  String test2 = "()[]{}";
  print("Input: $test2");
  print("Output: ${isValid(test2)}"); // Expected: true
  print('');

  // Test Case 3
  String test3 = "(]";
  print("Input: $test3");
  print("Output: ${isValid(test3)}"); // Expected: false
  print('');

  // Test Case 4
  String test4 = "([]())";
  print("Input: $test4");
  print("Output: ${isValid(test4)}"); // Expected: true
  print('');

  // Test Case 5
  String test5 = "([)]";
  print("Input: $test5");
  print("Output: ${isValid(test5)}"); // Expected: false
  print('');  // Test Case 6
  String test6 = "{[]}";
  print("Input: $test6");
  print("Output: ${isValid(test6)}"); // Expected: true
  print('');

  // Test Case 7: Unmatched opening
  String test7 = "(";
  print("Input: $test7");
  print("Output: ${isValid(test7)}"); // Expected: false
  print('');

  // Test Case 8: Unmatched closing
  String test8 = ")";
  print("Input: $test8");
  print("Output: ${isValid(test8)}"); // Expected: false
}
