- exactly -> at most/least
- 

### Reverse - Different results/answer
- [Count strings with consecutive 1’s](https://www.geeksforgeeks.org/count-strings-with-consecutive-1s/)
  - answer: (1 << n) - the number of binary strings without consecutive 1’s

- [LeetCode 960 - Delete Columns to Make Sorted III](https://leetcode.com/articles/delete-columns-to-make-sorted-iii/)
  - find numbers of columns to keep
```java
public int minDeletionSize(String[] A) {
  int W = A[0].length();
  int[] dp = new int[W];
  Arrays.fill(dp, 1);
  for (int i = W - 2; i >= 0; --i)
    search: for (int j = i + 1; j < W; ++j) {
      for (String row : A)
        if (row.charAt(i) > row.charAt(j))
          continue search;

      dp[i] = Math.max(dp[i], 1 + dp[j]);
    }
  int kept = 0;
  for (int x : dp)
    kept = Math.max(kept, x);
  return W - kept;
}
```
#### **exactly -> at most**
- [LeetCode 992 - Subarrays with K Different Integers](https://leetcode.com/problems/subarrays-with-k-different-integers/discuss/234482/JavaC++Python-Sliding-Window-with-Video)
  - Given an array A of positive integers, call a (contiguous, not necessarily distinct) subarray of A good if the number of different integers in that subarray is exactly K.
  - **exactly -> at most**
  - sliding window, two pointers
  - [window class, maintain 2 sliding windows with same end element](https://leetcode.com/articles/subarrays-with-k-different-integers/)
```java
public int subarraysWithKDistinct(int[] A, int K) {
    return atMostK(A, K) - atMostK(A, K - 1);  
}
private int atMostK(int[] A, int K) {
    int i = 0, j = 0;
    int total = 0;
    int distinct = 0;   // count of distinct numbers in the window.
    Map<Integer, Integer> counter = new HashMap<>();
    while (j < A.length) {
        if (counter.getOrDefault(A[j], 0) == 0) {
            distinct++;
        }
        counter.put(A[j], 1 + counter.getOrDefault(A[j], 0));
        j++;
        while (i < j && distinct > K) {  // shrink the left boundary of window.
            counter.put(A[i], counter.get(A[i]) - 1);
            if (counter.get(A[i]) == 0) {
                distinct--;
            }
            i++;
        }
        total += j - i;  
    }
    return total;
}
```





