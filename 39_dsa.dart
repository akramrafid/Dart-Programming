// Problem: Remove Duplicates from Sorted Array
// Two-pointer approach to remove duplicates in-place

void main() {
  // Example 1
  List<int> nums1 = [1, 1, 2];
  int k1 = removeDuplicates(nums1);
  print('Example 1:');
  print('k = $k1');
  print('nums = ${nums1.sublist(0, k1)}');
  print('');

  // Example 2
  List<int> nums2 = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];
  int k2 = removeDuplicates(nums2);
  print('Example 2:');
  print('k = $k2');
  print('nums = ${nums2.sublist(0, k2)}');
  print('');

  // Additional test case
  List<int> nums3 = [1];
  int k3 = removeDuplicates(nums3);
  print('Example 3 (single element):');
  print('k = $k3');
  print('nums = ${nums3.sublist(0, k3)}');
}


int removeDuplicates(List<int> nums) {
  if (nums.isEmpty) {
    return 0;
  }

  int insertPos = 1; // Position where next unique element should be inserted
  
  // Start from the second element
  for (int i = 1; i < nums.length; i++) {
    // If current element is different from previous element
    if (nums[i] != nums[i - 1]) {
      nums[insertPos] = nums[i];
      insertPos++;
    }
  }

  return insertPos;
}
