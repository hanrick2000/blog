## DP - Relations/Functions Optimization
- reduce loop, kn^2 -> kn
- dp[i][j+1]-dp[i][j] => 
- Property: function increases/decreases when i increases

### O(N^2) to O(N)
- dp[i][j] to dp[i], dp stores all results
- [LeetCode 898 - Bitwise ORs of Subarrays](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-898-bitwise-ors-of-subarrays/)
  - Simple DP: O(N^2): dp[i][j] := A[i] | A[i + 1] | … | A[j]; dp[i][j] = dp[i][j – 1] | A[j]
  - dp[i] := {A[i], A[i] | A[i – 1], A[i] | A[i – 1] | A[i – 2], … , A[i] | A[i – 1] | … | A[0]}, bitwise ors of all subarrays end with A[i]: suffix
    - dp to store all results
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

- [LeetCode 375 - Wiggle Subsequence](https://leetcode.com/articles/wiggle-subsequence/)
  - [Tuning/Starting Point, tow pointers](https://www.hrwhisper.me/leetcode-wiggle-subsequence/)
  - [dp: O(N^2)](https://leetcode.com/articles/wiggle-subsequence/)
  - [dp: O(N)](https://leetcode.com/problems/wiggle-subsequence/discuss/84843/Easy-understanding-DP-solution-with-O(n)-Java-version)
```java
public int wiggleMaxLength(int[] nums) {
    if (nums.length < 2)
        return nums.length;
    int[] up = new int[nums.length];
    int[] down = new int[nums.length];
    for (int i = 1; i < nums.length; i++) {
        for(int j = 0; j < i; j++) {
            if (nums[i] > nums[j]) {
                up[i] = Math.max(up[i],down[j] + 1);
            } else if (nums[i] < nums[j]) {
                down[i] = Math.max(down[i],up[j] + 1);
            }
        }
    }
    return 1 + Math.max(down[nums.length - 1], up[nums.length - 1]);
}
public int wiggleMaxLength(int[] nums) {
    if( nums.length == 0 ) return 0;
    int[] up = new int[nums.length];
    int[] down = new int[nums.length];
    up[0] = 1;
    down[0] = 1;
    for(int i = 1 ; i < nums.length; i++){
        if( nums[i] > nums[i-1] ){
            up[i] = down[i-1]+1;
            down[i] = down[i-1];
        }else if( nums[i] < nums[i-1]){
            down[i] = up[i-1]+1;
            up[i] = up[i-1];
        }else{
            down[i] = down[i-1];
            up[i] = up[i-1];
        }
    }
    return Math.max(down[nums.length-1],up[nums.length-1]);
}
```


## O(KN^2) -> O(KN)
### dp[n][k+1] - dp[n][k]
- [LeetCode 629 - K Inverse Pairs Array](https://leetcode.com/problems/k-inverse-pairs-array/discuss/104815/java-dp-onk-solution)
  - [O(NK^2): dp[n][k] = dp[n - 1][k] + dp[n - 1][k-1] + dp[n-1][k-2] ... + dp[n - 1][k - n + 1]](http://www.cnblogs.com/grandyang/p/7111385.html)
  - dp[i][j+1]-dp[i][j] = > dp[n][k] = dp[n][k-1] + dp[n - 1][k] - dp[n - 1][k - n]
```java
dp[n][k] = dp[n - 1][k] + dp[n - 1][k-1] + ... + dp[n - 1][k - n + 1]
dp[n][k+1] = dp[n - 1][k+1] + dp[n - 1][k] + ... + dp[n - 1][k + 1 - n + 1]
dp[n][k+1] - dp[n][k] = dp[n - 1][k+1] - dp[n - 1][k - n + 1]
```
### Avoid duplication computation
- use graph/matrix to find duplication computation
- [POJ 3046 - Ant Counting](https://blog.csdn.net/u014688145/article/details/71136194)
  - [O(kN^2): dp[i][j] = sigma(dp[i - 1][j - k]) k:0~N[i]](https://shanzi.gitbooks.io/algorithm-notes/content/problem_solutions/ant_counting.html)
  - dp[i][j]=dp[i][j−1]+dp[i−1][j]−dp[i−1][j−1−num[i]]

### Avoid duplication computation and save preMin/Max
- [LeetCode 122 - Best Time to Buy and Sell Stock III: complete at most two transactions](https://www.jiuzhang.com/solutions/best-time-to-buy-and-sell-stock-iii/)
  - [left + right array](https://www.jiuzhang.com/solutions/best-time-to-buy-and-sell-stock-iii/)
    - left[i] = Math.max(left[i - 1], prices[i] - min); right[i] = Math.max(right[i + 1], max - prices[i]);
  - [local + max ](http://www.cnblogs.com/grandyang/p/4281975.html)
    - global[i][j]=max(local[i][j],global[i-1][j])
    - local[i][j]=max(global[i-1][j-1],local[i-1][j])+diff(=prices[i + 1] - prices[i])
  - [O(KN^2): dp[k, i] = max(dp[k, i-1], prices[i] - prices[j] + dp[k-1, j-1]), j=[0..i-1]](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/discuss/135704/Detail-explanation-of-DP-solution)
<!-- local[i][j]为在到达第i天时最多可进行j次交易并且最后一次交易在最后一天卖出的最大利润
global[i][j]为在到达第i天时最多可进行j次交易的最大利润 -->

- [LeetCode 188 - Best Time to Buy and Sell Stock IV: complete at most k transactions](https://www.jiuzhang.com/solutions/best-time-to-buy-and-sell-stock-iv/)
  - [O(KN^2)](https://www.hrwhisper.me/leetcode-best-time-to-buy-and-sell-stock-i-ii-iii-iv/)
    - dp[i][x] = max(dp[i-1][x] , dp[j][x – 1] + prices[i] – prices[j])  0 <= j < i
    - answer = max{dp[prices.size() - 1][x])}
  - [O(KN^2) -> O(KN)](https://www.geeksforgeeks.org/maximum-profit-by-buying-and-selling-a-share-at-most-k-times/)
  ```java
  dp[i][x] = max(dp[i-1][x] , dp[j][x – 1] + prices[i] – prices[j])  0 <= j < i
   -> max(dp[i-1][x] ,  prices[i] + (dp[j][x – 1] – prices[j]))
   -> for all j
  ```
  - [local + max functions](http://buttercola.blogspot.com/2015/08/leetcode-best-time-to-buy-and-sell.html)
    - [global[i][j] means the ith day after j transactions the maximal profilt; local[i][j] means the transaction j must happen on today. and the maximal profits](https://www.jianshu.com/p/26f792f83ee4)
    - global[i][j]=max(local[i][j],global[i-1][j])
    - local[i][j]=max(global[i-1][j-1],local[i-1][j])+diff(=prices[i + 1] - prices[i])
  <!-- local[i][j]为在到达第i天时最多可进行j次交易并且最后一次交易在最后一天卖出的最大利润
  global[i][j]为在到达第i天时最多可进行j次交易的最大利润 -->
  - [hold[i][j] + unhold[i][j]](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/discuss/54114/Easy-understanding-and-can-be-easily-modified-to-different-situations-Java-Solution)
    - hold[i][j] means the maximum profit with at most j transaction for 0 to i-th day. hold means you have a stock in your hand.
    - unhold[i][j] means the maximum profit with at most j transaction for 0 to i-th day. unhold means you don't have a stock in your hand.
    - hold[i][j] = Math.max(unhold[i-1][j]-prices[i],hold[i-1][j]); unhold[i][j] = Math.max(hold[i-1][j-1]+prices[i],unhold[i-1][j]);
```Java
// O(KN^2)https://www.geeksforgeeks.org/maximum-profit-by-buying-and-selling-a-share-at-most-k-times/
static int maxProfit(int[] price, int n, int k) {
    int[][] profit = new int[k + 1][n + 1];
    for (int i = 0; i <= k; i++)
        profit[i][0] = 0;
    for (int j = 0; j <= n; j++)
        profit[0][j] = 0;
    for (int i = 1; i <= k; i++) {
        for (int j = 1; j < n; j++) {
            int max_so_far = 0;
            for (int m = 0; m < j; m++)
                max_so_far = Math.max(max_so_far, price[j] - price[m] + profit[i - 1][m]);
            profit[i][j] = Math.max(profit[i][j - 1], max_so_far);
        }
    }
    return profit[k][n - 1];
}
// O(KN)
static int maxProfit(int price[], int n, int k) {
    int profit[][] = new int[k + 1][n + 1];
    for (int i = 0; i <= k; i++)
        profit[i][0] = 0;
    for (int j = 0; j <= n; j++)
        profit[0][j] = 0;
    for (int i = 1; i <= k; i++) {
        int prevDiff = Integer.MIN_VALUE;
        for (int j = 1; j < n; j++) {
            prevDiff = Math.max(prevDiff, profit[i - 1][j - 1] - price[j - 1]);
            profit[i][j] = Math.max(profit[i][j - 1], price[j] + prevDiff);
        }
    }
    return profit[k][n - 1];
}
// http://buttercola.blogspot.com/2015/08/leetcode-best-time-to-buy-and-sell.html
public int maxProfit(int k, int[] prices) {
    int[][] local = new int[prices.length][k + 1];
    int[][] global = new int[prices.length][k + 1];
    for (int i = 1; i < prices.length; i++) {
        int diff = prices[i] - prices[i - 1];
        for (int j = 1; j <= k; j++) {
            local[i][j] = Math.max(global[i - 1][j - 1] + Math.max(0, diff), local[i - 1][j] + diff);
            global[i][j] = Math.max(local[i][j], global[i - 1][j]);
        }
    }
    return global[prices.length - 1][k];
}
public int maxProfit(int k, int[] prices) {
    int[] local = new int[k + 1];
    int[] global = new int[k + 1];
    for (int i = 1; i < prices.length; i++) {
        int diff = prices[i] - prices[i - 1];
        for (int j = k; j > 0; j--) {
            local[j] = Math.max(global[j - 1] + Math.max(0, diff), local[j] + diff);
            global[j] = Math.max(local[j], global[j]);
        }
    }
    return global[k];
}

public int maxProfit(int k, int[] prices) {
    if(k>prices.length/2) return maxP(prices);
    int[][] hold = new int[prices.length][k+1];
    int[][] unhold = new int[prices.length][k+1];
    hold[0][0] = -prices[0];
    for(int i=1;i<prices.length;i++) hold[i][0] = Math.max(hold[i-1][0],-prices[i]);
    for(int j=1;j<=k;j++) hold[0][j] = -prices[0];
    for(int i=1;i<prices.length;i++){
        for(int j=1;j<=k;j++){
            hold[i][j] = Math.max(unhold[i-1][j]-prices[i],hold[i-1][j]);
            unhold[i][j] = Math.max(hold[i-1][j-1]+prices[i],unhold[i-1][j]);
        }
    }
    return Math.max(hold[prices.length-1][k],unhold[prices.length-1][k]);
}
```

- [LeetCode 309 - Best Time to Buy and Sell Stock with Cooldown](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/discuss/75927/Share-my-thinking-process)
  - [O(N^2) to O(N)](http://www.programmersought.com/article/3527176644/)
  - [buy/sell[i]](https://soulmachine.gitbooks.io/algorithm-essentials/java/dp/best-time-to-buy-and-sell-stock-with-cooldown.html)
```cpp
dp[i] = max(dp[i-1], dp[j-2] + (prices[i] - prices[j])), 0 < = j < i,
dp[j-2] + (prices[i] - prices[j]) =>  (dp[j-2] - prices[j]) + prices[i]
int maxProfit(vector<int>& prices) {
    if (prices.empty() || prices.size() == 1)
        return 0;
    int sz = prices.size();
    vector<int> dp(sz, 0);
    dp[1] = prices[1] > prices[0] ? prices[1] - prices[0] : 0;
    for (int i = 2; i < sz; ++i) {
        dp[i] = dp[i-1];
        for (int j = 0; j < i; ++j) {
            int temp = j-2 < 0 ? prices[i] - prices[j] : dp[j-2] + prices[i] - prices[j];
            if (temp > dp[i])
                dp[i] = temp;
        }
    }
    return dp.back();
}

int maxProfit(vector<int>& prices) {
    if (prices.empty() || prices.size() == 1)
        return 0;
    int sz = prices.size();
    vector<int> dp(sz, 0);
    dp[1] = prices[1] > prices[0] ? prices[1] - prices[0] : 0;
    int tempMax = max(-prices[0], -prices[1]);//tempMax = dp[j-2] - prices[j]
    for (int i = 2; i < sz; ++i) {
        tempMax = max(tempMax, dp[i-2] - prices[i]);
        dp[i] = max(dp[i-1], tempMax + prices[i]);
    }
    return dp.back();
}
```




### Min of 2 functions
- [LintCode 437 - Copy Books](https://www.jiuzhang.com/solutions/copy-books/)
  - [O(kn^2): dp[i][k] = Math.min(Math.max(dp[j][k - 1], sum[j, i]), loop over i, k, j = [i ~ 0])](https://github.com/awangdev/LintCode/blob/master/Java/Copy%20Books.java)
  - [TODO: O(NK)](https://chenlp.wordpress.com/2015/08/08/copy-books-lintcode/)
  - [bisection: O(nlg(sum))](https://www.jiuzhang.com/solutions/copy-books/)


- [LeetCode 514 - Freedom Trail](https://www.jianshu.com/p/65f633026a82)
  - [backward dp + condition: dp[0][0] + m: dp[i][j] = Math.min(dp[i][j], step + dp[i + 1][k] when ring[k]=key[i]](https://www.jianshu.com/p/65f633026a82)
  - [dp[i][j]: min total distance when correctly typed the first i letters in key and stopped at j-th position of the ring: min{dp[n - 1][j]}+m](https://github.com/lydxlx1/LeetCode/blob/master/src/_514.java)
  - [DP: O(mn)](https://leetcode.com/problems/freedom-trail/discuss/98900/O(RK)-time-DP-solution)
  - dfs + cache + index map
```Java
public int findRotateSteps(String ring, String key) {
	int n = ring.length();
	int m = key.length();
	int[][] dp = new int[m + 1][n];
	for (int i = m - 1; i >= 0; i--) {
		for (int j = 0; j < n; j++) {
			dp[i][j] = Integer.MAX_VALUE;
			for (int k = 0; k < n; k++) { // use index map
				if (ring.charAt(k) == key.charAt(i)) {
					int diff = Math.abs(j - k);
					int step = Math.min(diff, n - diff);
					dp[i][j] = Math.min(dp[i][j], step + dp[i + 1][k]);
				}
			}
		}
	}
	return dp[0][0] + m;
}
// dfs + cache + index map
public int findRotateSteps(String ring, String key) {
    if (ring == null)
        return 0;
    List<Integer>[] r = new List[26];
    for (int i = 0; i < 26; i++) {
        r[i] = new ArrayList<Integer>();
    }
    for (int i = 0; i < ring.length(); i++) {
        r[ring.charAt(i) - 'a'].add(i);
    }
    int[][] cache = new int[ring.length()][key.length()];
    return search(r, ring.length(), 0, key, 0, cache);
}

private int search(List<Integer>[] ring, int len, int p, String key, int index, int[][] cache) {
    if (index == key.length())
        return 0;
    if (cache[p][index] > 0)
        return cache[p][index];
    char c = key.charAt(index);
    List<Integer> indices = ring[c - 'a'];
    int min = Integer.MAX_VALUE;
    for (int i: indices) {
        int oneDir = Math.abs(p - i);
        int otherDir = len - oneDir;
        min = Math.min(min, 1 + Math.min(oneDir, otherDir) + search(ring, len, i, key, index + 1, cache));
    }
    cache[p][index] = min;
    return min;
}
```

### Track min (and second min) only
- O(NK^2) to O(NK)
- [LeetCode 265 - Paint House II](https://zhuhan0.blogspot.com/2017/08/265-paint-house-ii.html)
  - [O(NK^2): f[i][j] = min(f[i - 1][k] where k != j) + costs[i][j]]
  - [O(NK): track the min and second min](https://zhuhan0.blogspot.com/2017/08/265-paint-house-ii.html)
```Java
public int minCostII(int[][] costs) {
    int first = -1, second = -1;
    for (int i = 0; i < costs.length; i++) {
        int previous1 = first;
        int previous2 = second;
        first = -1;
        second = -1;
        for (int j = 0; j < costs[i].length; j++) {
            if (j == previous1) {
                costs[i][j] += previous2 < 0 ? 0 : costs[i - 1][previous2];
            } else {
                costs[i][j] += previous1 < 0 ? 0 : costs[i - 1][previous1];
            }
            if (first < 0 || costs[i][j] < costs[i][first]) {
                second = first;
                first = j;
            } else if (second < 0 || costs[i][j] < costs[i][second]) {
                second = j;
            }
        }
    }
    return costs[costs.length - 1][first];
}
```

### DP + binary search
- [Weighted Activity Selection Problem](http://www.zrzahid.com/weighted-jobinterval-scheduling-activity-selection-problem/)
  - [DP: O(N^2) LIS](https://www.geeksforgeeks.org/weighted-job-scheduling-set-2-using-lis/)
  - [DP with binary search](https://www.geeksforgeeks.org/weighted-job-scheduling-log-n-time/)
```Java
MAX_PROFIT(j) = max{wj+MAX_PROFIT(qj), MAX_PROFIT(j-1)}; // max of including and excluding
for j = 1 to n:
    qj = BST.floor(S[j].start)//binary search to find activity with finish time <= start time for j
    MAX_PROFIT[j] = MAX(MAX_PROFIT[j-1], MAX_PROFIT[qj] + w(j))
```

- [LeetCode 887 - Super Egg Drop](https://leetcode.com/articles/super-egg-drop/)
 - [O(K * N^2): dp[n][k] = min{ max(dp[i-1][k-1], dp[n-i][k]) + 1 } (1 <= i <= n)](https://leetcode.com/problems/super-egg-drop/discuss/159055/Java-DP-solution-from-O(KN2)-to-O(KNlogN))
 - [O(KNlogN): bisection for the min of two functions](https://leetcode.com/problems/super-egg-drop/discuss/159055/Java-DP-solution-from-O(KN2)-to-O(KNlogN))
   - <img src='https://leetcode.com/articles/Figures/891/sketch.png' />



- [POJ 1742 - Coins](https://blog.csdn.net/u014688145/article/details/71136194)
  <!-- 男人八题 有n种面额的硬币，面额个数分别为A_i、C_i，求最多能搭配出几种不超过m的金额 -->
  - [O(knm) boolean dp[i+1][j] |= dp[i][j-k*A[i]]](http://www.hankcs.com/program/cpp/poj-1742-coins.html)
    <!-- - dp[i][j] := 用前i种硬币能否凑成j -->
```java
dp[i][j] := 用前i种硬币凑成j时第i种硬币最多能剩余多少个（-1表示配不出来）
            如果dp[i - 1][j] >= 0(前i-1个数可以凑出j，那么第i个数根本用不着)直接为C[i]
dp[i][j] =  如果j < A[i]或者dp[i][j - a[i]] <=0 (面额太大或者在配更小的数的时候就用光了）-1
            其他（将第i个数用掉一个） dp[i][j-a[i]] - 1
```    
