
## Answer
- boolean[][] dp -> count
  - max of dp[n] or dp[n][0..m]

- [LeetCode 647 - Palindromic Substrings](https://leetcode.com/articles/palindromic-substrings/)
  - [Expand from center](https://leetcode.com/problems/palindromic-substrings/discuss/105689/Java-solution-8-lines-extendPalindrome)
  - [DP: range](https://leetcode.com/problems/palindromic-substrings/discuss/105707/Java-DP-solution-based-on-longest-palindromic-substring)
    - boolean[][] dp = new boolean[n][n]; dp[i][j] = s.charAt(i) == s.charAt(j) && (j - i < 3 || dp[i + 1][j - 1]);
    - if(dp[i][j]) ++res;
```Java
public int countSubstrings(String s) {
    int n = s.length();
    int res = 0;
    boolean[][] dp = new boolean[n][n];
    for (int i = n - 1; i >= 0; i--) {
        for (int j = i; j < n; j++) {
            dp[i][j] = s.charAt(i) == s.charAt(j) && (j - i < 3 || dp[i + 1][j - 1]);
            if(dp[i][j]) ++res;
        }
    }
    return res;
}
```
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
