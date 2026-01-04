bool isMatch(String s, String p) {
  int m = s.length;
  int n = p.length;
  
  // dp[i][j] represents whether first i characters of s
  // match first j characters of p
  List<List<bool>> dp = List.generate(m + 1, (_) => List.filled(n + 1, false));
  
  // Base case: empty string matches empty pattern
  dp[0][0] = true;
  
  // Handle patterns like a*, a*b*, a*b*c* which can match empty string
  for (int j = 1; j <= n; j++) {
    if (p[j - 1] == '*') {
      dp[0][j] = dp[0][j - 2]; // '*' can match zero of preceding element
    }
  }
  
  // Fill the DP table
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (p[j - 1] == '*') {
        // Two cases when we have '*':
        // 1. Match zero of preceding element: dp[i][j-2]
        // 2. Match one or more of preceding element:
        //    - Current char of s matches preceding char of p: dp[i-1][j]
        dp[i][j] = dp[i][j - 2]; // Case 1: zero matches
        
        if (p[j - 2] == '.' || p[j - 2] == s[i - 1]) {
          // Case 2: one or more matches
          dp[i][j] = dp[i][j] || dp[i - 1][j];
        }
      } else if (p[j - 1] == '.' || p[j - 1] == s[i - 1]) {
        // Current characters match (or pattern has '.')
        dp[i][j] = dp[i - 1][j - 1];
      }
    }
  }
  
  return dp[m][n];
}

/// Alternative solution using Backtracking with Memoization
/// Time Complexity: O(m * n)
/// Space Complexity: O(m * n) for memoization cache
bool isMatchMemo(String s, String p) {
  final Map<String, bool> memo = {};
  
  bool helper(int sIdx, int pIdx) {
    String key = '$sIdx-$pIdx';
    
    // Check memoization
    if (memo.containsKey(key)) {
      return memo[key]!;
    }
    
    // Base cases
    if (pIdx == p.length) {
      return sIdx == s.length;
    }
    
    // Check if current characters match
    bool firstMatch = (sIdx < s.length) && 
                      (p[pIdx] == '.' || p[pIdx] == s[sIdx]);
    
    // Check for '*' pattern
    if (pIdx + 1 < p.length && p[pIdx + 1] == '*') {
      // Two cases:
      // 1. Skip this pattern (zero matches): pIdx + 2
      // 2. Use this pattern (one or more matches): sIdx + 1, pIdx
      bool result = helper(sIdx, pIdx + 2) || 
                    (firstMatch && helper(sIdx + 1, pIdx));
      memo[key] = result;
      return result;
    } else {
      // No '*', must match current character
      bool result = firstMatch && helper(sIdx + 1, pIdx + 1);
      memo[key] = result;
      return result;
    }
  }
  
  return helper(0, 0);
}

void main() {
  // Test Case 1
  print('Test 1: s = "aa", p = "a"');
  print('Expected: false');
  print('Got: ${isMatch("aa", "a")}');
  print('---');
  
  // Test Case 2
  print('Test 2: s = "aa", p = "a*"');
  print('Expected: true');
  print('Got: ${isMatch("aa", "a*")}');
  print('---');
  
  // Test Case 3
  print('Test 3: s = "ab", p = ".*"');
  print('Expected: true');
  print('Got: ${isMatch("ab", ".*")}');
  print('---');
  
  // Test Case 4
  print('Test 4: s = "aab", p = "c*a*b"');
  print('Expected: true');
  print('Got: ${isMatch("aab", "c*a*b")}');
  print('---');
  
  // Test Case 5
  print('Test 5: s = "mississippi", p = "mis*is*p*."');
  print('Expected: false');
  print('Got: ${isMatch("mississippi", "mis*is*p*.")}');
  print('---');
  
  // Test Case 6
  print('Test 6: s = "aaa", p = "ab*a*c*a"');
  print('Expected: true');
  print('Got: ${isMatch("aaa", "ab*a*c*a")}');
  print('---');
  
  // Test Case 7 - Testing with '.'
  print('Test 7: s = "abc", p = "a.c"');
  print('Expected: true');
  print('Got: ${isMatch("abc", "a.c")}');
  print('---');
  
  // Test Case 8 - Complex pattern
  print('Test 8: s = "aa", p = "a"');
  print('Expected: false');
  print('Got: ${isMatch("aa", "a")}');
  print('---');
  
  // Verify both implementations match
  print('\nVerifying both implementations produce same results:');
  List<List<String>> testCases = [
    ["aa", "a"],
    ["aa", "a*"],
    ["ab", ".*"],
    ["aab", "c*a*b"],
    ["mississippi", "mis*is*p*."],
    ["aaa", "ab*a*c*a"],
    ["abc", "a.c"],
  ];
  
  for (final testCase in testCases) {
    bool result1 = isMatch(testCase[0], testCase[1]);
    bool result2 = isMatchMemo(testCase[0], testCase[1]);
    String status = result1 == result2 ? "✓" : "✗";
    print('$status s="${testCase[0]}", p="${testCase[1]}": DP=$result1, Memo=$result2');
  }
}
