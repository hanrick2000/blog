
### Initialization
- dp[n+1] and start from 1; to avoid i>0 check

- [LeetCode 518 - Coin Change 2: the number of combinations that make up that amount](https://leetcode.com/problems/coin-change-2/discuss/99212/knapsack-problem-java-solution-with-thinking-process-onm-time-and-om-space)
  - dp[i][j] : the number of combinations to make up amount j by using the first i types of coins
  - use the ith coin
  - using the ith coin, since we can use unlimited same coin, we need to know how many way to make up amount j - coins[i]by using first i coins(including ith), which is dp[i][j-coins[i]]
  - dp[i][j] = dp[i-1][j]{exclude} + dp[i][j-coins[i-1]]{include}
```Java
public int change(int amount, int[] coins) {
    int[][] dp = new int[coins.length+1][amount+1];
    dp[0][0] = 1;
    // order matters
    for (int i = 1; i <= coins.length; i++) {
        dp[i][0] = 1;
        for (int j = 1; j <= amount; j++) {
            dp[i][j] = dp[i-1][j] + (j >= coins[i-1] ? dp[i][j-coins[i-1]] : 0);
        }
    }
    return dp[coins.length][amount];
}
```

- [LeetCode 10 - Regular Expression Matching](https://leetcode.com/problems/regular-expression-matching/discuss/5651/easy-dp-java-solution-with-detailed-explanation)
- dp[0][0] = true;
```java
dp[s.length() + 1][p.length() + 1], where dp[i[j] means the first i characters in string s matches the first characters of string p. 
1, If p.charAt(j) == s.charAt(i) :  dp[i][j] = dp[i-1][j-1];
2, If p.charAt(j) == '.' : dp[i][j] = dp[i-1][j-1];
3, If p.charAt(j) == '*': 
   here are two sub conditions:
               1   if p.charAt(j-1) != s.charAt(i) : dp[i][j] = dp[i][j-2]  //in this case, a* only counts as empty
               2   if p.charAt(i-1) == s.charAt(i) or p.charAt(i-1) == '.':
                              dp[i][j] = dp[i-1][j]    //in this case, a* counts as multiple a 
                           or dp[i][j] = dp[i][j-1]   // in this case, a* counts as single a
                           or dp[i][j] = dp[i][j-2]   // in this case, a* counts as empty
public boolean isMatch(String s, String p) {
 boolean[][] dp = new boolean[s.length()+1][p.length()+1];
 dp[0][0] = true;
 for (int i = 0; i < p.length(); i++) {
     if (p.charAt(i) == '*' && dp[0][i-1]) {
         dp[0][i+1] = true;
     }
 }
 for (int i = 0 ; i < s.length(); i++) {
     for (int j = 0; j < p.length(); j++) {
         if (p.charAt(j) == '.') {
             dp[i+1][j+1] = dp[i][j];
         }
         if (p.charAt(j) == s.charAt(i)) {
             dp[i+1][j+1] = dp[i][j];
         }
         if (p.charAt(j) == '*') {
             if (p.charAt(j-1) != s.charAt(i) && p.charAt(j-1) != '.') {
                 dp[i+1][j+1] = dp[i+1][j-1];
             } else {
                 dp[i+1][j+1] = (dp[i+1][j] || dp[i][j+1] || dp[i+1][j-1]);
             }
         }
     }
 }
 return dp[s.length()][p.length()];
}
```

- [LeetCode 44 - Wildcard Matching](https://leetcode.com/problems/wildcard-matching/discuss/17845/Python-DP-solution)
  - dp = new boolean[p.length() + 1][s.length() + 1];
  - dp[0][0] = true;
```java
dp[s.length() + 1][p.length() + 1], where dp[i[j] means the first i characters in string s matches the first characters of string p. 
-- If p.charAt(j - 1) != '*', then dp[i][j] = dp[i - 1][j - 1] IFF s.charAt(i) == p.charAt(j) || p.charAt(j) == '?'
-- If p.charAt(j - 1) == '*', then 
     -- dp[i][j] = dp[i - 1][j - 1] || // Match 1 character
                   = dp[i][j - 1] || // Match 0 character
                   = dp[i - 1][j] // Match any sequence of characters
public boolean isMatch(String s, String p) {
    boolean[][] dp = new boolean[p.length() + 1][s.length() + 1];
    dp[0][0] = true;
    for (int j = 1; j <= p.length(); j++) {
        char pattern = p.charAt(j - 1);
        dp[j][0] = dp[j - 1][0] && pattern == '*';
        for (int i = 1; i <= s.length(); i++) {
            char letter = s.charAt(i - 1);
            if (pattern != '*') {
                dp[j][i] = dp[j - 1][i - 1] && (pattern == '?' || pattern == letter);
            } else
                dp[j][i] = dp[j][i - 1] || dp[j - 1][i];
        }
    }
    return dp[p.length()][s.length()];
}
// rolling array
public boolean isMatch(String s, String p) {
    int m = s.length(), n = p.length();
    boolean[][] match = new boolean[2][n + 1];
    match[0][0] = true;
    for (int i = 0; i <= m; i++) {
        for (int j = 0; j <= n; j++) {
            if (j == 0) { // initialized first column
                match[i % 2][j] = i == 0;
                continue;
            }
            if (p.charAt(j - 1) == '*') {
                match[i % 2][j] = (i > 0 && match[(i - 1) % 2][j]) || match[i % 2][j - 1];
            } else {
                match[i % 2][j] = i > 0 && (s.charAt(i - 1) == p.charAt(j - 1) || p.charAt(j - 1) == '?') && match[(i - 1) % 2][j - 1];
            }
            
        }
    }
    return match[m % 2][n];
}
```