int removeElement(List<int> nums, int val) {
  int left = 0;
  
  for (int right = 0; right < nums.length; right++) {
    if (nums[right] != val) {
      nums[left] = nums[right];
      left++;
    }
  }
  
  return left;
}

void main() {
  // Example 1
  List<int> nums1 = [3, 2, 2, 3];
  int val1 = 3;
  int k1 = removeElement(nums1, val1);
  
  print('Example 1:');
  print('Input: nums = $nums1, val = $val1');
  print('Output: k = $k1, nums = ${nums1.sublist(0, k1).toList()}...');
  print('Expected: k = 2, nums = [2, 2]...');
  print('');
  
  // Example 2
  List<int> nums2 = [0, 1, 2, 2, 3, 0, 4, 2];
  int val2 = 2;
  int k2 = removeElement(nums2, val2);
  
  print('Example 2:');
  print('Input: nums = $nums2, val = $val2');
  print('Output: k = $k2');
  
  // Sort first k elements to verify
  List<int> firstK = nums2.sublist(0, k2);
  firstK.sort();
  print('First k elements (sorted): $firstK');
  print('Expected: [0, 0, 1, 3, 4]');
  print('');
  
  // Test edge cases
  print('Edge Cases:');
  
  // Empty array
  List<int> nums3 = [];
  int k3 = removeElement(nums3, 5);
  print('Empty array: k = $k3 (expected: 0)');
  
  // All elements equal to val
  List<int> nums4 = [1, 1, 1, 1];
  int k4 = removeElement(nums4, 1);
  print('All elements equal to val: k = $k4 (expected: 0)');
  
  // No elements equal to val
  List<int> nums5 = [1, 2, 3, 4];
  int k5 = removeElement(nums5, 5);
  print('No elements equal to val: k = $k5 (expected: 4)');
  
  // Single element not equal to val
  List<int> nums6 = [1];
  int k6 = removeElement(nums6, 2);
  print('Single element not equal to val: k = $k6 (expected: 1)');
  
  // Single element equal to val
  List<int> nums7 = [1];
  int k7 = removeElement(nums7, 1);
  print('Single element equal to val: k = $k7 (expected: 0)');
}
