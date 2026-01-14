bool isValidSudoku(List<List<String>> board) {
  Set<String> seen = {};
  
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      String cell = board[i][j];
      
      // Skip empty cells
      if (cell == '.') continue;
      
      // Create unique identifiers for row, column, and 3x3 box
      String rowKey = 'row$i$cell';
      String colKey = 'col$j$cell';
      String boxKey = 'box${i ~/ 3}${j ~/ 3}$cell';
      
      // If we've seen this digit in this row, column, or box, it's invalid
      if (seen.contains(rowKey) || seen.contains(colKey) || seen.contains(boxKey)) {
        return false;
      }
      
      seen.add(rowKey);
      seen.add(colKey);
      seen.add(boxKey);
    }
  }
  
  return true;
}

void main() {
  // Example 1: Valid Sudoku
  List<List<String>> board1 = [
    ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]
  ];
  
  bool result1 = isValidSudoku(board1);
  print('Example 1: ${result1 ? "VALID ✓" : "INVALID ✗"}');
  print('Expected: true');
  print('');
  
  // Example 2: Invalid Sudoku (two 8's in top-left 3x3 box)
  List<List<String>> board2 = [
    ["8", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]
  ];
  
  bool result2 = isValidSudoku(board2);
  print('Example 2: ${result2 ? "VALID ✓" : "INVALID ✗"}');
  print('Expected: false');
  print('');
  
  // Edge Case 1: Duplicate in row
  List<List<String>> board3 = [
    ["1", "2", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "1"]  // Duplicate 1 in row
  ];
  
  bool result3 = isValidSudoku(board3);
  print('Edge Case 1 (duplicate in column): ${result3 ? "VALID ✓" : "INVALID ✗"}');
  print('Expected: false');
  print('');
  
  // Edge Case 2: All empty board (valid)
  List<List<String>> board4 = List.generate(9, (_) => List.filled(9, '.'));
  
  bool result4 = isValidSudoku(board4);
  print('Edge Case 2 (empty board): ${result4 ? "VALID ✓" : "INVALID ✗"}');
  print('Expected: true');
  print('');
  
  // Edge Case 3: Duplicate in 3x3 box
  List<List<String>> board5 = [
    ["1", "2", "3", ".", ".", ".", ".", ".", "."],
    ["4", "5", "6", ".", ".", ".", ".", ".", "."],
    ["7", "8", "1", ".", ".", ".", ".", ".", "."],  // 1 appears twice in box
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", ".", ".", ".", "."]
  ];
  
  bool result5 = isValidSudoku(board5);
  print('Edge Case 3 (duplicate in 3x3 box): ${result5 ? "VALID ✓" : "INVALID ✗"}');
  print('Expected: false');
}
