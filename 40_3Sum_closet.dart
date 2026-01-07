int threeSumClosest(List<int> nums, int target) {
  // Sort the array to use two-pointer approach
  nums.sort();
  
  int closestSum = nums[0] + nums[1] + nums[2];
  int minDiff = (closestSum - target).abs();
  
  // Iterate through the array
  for (int i = 0; i < nums.length - 2; i++) {
    int left = i + 1;
    int right = nums.length - 1;
    
    // Two-pointer approach
    while (left < right) {
      int currentSum = nums[i] + nums[left] + nums[right];
      int diff = (currentSum - target).abs();
      
      // Update if this sum is closer to target
      if (diff < minDiff) {
        minDiff = diff;
        closestSum = currentSum;
      }
      
      // If we found exact match, return immediately
      if (closestSum == target) {
        return closestSum;
      }
      
      // Move pointers based on comparison
      if (currentSum < target) {
        left++;
      } else {
        right--;
      }
    }
  }
  
  return closestSum;
}

void main() {
  // Test case 1
  List<int> nums1 = [-1, 2, 1, -4];
  int target1 = 1;
  int result1 = threeSumClosest(nums1, target1);
  print('Input: nums = $nums1, target = $target1');
  print('Output: $result1');
  print('Explanation: The sum that is closest to the target is $result1.\n');
  
  // Test case 2
  List<int> nums2 = [0, 0, 0];
  int target2 = 1;
  int result2 = threeSumClosest(nums2, target2);
  print('Input: nums = $nums2, target = $target2');
  print('Output: $result2');
  print('Explanation: The sum that is closest to the target is $result2.\n');
  
  // Additional test cases
  List<int> nums3 = [1, 1, 1, 0];
  int target3 = -100;
  int result3 = threeSumClosest(nums3, target3);
  print('Input: nums = $nums3, target = $target3');
  print('Output: $result3');
  print('Explanation: The sum that is closest to the target is $result3.\n');
  
  List<int> nums4 = [-1, -1, -1, -4, 0, 1, 2];
  int target4 = 5;
  int result4 = threeSumClosest(nums4, target4);
  print('Input: nums = $nums4, target = $target4');
  print('Output: $result4');
  print('Explanation: The sum that is closest to the target is $result4.\n');
}
