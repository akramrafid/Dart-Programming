double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  List<int> merged = [];
  int i = 0, j = 0;

  // Merge the two sorted arrays
  while (i < nums1.length && j < nums2.length) {
    if (nums1[i] < nums2[j]) {
      merged.add(nums1[i]);
      i++;
    } else {
      merged.add(nums2[j]);
      j++;
    }
  }

  // Add remaining elements from nums1
  while (i < nums1.length) {
    merged.add(nums1[i]);
    i++;
  }

  // Add remaining elements from nums2
  while (j < nums2.length) {
    merged.add(nums2[j]);
    j++;
  }

  // Calculate median
  int totalLength = merged.length;
  if (totalLength % 2 == 1) {
    return merged[totalLength ~/ 2].toDouble();
  } else {
    int mid1 = totalLength ~/ 2;
    int mid2 = mid1 - 1;
    return (merged[mid1] + merged[mid2]) / 2.0;
  }
}

void main() {
  List<int> nums1 = [1, 3];
  List<int> nums2 = [2];
  print(findMedianSortedArrays(nums1, nums2)); // Output: 2.0

  nums1 = [1, 2];
  nums2 = [3, 4];
  print(findMedianSortedArrays(nums1, nums2)); // Output: 2.5
}
