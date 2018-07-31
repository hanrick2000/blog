## DP Variables/States
- i,j
  - using the first i elements
  - index, position (sequence, matrix, range)
  - i from array a, j from array b
- number of X
- value/index of last end number
- remainder: divisible 
- arithmetic subsequence: delta
- diff
- current states
  - doing sth exactly at ith
  - states at ith, the change may happen before
    - buy, sell, hold

### DP cache
- [when value may contain negative value, big or not consecutive: use map](https://leetcode.com/problems/arithmetic-slices-ii-subsequence/discuss/92822/Detailed-explanation-for-Java-O(n2)-solution)
### local min/max ending at i
#### LIS
- [Longest subsequence such that difference between adjacents is one](http://www.geeksforgeeks.org/longest-subsequence-such-that-difference-between-adjacents-is-one/)
  - dp[i] be the length of the longest subsequence (wit differences one) ending at index i such that arr[i]  is the last element of the subsequence
  - dp[i] = 1 + max(dp[j]) where 0 < j < i and [arr[j] = arr[i] -1  or arr[j] = arr[i] + 1]
  - answers: max{dp[i]}


### first i elements
- [LeetCode 518 - Coin Change 2: the number of combinations that make up that amount](https://leetcode.com/problems/coin-change-2/discuss/99212/knapsack-problem-java-solution-with-thinking-process-onm-time-and-om-space)
  - dp[i][j] : the number of combinations to make up amount j by using the first i types of coins
  - use the ith coin
  - using the ith coin, since we can use unlimited same coin, we need to know how many way to make up amount j - coins[i]by using first i coins(including ith), which is dp[i][j-coins[i]]
  - dp[i][j] = dp[i-1][j]{exclude} + dp[i][j-coins[i-1]]{include}

### value/index [of last end number]
- [Count binary strings with k times appearing adjacent two set bits](https://www.geeksforgeeks.org/count-binary-strings-k-times-appearing-adjacent-two-set-bits/)
  - dp[i][j][0] denotes number of binary strings with length i having j number of two adjacent 1's and ending with 0; dp[i][j][1] denotes the same binary strings with length i and j adjacent 1's but ending with 1.
  - dp[i][j][0] = dp[i-1][j][0] + dp[i-1][j][1]
  - dp[i][j][1] = dp[i-1][j][0] + dp[i-1][j-1][1]
  - Answer: dp[n][k][0] + dp[n][k][1]

- [Parenthesize the Expression](https://algorithmsandme.com/boolean-parenthesization-problem/)
  - DP[start][end][True or False] – Expression starts at start point, end at end points and desired result is true or false
  - when char is |, & or ^.
  - [Let T(i, j)/F(i, j) represents the number of ways to parenthesize the symbols between i and j (both inclusive) such that the subexpression between i and j evaluates to true/false](https://algorithmsandme.com/boolean-parenthesization-problem/)

### remainder: divisible
- [Number of subsequences in a string divisible by n](https://www.geeksforgeeks.org/number-subsequences-string-divisible-n/)
  - dp[i][j] indicates number of subsequences in string [0..i] which leaves remainder j after division by n. 
  - cases: include or exclude last element
```Java
static int countDivisibleSubseq(String str, int n) { 
    int len = str.length(); 
    int dp[][] = new int[len][n]; 
    dp[0][(str.charAt(0) - '0') % n]++; 
    for (int i = 1; i < len; i++) { 
        dp[i][(str.charAt(i) - '0') % n]++; 
        for (int j = 0; j < n; j++) { 
            // exclude i'th character from all the 
            // current subsequences of string [0...i-1] 
            dp[i][j] += dp[i - 1][j]; 
            // include i'th character in all the current 
            // subsequences of string [0...i-1] 
            dp[i][(j * 10 + (str.charAt(i) - '0')) % n] += dp[i - 1][j]; 
        } 
    } 
    return dp[len - 1][0]; 
} 
```
### Diff
- Arithmetic Slices - delta
- [Count even length binary sequences with same sum of first and second half bits](https://www.geeksforgeeks.org/count-even-length-binary-sequences-with-same-sum-of-first-and-second-half-bits/)
  - lookup[n][n+dif]
```java
int res = // First bit is 0 & last bit is 1 
        countSeqUtil(n-1, dif+1) + 
        // First and last bits are same 
        2*countSeqUtil(n-1, dif) + 
        // First bit is 1 & last bit is 0 
        countSeqUtil(n-1, dif-1); 
```
- [Longest Arithmetic Progression of sorted array](https://orajavasolutions.wordpress.com/2014/06/28/length-of-longest-arithmetic-progression/)
  - starting point: 3 values, fix the middle value
  - [simplify the question to find if there exist three elements in Arithmetic Progression or not](https://orajavasolutions.wordpress.com/2014/06/27/finding-three-elements-in-arithmetic-progression-a-p/)
  - DP + two pointers: fix middle, <- middle ->
    - [Table[i][j] is set to length of AP with first and second element as A[i] and A[j]](https://gist.github.com/gcrfelix/54c096c66177208084db0d417419677f)
  - [DP states: diff: Map<Integer, List<int[]>> map](https://gist.github.com/gcrfelix/54c096c66177208084db0d417419677f)

- [LeetCode 446 - Arithmetic Slices II - Subsequence: return the number of arithmetic subsequence slices](https://leetcode.com/problems/arithmetic-slices-ii-subsequence/discuss/92822/Detailed-explanation-for-Java-O(n2)-solution)
  - A sequence of numbers is called arithmetic if it consists of at least three elements and if the difference between any two consecutive elements is the same.
  - dp[i][delta]=∑dp[j][delta]+1
```Java
public int numberOfArithmeticSlices(int[] A) {
    int res = 0;
    Map<Integer, Integer>[] map = new Map[A.length];
    for (int i = 0; i < A.length; i++) {
        map[i] = new HashMap<>(i);
        for (int j = 0; j < i; j++) {
            long diff = (long)A[i] - A[j];
            if (diff <= Integer.MIN_VALUE || diff > Integer.MAX_VALUE) continue;
            int d = (int)diff;
            int c1 = map[i].getOrDefault(d, 0);
            int c2 = map[j].getOrDefault(d, 0);
            res += c2;
            map[i].put(d, c1 + c2 + 1);
        }
    }		
    return res;
}
```

### Hard
- [LeetCode 546 - Remove Boxes]
  - [dp[i][j][k] represents the max points from box[i] to box[j] with k boxes whose values equal to box[i]](https://leetcode.com/problems/remove-boxes/discuss/101325/java-dp-memorization-60ms)