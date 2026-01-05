int myAtoi(String s) {
  // Define the 32-bit signed integer range
  const int INT_MAX = 2147483647;  // 2^31 - 1
  const int INT_MIN = -2147483648; // -2^31

  int i = 0;
  int sign = 1;
  int result = 0;

  // Step 1: Skip leading whitespace
  while (i < s.length && s[i] == ' ') {
    i++;
  }

  // If we've reached the end of the string, return 0
  if (i >= s.length) {
    return 0;
  }

  // Step 2: Check for sign
  if (s[i] == '-' || s[i] == '+') {
    sign = (s[i] == '-') ? -1 : 1;
    i++;
  }

  // Step 3: Read the integer, skipping leading zeros until a non-digit is encountered
  while (i < s.length && s[i].codeUnitAt(0) >= 48 && s[i].codeUnitAt(0) <= 57) {
    // s[i] is a digit (ASCII 48-57 for '0'-'9')
    int digit = int.parse(s[i]);

    // Check for overflow before multiplying by 10
    if (result > INT_MAX ~/ 10 ||
        (result == INT_MAX ~/ 10 && digit > 7)) {
      return sign == 1 ? INT_MAX : INT_MIN;
    }

    result = result * 10 + digit;
    i++;
  }

  // Step 4: Apply the sign and return
  result = result * sign;

  // Step 5: Clamp the result to the 32-bit signed integer range
  if (result < INT_MIN) {
    return INT_MIN;
  }
  if (result > INT_MAX) {
    return INT_MAX;
  }

  return result;
}

void main() {
  // Test cases
  print("Test 1: '42' => ${myAtoi('42')}");
  expect(myAtoi("42"), 42);

  print("Test 2: ' -042' => ${myAtoi(' -042')}");
  expect(myAtoi(" -042"), -42);

  print("Test 3: '1337c0d3' => ${myAtoi('1337c0d3')}");
  expect(myAtoi("1337c0d3"), 1337);

  print("Test 4: '0-1' => ${myAtoi('0-1')}");
  expect(myAtoi("0-1"), 0);

  print("Test 5: 'words and 987' => ${myAtoi('words and 987')}");
  expect(myAtoi("words and 987"), 0);

  print("Test 6: '-2147483649' => ${myAtoi('-2147483649')}");
  expect(myAtoi("-2147483649"), -2147483648);

  print("Test 7: '2147483648' => ${myAtoi('2147483648')}");
  expect(myAtoi("2147483648"), 2147483647);

  print("\nAll tests passed!");
}

void expect(int actual, int expected) {
  if (actual != expected) {
    throw "Expected $expected, but got $actual";
  }
}
