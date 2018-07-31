#### DP - 1D
- [LeetCode 673 - Number of Longest Increasing Subsequence](https://leetcode.com/articles/number-of-longest-increasing-subsequence/)
  - [dp](https://leetcode.com/articles/number-of-longest-increasing-subsequence/)
  - [nlogn](http://guoyc.com/post/num_of_lis/)

#### DP - when condition meets
- [LeetCode 664 - Strange Printer](http://www.cnblogs.com/grandyang/p/8319913.html)
  - dp[i][j] = min(dp[i][j], dp[i + 1][k - 1] + dp[k][j] (s[k] == s[i] and i + 1 <= k <= j)

- [LeetCode 650 - 2 Keys Keyboard](https://blog.csdn.net/u011026968/article/details/79890311)
  - the minimum number of steps to get n 'A'
  - [dp[i] = min(dp[i], dp[j] + i / j); when i % j == 0](https://leetcode.com/problems/2-keys-keyboard/discuss/105899/Java-DP-Solution)
  - starting/turning point: last ops are always paste
  - greedy
```java
public int minSteps(int n) {
  int[] dp = new int[n+1];
  for (int i = 2; i <= n; i++) {
      dp[i] = i;
      for (int j = i-1; j > 1; j--) {
          if (i % j == 0) {
              dp[i] = dp[j] + (i/j);
              break;
          }
          
      }
  }
  return dp[n];
}
int minSteps(int n) {
    if (n == 1) return 0;
    for (int i = 2; i < n; i++)
        if (n % i == 0) return i + minSteps(n / i);
    return n;
}
public int minSteps(int n) {
  int res = 0;
  for(int i=2;i<=n;i++){
      while(n%i == 0){
          res+= i;
          n=n/i;
      }
  }
  return res;
}
```

- [LeetCode 651 - 4 Keys Keyboard: the maximum numbers of 'A' you can print](http://reeestart.me/2018/12/09/LeetCode-651-4-Keys-Keyboard/)
  - starting/turning point: last ops are always paste
```java
for (int i = 7; i <= N; i++) {
    dp[i] = dp[i-1]+1;
    for (int j = 1; j <= i - 3; j++) {
        final int tmp = dp[j] * (i - j - 1);
        dp[i] = Math.max(dp[i], tmp);
    }
}
```

- [LeetCode 646 - Maximum Length of Pair Chain](https://leetcode.com/articles/maximum-length-of-pair-chain/)
  - sort then greedy: O(nlogn)
  - [sort + stack](http://www.cnblogs.com/grandyang/p/7381633.html)
  - [sort then dp: O(n^2) dp[i][j] = max(dp[i][j], dp[i][k]+1 when pairs[k][1] < pairs[j][0])](https://leetcode.com/articles/maximum-length-of-pair-chain/)

#### Dp - every cases
- [LeetCode 91 - Decode Ways]
- [LeetCode 639 - Decode Ways II: * can be treated as one of the numbers from 1 to 9](https://leetcode.com/articles/decode-ways-ii/)
  - cases: s.charAt(i) == '\*', s.charAt(i - 1) == 1 or 2 or *

- [LeetCode 516 - Longest Palindromic Subsequence](https://leetcode.com/problems/longest-palindromic-subsequence/discuss/99101/straight-forward-java-dp-solution)
  - [dp[i][j] = dp[i+1][j-1] + 2 if s.charAt(i) == s.charAt(j) otherwise, dp[i][j] = Math.max(dp[i+1][j], dp[i][j-1])](https://leetcode.com/problems/longest-palindromic-subsequence/discuss/99101/straight-forward-java-dp-solution)

- [Count number of ways to fill a "n x 4" grid using "1 x 4" tiles](http://www.geeksforgeeks.org/count-number-of-ways-to-fill-a-n-x-4-grid-using-1-x-4-tiles/)
  - count(n) = count(n-1) + count(n-4) 


<!-- hihoCoder #1143 : 骨牌覆盖问题
f[n] = f[n-1] + f[n-2]

-->
