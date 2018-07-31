### When only related with previous rows
- orders: usually backward
- [LeetCode 416 - Partition Equal Subset Sum](https://leetcode.com/problems/partition-equal-subset-sum/discuss/90592/01-knapsack-detailed-explanation)
  - boolean dp[i][j] = dp[i-1][j] || dp[i-1][j-nums[i]]
  - reduce space: order matters
```java
public boolean canPartition(int[] nums) {
  // pre-optimization omitted
  boolean[] dp = new boolean[sum+1];
  Arrays.fill(dp, false);
  dp[0] = true;
  for (int num : nums) {
      for (int i = sum; i > 0; i--) {
          if (i >= num) {
              dp[i] = dp[i] || dp[i-num];
          }
      }
  }
  return dp[sum];
}
```
### When not use dialog element
- we can just use one array, the old value in last row is not overridden
- [LeetCode 877 - Stone Game: take from either the beginning or the end of the row](https://leetcode.com/articles/stone-game/)
  - dp[i][j] means the biggest number of stones you can get more than opponent picking piles in piles[i] ~ piles[j].
  - [dp[i][j] = max(piles[i] - dp[i + 1][j], piles[j] - dp[i][j - 1])]
  - when piles.length is even and the total number of stones is odd: the first one always wins
  ```java
public boolean stoneGame(int[] p) {
    int n = p.length;
    int[][] dp  = new int[n][n];
    for (int i = 0; i < n; i++) dp[i][i] = p[i];
    for (int d = 1; d < n; d++)
        for (int i = 0; i < n - d; i++)
            dp[i][i + d] = Math.max(p[i] - dp[i + 1][i + d], p[i + d] - dp[i][i + d - 1]);
    return dp[0][n - 1] > 0;
}
public boolean stoneGame(int[] p) {
    int[] dp = new int[p.length];
    for (int d = 1; d < p.length; d++)
        for (int i = 0; i < p.length - d; i++)
            dp[i] = Math.max(p[i] - dp[i + 1], p[i + d] - dp[i]);
    return dp[0] > 0;
} 

- [LeetCode 97 - Interleaving String: whether s3 is formed by the interleaving of s1 and s2](https://leetcode.com/articles/interleaving-strings/)
  - dp[i][j] = (dp[i - 1][j] && s1.charAt(i - 1) == s3.charAt(i + j - 1)) || (dp[i][j - 1] && s2.charAt(j - 1) == s3.charAt(i + j - 1));
  - [bfs on matrix formed from 2 string](https://leetcode.com/problems/interleaving-string/discuss/31948/8ms-C%2B%2B-solution-using-BFS-with-explanation)
```java
public boolean isInterleave(String s1, String s2, String s3) {
  if (s3.length() != s1.length() + s2.length()) {
    return false;
  }
  boolean dp[] = new boolean[s2.length() + 1];
  for (int i = 0; i <= s1.length(); i++) {
    for (int j = 0; j <= s2.length(); j++) {
      if (i == 0 && j == 0) {
        dp[j] = true;
      } else if (i == 0) {
        dp[j] = dp[j - 1] && s2.charAt(j - 1) == s3.charAt(i + j - 1);
      } else if (j == 0) {
        dp[j] = dp[j] && s1.charAt(i - 1) == s3.charAt(i + j - 1);
      } else {
        dp[j] = (dp[j] && s1.charAt(i - 1) == s3.charAt(i + j - 1))
            || (dp[j - 1] && s2.charAt(j - 1) == s3.charAt(i + j - 1));
      }
    }
  }
  return dp[s2.length()];
}
```



#### Rolling arrays
- rolling arrays or use dp[][2]

- [LeetCode 576 - Out of Boundary Paths](https://discuss.leetcode.com/topic/88570/java-solution-dp-with-space-compression)
  - DP[i][j][k] stands for how many possible ways to walk into cell j,k in step i, DP[i][j][k] only depends on DP[i - 1][j][k], so we can compress 3 dimensional dp array to 2 dimensional.
  - dp[i][j][step] = dp[i-1][j][step-1] + dp[i+1][j][step-1] + dp[i][j-1][step-1] + dp[i][j+1][step-1]
  - answer: count+= when i,j out of boundary
```java
public int findPaths(int m, int n, int N, int i, int j) {
    if (N <= 0) return 0;
    
    final int MOD = 1000000007;
    int[][] count = new int[m][n];
    count[i][j] = 1;
    int result = 0;
    
    int[][] dirs = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    
    for (int step = 0; step < N; step++) {
        int[][] temp = new int[m][n];
        for (int r = 0; r < m; r++) {
            for (int c = 0; c < n; c++) {
                for (int[] d : dirs) {
                    int nr = r + d[0];
                    int nc = c + d[1];
                    if (nr < 0 || nr >= m || nc < 0 || nc >= n) {
                        result = (result + count[r][c]) % MOD;
                    }
                    else {
                        temp[nr][nc] = (temp[nr][nc] + count[r][c]) % MOD;
                    }
                }
            }
        }
        count = temp;
    }
    
    return result;
}
```

