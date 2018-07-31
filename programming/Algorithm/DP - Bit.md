## DP - Bit
- dp[i] = dp[i>>1] + i&1
- dp[i] = dp[i & (i - 1)] + 1;

- [LeetCode 338 - Counting Bits](https://leetcode.com/problems/counting-bits/discuss/79539/Three-Line-Java-Solution)
  - [dp[i] = dp[i>>1] + i&1](https://leetcode.com/problems/counting-bits/discuss/79539/Three-Line-Java-Solution)
  - [dp[i] = dp[i & (i - 1)] + 1](http://www.cnblogs.com/grandyang/p/5294255.html)
  - [dp[index] = dp[index - nearest-power-of-2] + 1](https://leetcode.com/problems/counting-bits/discuss/119131/C++-Easy-to-Understand-Solution)

- [LeetCode 318 - Maximum Product of Word Lengths](https://leetcode.com/problems/maximum-product-of-word-lengths/discuss/77021/32ms-Java-AC-solution)
  - Use bit to check whether two items share same
  - for(char c: words[i].toCharArray()) masks[i] |= 1 << (c - 'a');

- [LeetCode 898 - Bitwise ORs of Subarrays](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-898-bitwise-ors-of-subarrays/)
  - dp[i] := {A[i], A[i] | A[i – 1], A[i] | A[i – 1] | A[i – 2], … , A[i] | A[i – 1] | … | A[0]}, bitwise ors of all subarrays end with A[i]
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