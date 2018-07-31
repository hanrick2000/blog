### Algorithm
- sliding window 
- suffix
- subarray sum: prefix sum

### Sliding Window
- [LeetCode 992 - Subarrays with K Different Integers](https://leetcode.com/problems/subarrays-with-k-different-integers/discuss/234482/JavaC++Python-Sliding-Window-with-Video)
  - exactly -> at most
  - sliding window
  - [same idea, maintain 2 sliding windows with same end element](https://leetcode.com/articles/subarrays-with-k-different-integers/)
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

### Limited set
- [LeetCode 898 - Bitwise ORs of Subarrays](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-898-bitwise-ors-of-subarrays/)
  - dp[i] := {A[i], A[i] | A[i – 1], A[i] | A[i – 1] | A[i – 2], … , A[i] | A[i – 1] | … | A[0]}, bitwise ors of all subarrays end with A[i]: suffix
  - dp[i+1] = a[i+1]|{element in dp[i]}
  - The size of the set in dp[i] is <= 32. O(32N)
```java
public int subarrayBitwiseORs(int[] A) {
  Set<Integer> ans = new HashSet<>();
  Set<Integer> cur = new HashSet<>();
  for (int a : A) {
    Set<Integer> next = new HashSet<>();
    next.add(a);
    for (int b : cur)
      next.add(a | b);
    ans.addAll(next);
    cur = next;
  }
  return ans.size();
}
```





