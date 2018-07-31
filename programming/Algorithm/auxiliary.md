- capture prev
- countMap, 
- indexMap: current index of character or last index of character
- indexMap: value to index map

- presum for subarray sum

- reverse map
- LeetCode 527 - Word Abbreviation
  - Word to abbreviation and/or abbreviation to word
### Use extra data to run faster
- [LeetCode 532 - K-diff Pairs in an Array](https://discuss.leetcode.com/topic/81714/java-o-n-solution-one-hashmap-easy-to-understand)

### Prefix Sum
- [Leetcode 304 - Range Sum Query 2D - Immutable](https://leetcode.com/articles/range-sum-query-2d-immutable/)
  - extra row and col to avoid check i==0
```java
private int[][] dp;
public NumMatrix(int[][] matrix) {
    if (matrix.length == 0 || matrix[0].length == 0) return;
    dp = new int[matrix.length + 1][matrix[0].length + 1];
    for (int r = 0; r < matrix.length; r++) {
        for (int c = 0; c < matrix[0].length; c++) {
            dp[r + 1][c + 1] = dp[r + 1][c] + dp[r][c + 1] + matrix[r][c] - dp[r][c];
        }
    }
}
public int sumRegion(int row1, int col1, int row2, int col2) {
    return dp[row2 + 1][col2 + 1] - dp[row1][col2 + 1] - dp[row2 + 1][col1] + dp[row1][col1];
}
```

### Subarray sum
- binary search on increasing prefix sum
### Running Prefix Sum + Prefix Sum -> count map
- [LeetCode 560 - Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/discuss/134689/Three-Approaches-With-Explanation)
```java
public int subarraySum(int[] nums, int k) {
  int count = 0, sum = 0;
  HashMap < Integer, Integer > map = new HashMap < > ();
  map.put(0, 1);//\\
  for (int i = 0; i < nums.length; i++) {
      sum += nums[i];
      if (map.containsKey(sum - k))
          count += map.get(sum - k);
      map.put(sum, map.getOrDefault(sum, 0) + 1);
  }
  return count;
}
```
- [LeetCode 523 - Continuous Subarray Sum](https://leetcode.com/problems/continuous-subarray-sum/discuss/99499/java-on-time-ok-space)
  - if the array has a continuous subarray of size at least 2 that sums up to the multiple of k, that is, sums up to n*k where n is also an integer
  - same remainder, n*k
```Java
public boolean checkSubarraySum(int[] nums, int k) {
    Map<Integer, Integer> map = new HashMap<Integer, Integer>(){{put(0,-1);}};;
    int runningSum = 0;
    for (int i=0;i<nums.length;i++) {
        runningSum += nums[i];
        if (k != 0) runningSum %= k; 
        Integer prev = map.get(runningSum);
        if (prev != null) {
            if (i - prev > 1) return true;
        }
        else map.put(runningSum, i);
    }
    return false;
}
```

### Reverse info
- Known A->B, construct B->A
- [LeetCode 683 - K Empty Slots](https://www.cnblogs.com/lightwindy/p/9727403.html)
    - [sliding window: find a match when i reaches end of current window](https://www.cnblogs.com/lightwindy/p/9727403.html)
    - [O(kn) brute force]
    - [TreeSet: lower/higher](https://blog.csdn.net/katrina95/article/details/79070941)
    - [Bucket](https://zxi.mytechroad.com/blog/simulation/leetcode-683-k-empty-slots/)
```java
public int kEmptySlots(int[] flowers, int k) {
    int[] days = new int[flowers.length];
    for (int i = 0; i < flowers.length; i++) days[flowers[i] - 1] = i + 1;
    int left = 0, right = k + 1, result = Integer.MAX_VALUE;
    for (int i = 0; right < days.length; i++) {
        if (days[i] < days[left] || days[i] <= days[right]) {
            if (i == right)
                result = Math.min(result, Math.max(days[left], days[right]));
            left = i;
            right = k + 1 + i;
        }
    }
    return (result == Integer.MAX_VALUE) ? -1 : result;
}
```

### Index Map
- [LeetCode 524 - Longest Word in Dictionary through Deleting](https://techdevguide.withgoogle.com/paths/foundational/find-longest-word-in-dictionary-that-subsequence-of-given-string/#!)
  - [index map](https://techdevguide.withgoogle.com/paths/foundational/find-longest-word-in-dictionary-that-subsequence-of-given-string/#!)
- [Max Repeat Source to Construct Target](https://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=491464)
  - index map + binary search, track lastpos in source
