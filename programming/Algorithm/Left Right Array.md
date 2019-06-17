### Left and right array (DP)

#### When to use
- Current element is depended on previous and next elements
<!-- 从两边各扫描一次得到我们需要维护的变量，通常适用于当前元素需要两边元素来决定的问题 -->

#### Implementation
- min/max value(or index) of left and right
- min/max subarray of left and right
- next greater/lesser of left and right
- usually can use just one array

#### Examples - Simple
- [LeetCode 926 - Flip String to Monotone Increasing]
- [LeetCode 238 - Product of Array Except Self](http://shibaili.blogspot.com/2015/08/day-119-239-sliding-window-maximum.html)
- [LeetCode 845 - Longest Mountain in Array](https://leetcode.com/problems/longest-mountain-in-array/discuss/135593/C%2B%2BJavaPython-1-pass-and-O(1)-space)
  - [up + down array](https://leetcode.com/problems/longest-mountain-in-array/discuss/135593/C%2B%2BJavaPython-1-pass-and-O(1)-space)
  - [two pointers](https://leetcode.com/articles/longest-mountain-in-array/)

#### Examples
- [LeetCode 135 - Candy: Children with a higher rating get more candies than their neighbors](https://leetcode.com/articles/candy/)
  - [scan twice, forward then backward]
  - [left2right + right2left or just one array](https://leetcode.com/articles/candy/#approach-4-single-pass-approach-with-constant-space-accepted)
  - [local min/max + ](https://leetcode.com/articles/candy/#approach-4-single-pass-approach-with-constant-space-accepted)
- [Longest Bitonic Subsequence](https://www.geeksforgeeks.org/longest-bitonic-subsequence-dp-15/)
  - [max = lis[i] + lds[i] - 1;](https://www.geeksforgeeks.org/longest-bitonic-subsequence-dp-15/)
  - [nlogn](https://www.geeksforgeeks.org/longest-bitonic-subsequence-onlogn/)

- [LeetCode 42 - Trapping Rain Water](http://wxx5433.github.io/trapping-rain-water.html)
  - [two pointers](http://wxx5433.github.io/trapping-rain-water.html)
  - [maxLeft, maxRight](https://www.geeksforgeeks.org/trapping-rain-water/)
- [LeetCode 84 - Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28900/O(n)-stack-based-JAVA-solution)
  - [increasing stack](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28900/O(n)-stack-based-JAVA-solution)
  - [lessFromLeft/lessFromRight: idx of the first bar the left/right that is lower than current](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28902/5ms-O(n)-Java-solution-explained-(beats-96))
  - [Divide and conquer - O(nlogn): max(maxLeftOnly, maxRightOnly, maxCombineArea](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28910/Simple-Divide-and-Conquer-AC-solution-without-Segment-Tree/198911/)
```Java
public static int largestRectangleArea(int[] height) {
    int[] lessFromLeft = new int[height.length]; // idx of the first bar the left that is lower than current
    int[] lessFromRight = new int[height.length]; // idx of the first bar the right that is lower than current
    lessFromRight[height.length - 1] = height.length;
    lessFromLeft[0] = -1;
    for (int i = 1; i < height.length; i++) {
        int p = i - 1;
        while (p >= 0 && height[p] >= height[i]) {
            p = lessFromLeft[p];
        }
        lessFromLeft[i] = p;
    }
    for (int i = height.length - 2; i >= 0; i--) {
        int p = i + 1;
        while (p < height.length && height[p] >= height[i]) {
            p = lessFromRight[p];
        }
        lessFromRight[i] = p;
    }
    int maxArea = 0;
    for (int i = 0; i < height.length; i++) {
        maxArea = Math.max(maxArea, height[i] * (lessFromRight[i] - lessFromLeft[i] - 1));
    }
    return maxArea;
}
```

- [LintCode 42 - Maximum Subarray II](https://www.kancloud.cn/kancloud/data-structure-and-algorithm-notes/73087)
  - Find two non-overlapping subarrays which have the largest sum.
  - res = Math.max(res, left[i] + right[i+1]);

- [LintCode 45 - Maximum Subarray Difference](http://blog.csdn.net/gqk289/article/details/68958119)
  - Find two non-overlapping subarrays A and B, which |SUM(A) - SUM(B)| is the largest.
<!-- 两次遍历，从左到右和从右到左。用两个数组leftMin[i], LeftMax[i]保存左侧到当前位置i的最大子数组和最小子数组的值，再从右往左遍历找到右侧当前位置的最大子数组和最小子数组的值。 -->

- [LeetCode 828 - Unique Letter String](https://leetcode.com/problems/unique-letter-string/discuss/172041/Very-simple-O(N)-with-Prev-and-Next)
  - [prevIndex, nextIndex for same element:  ans += (i - left[i]) * (right[i] - i);](https://leetcode.com/problems/unique-letter-string/discuss/172041/Very-simple-O(N)-with-Prev-and-Next)
  - [Split by Character](https://leetcode.com/articles/unique-letter-string/)
  <!-- 换个角度，求每个字符的有效substring个数 -->
  - [dp: dp[i] = dp[i-1] + (i-f) - (f-s), first/secondIndex[]](https://leetcode.com/problems/unique-letter-string/discuss/158378/Concise-DP-O(n)-solution)

- [LeetCode 239 - Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/discuss/65884/java-on-solution-using-deque-with-explanation)
  - [Monotonic Queue](https://leetcode.com/problems/sliding-window-maximum/discuss/65884/java-on-solution-using-deque-with-explanation)
  - [max_left + max_right in the block](https://leetcode.com/problems/sliding-window-maximum/discuss/65881/O(n)-solution-in-Java-with-two-simple-pass-in-the-array)
```java
public static int[] slidingWindowMax(final int[] in, final int w) {
   final int[] max_left = new int[in.length];
   final int[] max_right = new int[in.length];

   max_left[0] = in[0];
   max_right[in.length - 1] = in[in.length - 1];

   for (int i = 1; i < in.length; i++) {
       max_left[i] = (i % w == 0) ? in[i] : Math.max(max_left[i - 1], in[i]);

       final int j = in.length - i - 1;
       max_right[j] = (j % w == 0) ? in[j] : Math.max(max_right[j + 1], in[j]);
   }

   final int[] sliding_max = new int[in.length - w + 1];
   for (int i = 0, j = 0; i + w <= in.length; i++) {
       sliding_max[j++] = Math.max(max_right[i], max_left[i + w - 1]);
   }
   return sliding_max;
}
```

#### Hard
- [LeetCode 689 - Maximum Sum of 3 Non-Overlapping Subarrays](https://leetcode.com/problems/maximum-sum-of-3-non-overlapping-subarrays/discuss/108231/C%2B%2BJava-DP-with-explanation-O(n))
  - posLeft/Right for starting index of the left/right max sum interval
  - [dp](https://www.hrwhisper.me/leetcode-contest-52-solution/)
  - [follow up:](https://github.com/YaokaiYang-assaultmaster/LeetCode/blob/master/GeneralizedMethod/Maximum%20Sum%20of%20n%20Non-Overlapping%20Subarrays.md)
```java
public int[] maxSumOfThreeSubarrays(int[] nums, int k) {
    int n = nums.length, maxsum = 0;
    int[] sum = new int[n+1], posLeft = new int[n], posRight = new int[n], ans = new int[3];
    for (int i = 0; i < n; i++) sum[i+1] = sum[i]+nums[i];
    // DP for starting index of the left max sum interval
    for (int i = k, tot = sum[k]-sum[0]; i < n; i++) {
        if (sum[i+1]-sum[i+1-k] > tot) {
            posLeft[i] = i+1-k;
            tot = sum[i+1]-sum[i+1-k];
        }
        else
            posLeft[i] = posLeft[i-1];
    }
    // DP for starting index of the right max sum interval
   // caution: the condition is ">= tot" for right interval, and "> tot" for left interval
    posRight[n-k] = n-k;
    for (int i = n-k-1, tot = sum[n]-sum[n-k]; i >= 0; i--) {
        if (sum[i+k]-sum[i] >= tot) {
            posRight[i] = i;
            tot = sum[i+k]-sum[i];
        }
        else
            posRight[i] = posRight[i+1];
    }
    // test all possible middle interval
    for (int i = k; i <= n-2*k; i++) {
        int l = posLeft[i-1], r = posRight[i+k];
        int tot = (sum[i+k]-sum[i]) + (sum[l+k]-sum[l]) + (sum[r+k]-sum[r]);
        if (tot > maxsum) {
            maxsum = tot;
            ans[0] = l; ans[1] = i; ans[2] = r;
        }
    }
    return ans;
}

public int[] maxSumOfThreeSubarrays(int[] nums, int k, int n) {
    int[][] dp = new int[n + 1][nums.length + 1];
    int[][] index = new int[n + 1][nums.length + 1];
    int tot = 0;
    // prefix sum
    int[] sum = new int[nums.length + 1];
    for (int i = 0; i < nums.length; i++) {
        sum[i + 1] = nums[i] + sum[i];
    }
    
    for (int i = 1; i <= n; i++) {
        for (int j = k - 1; j < nums.length; j++) {
            int tmpMax = sum[j + 1] - sum[j - k + 1] + dp[i - 1][j - k + 1];
            if (tmpMax > dp[i][j]) {
                dp[i][j + 1] = tmpMax;
                index[i][j + 1] = j - k + 1;
            } else {
                dp[i][j + 1] = dp[i][j];
                index[i][j + 1] = index[i][j];
            }
        }
    }
    
    int[] ret = new int[n];
    int prev = nums.length;
    for (int i = n; i > 0; i--) {
        ret[i - 1] = index[i][prev];
        prev = ret[i - 1];
    }
    
    return ret;
}
```
- [HARD LeetCode 962 - Maximum Width Ramp](https://www.acwing.com/solution/LeetCode/content/672/)
  - [pre-sort with element index](https://leetcode.com/articles/maximum-width-ramp/)
  - [TreeMap](https://leetcode.com/problems/maximum-width-ramp/discuss/209060/TreeMap-O(nlogn)-8-lines-of-Java)
  - [monotonic stack stores candidates then scan original data from end](https://www.acwing.com/solution/LeetCode/content/672/)
  - [minL + maxR and then two pointers](https://www.acwing.com/solution/LeetCode/content/672/)
```java
public int maxWidthRamp(int[] A) {
    int n = A.length;
    int i, j , max = 0;
    int[] maxR = new int[n], minL = new int[n];
    minL[0] = A[0];
    for (i = 1; i < n; i++){
        minL[i] = Math.min(A[i], minL[i - 1]);
    }
    maxR[n - 1] = A[n - 1];
    for (j = n - 2; j >= 0; j--){
        maxR[j] = Math.max(A[j], maxR[j + 1]);
    }
    i = 0; j = 0;
    while (i < n && j < n){
        if (minL[i] <= maxR[j]){
            max = Math.max(max, j - i);
            j++;
        }else{
            i++;
        }
    }
    return max;
}
// You don't need to calculate minL, only maxR should work!
public int maxWidthRamp(int[] A) {
    if(A.length == 0){
        return 0;
    }
    int[] maxR = new int[A.length];
    maxR[A.length-1] = A[A.length-1];
    for(int i=A.length-2;i>=0;i--){
        maxR[i] = Math.max(A[i], maxR[i+1]);
    }
    
    int i=0;
    int j=0;
    int res = 0;
    while(i<A.length && j<A.length){
        if(A[i]<=maxR[j]){
             res = Math.max(res, j-i);
             j++;
        }else{
            i++;
        }
    }
    
    return res;
}
```

- [LeetCode 768 - Max Chunks To Make Sorted II](http://www.cnblogs.com/grandyang/p/8850299.html)
  - [maxOfLeft, minOfRight](https://leetcode.com/problems/max-chunks-to-make-sorted-ii/discuss/113462/Java-solution-left-max-and-right-min.)
  - [Monotonic Stack](http://www.cnblogs.com/grandyang/p/8850299.html)
```java
public int maxChunksToSorted(int[] arr) {
    int n = arr.length;
    int[] maxOfLeft = new int[n];
    int[] minOfRight = new int[n];
    maxOfLeft[0] = arr[0];
    for (int i = 1; i < n; i++) {
        maxOfLeft[i] = Math.max(maxOfLeft[i-1], arr[i]);
    }
    minOfRight[n - 1] = arr[n - 1];
    for (int i = n - 2; i >= 0; i--) {
        minOfRight[i] = Math.min(minOfRight[i + 1], arr[i]);
    }
    int res = 0;
    for (int i = 0; i < n - 1; i++) {
        if (maxOfLeft[i] <= minOfRight[i + 1]) res++;
    }
    return res + 1;
}
```