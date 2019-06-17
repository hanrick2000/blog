## DP - 2D
- Variables
  - i,j: index, position
  - number of X
  - last end number


### DP - Range
- min/max value in the Range
- answer: dp[0][n-1]
- i,j: index, position
- dp[i][j] is only related with dp[i + 1][j] and dp[i][j - 1])

#### How to update
- fill dp by len: from len 0,1 to n
  - fill dp[i][i]; for (int len = 1; len < n; len++)
<!-- 转移方程通过区间更新
从大到小的更新
逆向 ==> 类似分治法
-->

#### DP - Range
- dp[i][j] is only related with dp[i + 1][j] and dp[i][j - 1])
- [POJ 3280 - Cheapest Palindrome](http://www.hankcs.com/program/cpp/poj-3280-cheapest-palindrome.html)

- [LeetCode 877 - Stone Game: take from either the beginning or the end of the row](https://leetcode.com/articles/stone-game/)
  - [LeetCode 486 - Predict the Winner](https://leetcode.com/problems/predict-the-winner/discuss/96828/java-9-lines-dp-solution-easy-to-understand-with-improvement-to-on-space-complexity)
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
```

#### DP - Range 2: O(N^3)
- try every position in i-j to divide it to smaller range

- [LeetCode 312 - Burst Balloons: If the you burst balloon i you will get nums[left] * nums[i] * nums[right] coins](https://leetcode.com/problems/burst-balloons/discuss/76228/Share-some-analysis-and-explanations)
  - [dp[i][j] = max(dp[i][j], dp[i][k – 1] + nums[i – 1] * nums[k] * nums[j + 1] + dp[k + 1][j] for k in (i,j)](https://leetcode.com/problems/burst-balloons/discuss/76227/java-dp-solution-with-detailed-explanation-on3)
```java
public int maxCoins(int[] iNums) {
    int[] nums = new int[iNums.length + 2];
    int n = 1;
    for (int x : iNums) if (x > 0) nums[n++] = x;
    nums[0] = nums[n++] = 1;
    int[][] dp = new int[n][n];
    for (int k = 1; k < n; ++k)
        for (int left = 0; left < n - k; ++left) {
            int right = left + k;
            for (int i = left + 1; i < right; ++i)
                dp[left][right] = Math.max(dp[left][right],
                nums[left] * nums[i] * nums[right] + dp[left][i] + dp[i][right]);
        }
    return dp[0][n - 1];
}
```

- [LeetCode 546 - Remove Boxes](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-546-remove-boxes/)
  - dp[l][r][k]: the max score of subarray box[l] ~ box[r] with k boxes after box[r] that have the same color as box[r]
  - dp[l][r][k] = max(dp[l][r-1][0] + (k + 1)X(k + 1),  # case 1 dp[l][i][k+1] + dp[i+1][r-1][0])  # case 2
```java
// "ABACA|AAAA"
// case 1: dp("ABAC") + score("AAAAA") drop j and the tail.
// case 2: box[i] == box[r], l <= i < r, try all break points
// max({dp("A|AAAAA") + dp("BAC")}, {dp("ABA|AAAAA") + dp("C")})

```

- [LeetCode 664 - Strange Printer](http://www.cnblogs.com/grandyang/p/8319913.html)
  - dp[i][j] = min(dp[i][j], dp[i + 1][k - 1] + dp[k][j] (s[k] == s[i] and i + 1 <= k <= j)

- [LeetCode 646 - Maximum Length of Pair Chain](https://leetcode.com/articles/maximum-length-of-pair-chain/)
  - sort then greedy: O(nlogn)
  - [sort + stack](http://www.cnblogs.com/grandyang/p/7381633.html)
  - [sort then dp: O(n^2) dp[i][j] = max(dp[i][j], dp[i][k]+1 when pairs[k][1] < pairs[j][0])](https://leetcode.com/articles/maximum-length-of-pair-chain/)

- [LintCode 476 - Stone Game: merge two adjacent piles to a new pile, determine the minimum of the total score](https://zhengyang2015.gitbooks.io/lintcode/stone_game_476.html)
  - dp[i][j]=dp[i][k]+dp[k+1][j]+sum[i][j]

#### DP - Range 2: O(N^4)
- [LeetCode 87 - Scramble String: HARD](https://leetcode.com/problems/scramble-string/discuss/29396/Simple-iterative-DP-Java-solution-with-explanation)
  - [boolean scramble[k][i][j]: two substrings of length k, one starts from i of string s1, another one starts from j of string s2, are scramble](https://leetcode.com/problems/scramble-string/discuss/29396/Simple-iterative-DP-Java-solution-with-explanation)
    - answer: scramble[L][0][0]
  - [recursion + cache](https://leetcode.com/problems/scramble-string/discuss/29392/Share-my-4ms-c%2B%2B-recursive-solution)
```java
public boolean isScramble(String s1, String s2) {
  if (s1.length() != s2.length()) return false;
  int len = s1.length();
  boolean [][][] F = new boolean[len][len][len + 1];
  for (int k = 1; k <= len; ++k)
    for (int i = 0; i + k <= len; ++i)
      for (int j = 0; j + k <= len; ++j)
        if (k == 1)
          F[i][j][k] = s1.charAt(i) == s2.charAt(j);
        else for (int q = 1; q < k && !F[i][j][k]; ++q) {
          F[i][j][k] = (F[i][j][q] && F[i + q][j + q][k - q]) || (F[i][j + k - q][q] && F[i + q][j][k - q]);
        }
  return F[0][0][len];
}
```
### Two Sequences
- i from array a, j from array b

#### Two Sequences - Examples
- answer: dp[m][n]
- [longest common subsequence](https://codeforces.com/blog/entry/43256)
- [Find number of times a string occurs as a subsequence in given string](https://www.geeksforgeeks.org/find-number-times-string-occurs-given-string/)
- [LeetCode 72 - Edit Distance](https://leetcode.com/problems/edit-distance/discuss/25846/20ms-detailed-explained-c-solutions-on-space)
  - [dp[i][j] = dp[i - 1][j - 1], if word1[i - 1] = word2[j - 1];](https://www.dreamxu.com/books/dsa/dp/edit-distance.html)
  - dp[i][j] = min(dp[i - 1][j - 1] + 1(replace), dp[i - 1][j] + 1(delete), dp[i][j - 1] + 1(insert)), otherwise.
- [LeetCode 115 - Distinct Subsequences](https://leetcode.com/problems/distinct-subsequences/discuss/37327/easy-to-understand-dp-in-java)
  - f[i][j] = f[i-1][j] + f[i-1][j-1](case: include s[i-1] or not) if S[i-1] == T[j-1] otherwise f[i][j] = f[i-1][j]
```java
public int numDistinct(String S, String T) {
    int M = S.length();
    int N = T.length();
    int[][] num = new int[M + 1][N + 1];
    for (int i = 0; i <= N; i++)
        num[0][i] = 0;
    for (int i = 0; i <= M; i++)
        num[i][0] = 1;
    for (int i = 1; i <= M; i++) {
        for (int j = 1; j <= N; j++) {
            if (S.charAt(i - 1) != T.charAt(j - 1)) {
                num[i][j] = num[i - 1][j];
            } else {
                num[i][j] = num[i - 1][j] + num[i - 1][j - 1];
            }
        }
    }
    return num[M][N];
}
```
- [LeetCode 97 - Interleaving String: whether s3 is formed by the interleaving of s1 and s2](https://leetcode.com/articles/interleaving-strings/)
  - dp[i][j] = (dp[i - 1][j] && s1.charAt(i - 1) == s3.charAt(i + j - 1)) || (dp[i][j - 1] && s2.charAt(j - 1) == s3.charAt(i + j - 1));
  - [bfs](https://leetcode.com/problems/interleaving-string/discuss/31948/8ms-C%2B%2B-solution-using-BFS-with-explanation)



### Examples
- [LeetCode 871 - Minimum Number of Refueling Stops](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/149867/Simple-Java-using-pq-with-explanation)
  - [Greedy + PQ, curFarthest: O(NlogN)](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/149867/Simple-Java-using-pq-with-explanation)
  - [DP: variables/states: station, refuel stops](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/151850/C%2B%2B-DP-solution-Space-complexity-from-O(n2)-to-O(n).)
    - dp[i][j] the farthest location we can get to using exactly j refueling stops among the first i refueling stops for j<i; dp[i][j] = max(dp[i][j], dp[i-1][j-1] + stations[i][1], dp[i-1][j])
    - [reduce space: dp[t] means the furthest distance that we can get with t times of refueling](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/149839/DP-O(N2)-and-Priority-Queue-O(NlogN))

- [LeetCode 718 - Maximum Length of Repeated Subarray](https://leetcode.com/articles/maximum-length-of-repeated-subarray/)
  1. [dp[i][j] = 1 + dp[i - 1][j - 1];](https://leetcode.com/problems/maximum-length-of-repeated-subarray/discuss/109039/Concise-Java-DP%3A-Same-idea-of-Longest-Common-Substring)
  1. [prefix rolling hash + bisection](https://leetcode.com/problems/maximum-length-of-repeated-subarray/discuss/156891/Binary-Search-%2B-Rabin-Karp-%2B-Hash-Table-O(N-log-N)-Beats-100)

- [LeetCode 774 - Minimize Max Distance to Gas Station](https://www.jiuzhang.com/solution/minimize-max-distance-to-gas-station/)
  - add K more gas stations so that D, the maximum distance between adjacent gas stations, is minimized
  1. [bisection]((https://www.jiuzhang.com/solution/minimize-max-distance-to-gas-station/))
  1. [dp[i][j] represents minimum max distance when adding j new gas stations to first i intervals](http://hehejun.blogspot.com/2018/02/leetcodeminimize-max-distance-to-gas.html)
    - dp[i][j] = min(max(dp[i - 1][j - k], (stations[i] - stations[i - 1]) / (k + 1))), for 0<k<j
    - base case: dp[i][0] = max(stations[0], ..., stations[i - 1]), dp[0][j] = 0

- [LeetCode 920 - Number of Music Playlists](https://leetcode.com/articles/number-of-music-playlists/)
  - [dp[i][j]: the number of playlists of length i that have exactly j unique songs](https://leetcode.com/problems/number-of-music-playlists/discuss/180338/DP-solution-that-is-Easy-to-understand)
  - dp[i][j] = dp[i-1][j-1] * (N - (j-1)) + dp[i-1][j] * j


- [LeetCode 873 - Length of Longest Fibonacci Subsequence](https://leetcode.com/problems/length-of-longest-fibonacci-subsequence/discuss/152343/C%2B%2BJavaPython-Check-Pair)
  - [dp[a, b] represents the length of fibo sequence ends up with (a, b) + indexMap](https://leetcode.com/problems/length-of-longest-fibonacci-subsequence/discuss/152343/C%2B%2BJavaPython-Check-Pair)

- [POJ 2385 - Apple Catching](http://blog.csdn.net/catglory/article/details/50512221)
  - dp[i][j]=max(dp[i-1][j],dp[i-1][j-1])+count(whether get apple this time), the count is related the position, its parity

- [LeetCode 568 - Maximum Vacation Days](https://www.jianshu.com/p/a76ada51ac9e)
  - [dp[i][j] = max(dp[i - 1][k] + days[j][i]) (if we can go from city k to city j)](https://www.jianshu.com/p/a76ada51ac9e)


#### LIS
- [Longest subsequence such that difference between adjacents is one](http://www.geeksforgeeks.org/longest-subsequence-such-that-difference-between-adjacents-is-one/)
  - dp[i] be the length of the longest subsequence (wit differences one) ending at index i such that arr[i]  is the last element of the subsequence
  - dp[i] = 1 + max(dp[j]) where 0 < j < i and [arr[j] = arr[i] -1  or arr[j] = arr[i] + 1]
  - answers: max{dp[i]}

### Hard
- [Crazy Numbers](http://techieme.in/crazynumbers-dynamic-programming/)
  - [dp(i,j) where "i" denotes the number of digits in the number and "j" denotes the last digit of that number](https://www.hackerearth.com/practice/algorithms/dynamic-programming/2-dimensional/practice-problems/algorithm/crazy-numbers-1/editorial/)
  - if(j == 0) dp(i,j) = dp(i-1,j+1) else dp(i,j) = dp(i-1,j+1) + dp(i-1,j-1)


