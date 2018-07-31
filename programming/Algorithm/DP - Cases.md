## Cases
- include/exclude

### Include/Exclude
- Kadane’s Algorithm
- globalMax, maxSoFar
- [Max sum subsequence with non-consecutive elements](http://massivealgorithms.blogspot.com/2015/11/max-sum-subsequence-with-non.html)
```java
max_including(i) = max{max_excluding(i-1)+a[i], a[i]}
max_excluding(i) = max{max_including(i-1), max_excluding(i-1)}
global_max = max{max_including(i), max_excluding(i)}, for each i = {0, 1, ..., n-1}
```

- [Maximum subsequence sum such that no three are consecutive](http://www.geeksforgeeks.org/maximum-subsequence-sum-such-that-no-three-are-consecutive/)
  - cases: exclude arr[i] or arr[i-1] or arr[i-2]
  - sum[i] = max(sum[i-1], sum[i-2] + arr[i], sum[i-3] + arr[i] + arr[i-1])
- [Maximum sum such that no two elements are adjacent](http://www.geeksforgeeks.org/maximum-sum-such-that-no-two-elements-are-adjacent/)
  - excl_new = (incl > excl) ? incl : excl; incl = excl + arr[i]; 
- [LeetCode 115 - Distinct Subsequences](https://leetcode.com/problems/distinct-subsequences/discuss/37327/easy-to-understand-dp-in-java)
  - f[i][j] = f[i-1][j] + f[i-1][j-1](case: include s[i-1] or not) if S[i-1] == T[j-1] otherwise f[i][j] = f[i-1][j]

