#### Applications of Bisection
<!-- - 值具有单调性 -->
- O(n) optimize to logn, o(n^2) to O(nlog$the_range)
- Know the search Space: range(min, max), index
- calculation error(tolerance) should be less than
- Suppose we know the value, we can easily determine whether the value is true/possible
  - With O(n) time
  - Use greedy to to check, time complexity: O(n) or less
  - Sliding window
  - Two Pointers
- isPossible(\*, int curValue)
- minimum is maximized <!-- (最大化最小值) -->

#### Detail
- error (tolerance) as part of the API

##### [Search space](https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/discuss/85173/Share-my-thoughts-and-Clean-Java-Code)
- range: smallest to largest
- index

##### **validate the answer is right**
- [LintCode 183 - Wood Cut](https://yeqiuquan.blogspot.com/2017/03/lintcode-183-wood-cut.html)
```java
public int woodCut(int[] L, int k) {
  int lo = 1;
  int hi = 0;
  for (int i = 0; i < L.length; i++) {
    hi = Math.max(hi, L[i]);
  }
  while (lo < hi) {
    int mid = lo + (hi - lo + 1) / 2;
    int pieces = getPieces(mid, L);
    if (pieces < k) {
      hi = mid - 1;
    } else {
      lo = mid;
    }
  }
  if (getPieces(lo, L) >= k) {
    return lo;
  } else {
    return 0;
  }
}
private int getPieces(int len, int[] L) {
  int ans = 0;
  for (int l : L) {
    ans += l / len;
  }
  return ans;
}
```

#### Find kth in sorted matrix
- [LeetCode 378 - Kth Smallest Element in a Sorted Matrix](https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/discuss/85173/Share-my-thoughts-and-Clean-Java-Code)
  - [bisection: O(nlog(max-min)): k:[0-n^2]](https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/discuss/85177/Java-1ms-nlog(max-min)-solution)
  - [PriorityQueue: O(klogk)](https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/discuss/85301/java-priorityqueue-solution)
- [LeetCode - 719 Find K-th Smallest Pair Distance](https://leetcode.com/articles/find-k-th-smallest-pair-distance/)
  - [PriorityQueue: O(nlogn+klogn)](https://leetcode.com/articles/find-k-th-smallest-pair-distance/)
  - [bisection + sliding window](https://leetcode.com/articles/find-k-th-smallest-pair-distance/)
```java
public int smallestDistancePair(int[] nums, int k) {
    Arrays.sort(nums);

    int lo = 0;
    int hi = nums[nums.length - 1] - nums[0];
    while (lo < hi) {
        int mi = (lo + hi) / 2;
        int count = 0, left = 0;
        for (int right = 0; right < nums.length; ++right) {
            while (nums[right] - nums[left] > mi) left++;
            count += right - left;
        }
        //count = number of pairs with distance <= mi
        if (count >= k) hi = mi;
        else lo = mi + 1;
    }
    return lo;
}
```
- [LeetCode 786 - K-th Smallest Prime Fraction](https://leetcode.com/problems/k-th-smallest-prime-fraction/discuss/115819/Summary-of-solutions-for-problems-%22reducible%22-to-LeetCode-378)
  - A = [1, 2, 3, 5], K = 3: The fractions to be considered in sorted order are: 1/5, 1/3, 2/5, 1/2, 3/5, 2/3. The third fraction is 2/5.
  - store p, q during bisection
  - [PriorityQueue: O(klogk)](https://leetcode.com/problems/k-th-smallest-prime-fraction/discuss/116107/Java-Better-than-O(NlogN)-it-can-be-O(KlogK))
```java
public int[] kthSmallestPrimeFraction(int[] A, int K) {
    double l = 0, r = 1;
    int p = 0, q = 1;
    for (int n = A.length, cnt = 0; true; cnt = 0, p = 0) {
        double m = (l + r) / 2;
        for (int i = 0, j = n - 1; i < n; i++) {
            while (j >= 0 && A[i] > m * A[n - 1 - j]) j--;
            cnt += (j + 1);

            if (j >= 0 && p * A[n - 1 - j] < q * A[i]) {
                p = A[i];
                q = A[n - 1 - j];
            }
        }
        if (cnt < K) {
            l = m;
        } else if (cnt > K) {
            r = m;
        } else {
            return new int[] {p, q};
        }
    }
}
```
- [LeetCode 668 - Kth Smallest Number in Multiplication Table: O(m∗log(m∗n))](https://leetcode.com/articles/kth-smallest-number-in-multiplication-table/)
- [LeetCode 644 - Maximum Average Subarray II](https://www.jiuzhang.com/solution/maximum-average-subarray-ii/)
  - find the contiguous subarray whose length is greater than or equal to k that has the maximum average value.
  <!-- 1. 只要满足一定误差，所以用二分，直接二分最后的平均值
  2. 在判断某个平均值是否满足时，转换为求连续子数组的和大于0（这个求平均值的套路可以记一下） -->
```java
private boolean canFind(int[] A, int K, double avg) {
    int i, k;
    double rightSum = 0, leftSum = 0, minLeftSum = 0;
    for (i = 0; i < K; ++i) {
        rightSum += A[i] - avg;
    }
    for (i = K; i <= A.length; ++i) {
        if (rightSum - minLeftSum >= 0) {
            return true;
        }
        if (i < A.length) {
            rightSum += A[i] - avg;
            leftSum += A[i - K] - avg;
            minLeftSum = Math.min(minLeftSum, leftSum);
        }
    }
    return false;
}
public double maxAverage(int[] A, int K) {
    int i;
    double start, stop, mid;
    start = stop = A[0];
    for (i = 0; i < A.length; ++i) {
        start = Math.min(A[i], start);
        stop = Math.max(A[i], stop);
    }
    while (start + 1e-5 < stop) {
        mid = (start + stop) / 2;
        if (canFind(A, K, mid)) {
            start = mid;
        }
        else {
            stop = mid;
        }
    }
    return start;
}
```

- [LeetCode 774 - Minimize Max Distance to Gas Station](https://www.jiuzhang.com/solution/minimize-max-distance-to-gas-station/)
  - add K more gas stations so that D, the maximum distance between adjacent gas stations, is minimized
  - [bisection]((https://www.jiuzhang.com/solution/minimize-max-distance-to-gas-station/))
  - [dp[i][j] represents minimum max distance when adding j new gas stations to first i intervals](http://hehejun.blogspot.com/2018/02/leetcodeminimize-max-distance-to-gas.html)
    - dp[i][j] = min(max(dp[i - 1][j - k], (stations[i] - stations[i - 1]) / (k + 1))), for 0<k<j
    - base case: dp[i][0] = max(stations[0], ..., stations[i - 1]), dp[0][j] = 0

#### Examples
- [LeetCode 287 - Find the Duplicate Number](https://blog.csdn.net/xudli/article/details/48802345)
  - Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive)
  - Constant space, don't modify the array
  - [Bisection (1, n), count(nums, int mid)](https://blog.csdn.net/xudli/article/details/48802345)
  - [32(n)](https://leetcode.com/problems/find-the-duplicate-number/discuss/72872/o32n-solution-using-bit-manipulation-in-10-lines)
  - [O(n) find cycle in LinkedList](https://leetcode.com/articles/find-the-duplicate-number/)

```java
public int findDuplicate(int[] nums) {
    int n = nums.length-1;
    int low = 1, high= n;
    int mid = 0;
    while(low<high) {
        mid = low + (high-low)/2;
        int c= count(nums, mid); //count #numbers less than mid.
        if(c<=mid) {
            low = mid+1;
        } else {
            high = mid;
        }
    }
    return low;
}

private int count(int[] nums, int mid) {
    int c =0;
    for(int i=0; i<nums.length; i++) {
        if(nums[i]<=mid) c++;
    }
    return c;
}
```

- [POJ 2976 Dropping tests](https://github.com/cherryljr/NowCoder/blob/master/POJ-2976%20Dropping%20tests.java)
  - `Convert r = max(∑a[i] / ∑b[i]) -> ∑a[i] - ∑b[i] * r = 0`

- [LeetCode 410 - Split Array Largest Sum](https://zhuhan0.blogspot.com/2017/08/leetcode-410-split-array-largest-sum.html)
  - split the array into m non-empty continuous subarrays and minimize the largest sum among these m subarrays
  - f[i][j] = min(max(f[i - 1][k] + nums[k] + nums[k + 1] + ... + nums[j]))
  - f[1][i] = prefix sum of nums[i]
  - [bisection](https://leetcode.com/problems/split-array-largest-sum/discuss/89817/Clear-Explanation%3A-8ms-Binary-Search-Java)

- [LeetCode 718 - Maximum Length of Repeated Subarray](https://leetcode.com/articles/maximum-length-of-repeated-subarray/)
  1. [dp[i][j] = 1 + dp[i - 1][j - 1];](https://leetcode.com/problems/maximum-length-of-repeated-subarray/discuss/109039/Concise-Java-DP%3A-Same-idea-of-Longest-Common-Substring)
  1. [prefix rolling hash + bisection](https://leetcode.com/problems/maximum-length-of-repeated-subarray/discuss/156891/Binary-Search-%2B-Rabin-Karp-%2B-Hash-Table-O(N-log-N)-Beats-100)


- [HARD LeetCode 862 - Shortest Subarray with Sum at Least K](https://leetcode.com/articles/shortest-subarray-with-sum-atleast-k/)
  - [monotone queue on prefix sum](https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k/discuss/143726/C%2B%2BJavaPython-O(N)-Using-Deque)
    - store the possible values of the start pointer in the queue
<!--
http://hehejun.blogspot.com/2018/07/leetcodeshortest-subarray-with-sum-at.html
如果对于i < j，presum[i] >= presum[j]的情况，显然对于j之后的index k。如果presum[k] - presum[i]大于等于K，那么因为presum[k] - presum[j] >= presum[k] - presum[i]，所以presum[k] - presum[j]必定也满足条件而且[j + 1, k]这个区间比[i + 1, k]更短
对于j > i，如果j是满足presum[j] - presum[i] >= K的最小值。那么对于k > j，我们不需要考虑presum[k] - presum[i]了，因为即使区间和大于K也比[i +1, j]要长
-->
  - [bisection: O(nlognlogn)](https://ttzztt.gitbooks.io/lc/content/combination/shortest-subarray-with-sum-at-least-k.html)
  - [TreeMap: prune bad candidates](https://ttzztt.gitbooks.io/lc/content/combination/shortest-subarray-with-sum-at-least-k.html)
```java
public int shortestSubarray(int[] A, int K) {
    int N = A.length;
    // Compute cumulative sum
    int[] cumSum = new int[N];
    for (int i = 0; i < N; ++i) {
        cumSum[i] = i > 0 ? cumSum[i-1] + A[i] : A[i];
    }
    if (!existsSolution(cumSum, K, N)) return -1;
    // Binary search over all possible lengths
    int l = 1, r = N;
    while (l < r) {
        int m = l + (r-l) / 2;
        if (existsSolution(cumSum, K, m)) {
            r = m;
        } else {
            l = m+1;
        }
    }
    return l;
}
boolean existsSolution(int[] cumSum, int K, int len) {
    // Priority queue that maintains minimal value within the window of size 'len'
    PriorityQueue<VI> pq = new PriorityQueue<>((a, b) -> Integer.compare(a.val, b.val));
    pq.add(new VI(0, -1));
    for (int i = 0; i < cumSum.length; ++i) {
        // Clean up minimal elements that are outside of the window
        while (!pq.isEmpty() && pq.peek().pos < i-len) {
            pq.poll();
        }
        int windowMin = !pq.isEmpty() ? pq.peek().val : 0;
        if (cumSum[i] - windowMin >= K) {
            return true;
        }
        pq.add(new VI(cumSum[i], i));
    }
    return false;
}
public static class VI {public int val, pos;}
```

### Return not mid
- [Find median from large file of integers - Airbnb](https://github.com/allaboutjst/airbnb/blob/master/src/main/java/find_median_in_large_file_of_integers/FindMedianinLargeIntegerFileofIntegers.java)
```java
private long search(int[] nums, int k, long left, long right) {
    if (left >= right) {
        return left;
    }
    long res = left;
    long guess = left + (right - left) / 2;
    int count = 0;
    for (int num : nums) {
        if (num <= guess) {
            count++;
            res = Math.max(res, num);
        }
    }
    if (count == k) {
        return res;
    } else if (count < k) {
        return search(nums, k, Math.max(res + 1, guess), right);
    } else {
        return search(nums, k, left, res);
    }
}
public double findMedian(int[] nums) {
    int len = 0;
    for (int num : nums) {
        len++;
    }
    if (len % 2 == 1) {
        return (double) search(nums, len / 2 + 1, Integer.MIN_VALUE, Integer.MAX_VALUE);
    } else {
        return (double) (search(nums, len / 2, Integer.MIN_VALUE, Integer.MAX_VALUE) +
                search(nums, len / 2 + 1, Integer.MIN_VALUE, Integer.MAX_VALUE)) / 2;
    }
}
```

#### Resources
- [LeetCode Binary Search Summary](https://www.cnblogs.com/grandyang/p/6854825.html){target="blank"}
- [Bisection method](https://en.wikipedia.org/wiki/Bisection_method){target="blank"}
- [Binary Search In Detail](https://hackernoon.com/binary-search-in-detail-914944a1434a){target="blank"}