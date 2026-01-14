int strStr(String haystack, String needle) {
  if (needle.isEmpty) return 0;
  if (haystack.length < needle.length) return -1;

  // Simple approach: check each position
  for (int i = 0; i <= haystack.length - needle.length; i++) {
    if (haystack.substring(i, i + needle.length) == needle) {
      return i;
    }
  }
  
  return -1;
}

int strStrKMP(String haystack, String needle) {
  if (needle.isEmpty) return 0;
  if (haystack.length < needle.length) return -1;

  // Build LPS (Longest Proper Prefix which is also Suffix) array
  List<int> lps = buildLPS(needle);
  
  int i = 0; // pointer for haystack
  int j = 0; // pointer for needle
  
  while (i < haystack.length) {
    if (haystack[i] == needle[j]) {
      i++;
      j++;
    }
    
    if (j == needle.length) {
      return i - j; // Found at index i - j
    } else if (i < haystack.length && haystack[i] != needle[j]) {
      if (j != 0) {
        j = lps[j - 1];
      } else {
        i++;
      }
    }
  }
  
  return -1;
}

/// Builds the LPS (Longest Proper Prefix which is also Suffix) array
List<int> buildLPS(String needle) {
  List<int> lps = List.filled(needle.length, 0);
  int len = 0;
  int i = 1;
  
  while (i < needle.length) {
    if (needle[i] == needle[len]) {
      len++;
      lps[i] = len;
      i++;
    } else {
      if (len != 0) {
        len = lps[len - 1];
      } else {
        lps[i] = 0;
        i++;
      }
    }
  }
  
  return lps;
}

/// Using Dart's built-in indexOf method (simplest)
int strStrBuiltIn(String haystack, String needle) {
  return haystack.indexOf(needle);
}

void main() {
  // Test Case 1
  print("Test Case 1:");
  String haystack1 = "sadbutsad";
  String needle1 = "sad";
  print("haystack: '$haystack1', needle: '$needle1'");
  print("Simple approach: ${strStr(haystack1, needle1)}"); // Expected: 0
  print("KMP approach: ${strStrKMP(haystack1, needle1)}"); // Expected: 0
  print("Built-in: ${strStrBuiltIn(haystack1, needle1)}"); // Expected: 0
  print("");

  // Test Case 2
  print("Test Case 2:");
  String haystack2 = "leetcode";
  String needle2 = "leeto";
  print("haystack: '$haystack2', needle: '$needle2'");
  print("Simple approach: ${strStr(haystack2, needle2)}"); // Expected: -1
  print("KMP approach: ${strStrKMP(haystack2, needle2)}"); // Expected: -1
  print("Built-in: ${strStrBuiltIn(haystack2, needle2)}"); // Expected: -1
  print("");

  // Test Case 3: Needle is empty
  print("Test Case 3:");
  String haystack3 = "hello";
  String needle3 = "";
  print("haystack: '$haystack3', needle: '$needle3'");
  print("Simple approach: ${strStr(haystack3, needle3)}"); // Expected: 0
  print("KMP approach: ${strStrKMP(haystack3, needle3)}"); // Expected: 0
  print("Built-in: ${strStrBuiltIn(haystack3, needle3)}"); // Expected: 0
  print("");

  // Test Case 4: Needle at the end
  print("Test Case 4:");
  String haystack4 = "mississippi";
  String needle4 = "issip";
  print("haystack: '$haystack4', needle: '$needle4'");
  print("Simple approach: ${strStr(haystack4, needle4)}"); // Expected: 4
  print("KMP approach: ${strStrKMP(haystack4, needle4)}"); // Expected: 4
  print("Built-in: ${strStrBuiltIn(haystack4, needle4)}"); // Expected: 4
  print("");

  // Test Case 5: Needle equals haystack
  print("Test Case 5:");
  String haystack5 = "abc";
  String needle5 = "abc";
  print("haystack: '$haystack5', needle: '$needle5'");
  print("Simple approach: ${strStr(haystack5, needle5)}"); // Expected: 0
  print("KMP approach: ${strStrKMP(haystack5, needle5)}"); // Expected: 0
  print("Built-in: ${strStrBuiltIn(haystack5, needle5)}"); // Expected: 0
}
