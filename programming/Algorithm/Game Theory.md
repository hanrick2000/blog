
- states
  - whose turn: usually no need a different variable
- use bits to represent states

### Algorithm
- dfs+cache to try all
- dp

- [LeetCode 913 - Cat and Mouse]
  - 

### Examples
- [LeetCode 292 - Nim Game: take turns to remove 1 to 3 stones](https://leetcode.com/problems/nim-game/discuss/73845/Two-Java-Solution.)
- [LeetCode 464 - Can I Win](https://discuss.leetcode.com/topic/68896/java-solution-using-hashmap-with-detailed-explanation)
  - cannot re-use integers, given an maxChoosableInteger and another integer desiredTotal
```java
public boolean canIWin(int choose, int total) {
    if (choose>=total)
        return true;
    if (choose*(choose+1)/2<total)
        return false;
    Boolean memo[] = new Boolean[1<<(choose+1)];
    return dp(0, 0, choose, total, memo);
}
private boolean dp(int cur, int used, int choose, int total, Boolean[] memo) {
    if (memo[used]!=null) 
        return memo[used];
    for (int i=choose; i>0; i--) {
        if ((used&(1<<i))==0) {
            if (cur+i>=total) {
                memo[used] = true;
                return true;
            }
            if (!dp(cur+i, used|(1<<i), choose, total, memo)) {
                memo[used] = true;
                return true;
            }
        }
    }
    memo[used] = false;
    return false;
}
```
- LeetCode 486 - Predict the Winner
- [LeetCode 877 - Stone Game](https://leetcode.com/articles/stone-game/)
  - There are an even number of piles arranged in a row, and each pile has a positive integer number of stones piles[i]. The objective of the game is to end with the most stones.  The total number of stones is odd, so there are no ties. Alex and Lee take turns, with Alex starting first.  Each turn, a player takes the entire pile of stones from either the beginning or the end of the row.  
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
```

- LeetCode 294 - Flip Game II

### MinMax
- [LeetCode 375 - Guess Number Higher or Lower II](https://leetcode.com/problems/guess-number-higher-or-lower-ii/discuss/84807/java-commented-dp-solution)
  - dp[i][j] = min(k + max(dp[i][k - 1], dp[k + 1][j]))
```java
public int getMoneyAmount(int n) {
    int[][] dp = new int[n+1][n+1];
    for(int len=1;len<n;len++){
        for(int i=1;i+len<=n;i++){
            int j=i+len;
            int min = Integer.MAX_VALUE;
            for(int k=i;k<j;k++){
              int tmp = k+Math.max(dp[i][k-1],dp[k+1][j]);
              min = Math.min(min,tmp);
            }
            dp[i][j] = min;
        }
    }
    return dp[1][n];
}
```

### [LintCode 395 - Coins in a Line II](https://www.jiuzhang.com/solutions/coins-in-a-line-ii/)
1. [dp[i] = max(values[i] + min(dp[i+2], dp[i+3]), values[i] + values[i + 1] + min(dp[i+3], dp[i+4]))](http://www.cnblogs.com/grandyang/p/5864323.html)
1. [dp[i] = Math.max(sum[i] - dp[i - 1], sum[i] - dp[i - 2])](https://www.jiuzhang.com/solutions/coins-in-a-line-ii/)


