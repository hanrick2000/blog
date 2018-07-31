### DP - Local + Global Functions
- local dp: the result when must include element i
- usually we can just use one variable for the local dp

### Local (Global) Min/Max
- LeetCode 53 - Maximum Subarray
  - [dp: maxSubArray(A, i) = maxSubArray(A, i - 1) > 0 ? maxSubArray(A, i - 1) : 0 + A[i]](https://leetcode.com/problems/maximum-subarray/discuss/20193/dp-solution-some-thoughts)
- [LeetCode 122 - Best Time to Buy and Sell Stock II: complete as many transactions as you like](https://leetcode.com/articles/best-time-to-buy-and-sell-stock-ii/)
  - Find local Min/Max
  - a[i]-a[j]=sum(a[k+1]-a[k]) i<=K<=j
```java
public int maxProfit(int[] prices) {
    int profit = 0, i = 0;
    while (i < prices.length) {
        // find next local minimum
        while (i < prices.length-1 && prices[i+1] <= prices[i]) i++;
        int min = prices[i++]; // need increment to avoid infinite loop for "[1]"
        // find next local maximum
        while (i < prices.length-1 && prices[i+1] >= prices[i]) i++;
        profit += i < prices.length ? prices[i++] - min : 0;
    }
    return profit;
}
```
- [LeetCode 714 - Best Time to Buy and Sell Stock with Transaction Fee](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/discuss/116117/Python-greedy-solution-with-a-little-trick-(beats-98)-O(n)-time-O(1)-space)
  - [dp](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/discuss/108871/2-solutions-2-states-DP-solutions-clear-explanation!)
  - [greedy + local min/max](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/discuss/116117/Python-greedy-solution-with-a-little-trick-(beats-98)-O(n)-time-O(1)-space)
```python
buy[i] = Math.max(buy[i - 1], sell[i - 1] - prices[i]);
sell[i] = Math.max(sell[i - 1], buy[i - 1] + prices[i]);
def maxProfit(self, prices, fee):
  buy = prices[0]
  res = 0
  for p in prices:
      if buy > p: # current price is less than last buy
          buy = p # buy at p
      else:
          tmp = p - buy - fee
          if tmp > 0: # have profit
              res += tmp
              buy = p - fee 
  return res
```

- [LintCode 43 - Maximum Subarray III: find k non-overlapping subarrays which have the largest sum](https://www.jiuzhang.com/solution/maximum-subarray-iii/)
  - [O(KN^2): d[i][j] means the maximum sum we can get by selecting j subarrays from the first i elements](https://wxx5433.gitbooks.io/interview-preparation/content/part_ii_leetcode_lintcode/dp/maximum_subarray_iii.html)
    - d[i][j] = max{d[p][j-1]+maxSubArray(p+1,i)} j-1 <= p <= i-1
  - [O(KN) local[i][k] = max(global[i-1][k-1], local[i-1][k]) + nums[i-1], global[i][k] = max(global[i-1][k]，local[i][k])](https://zhengyang2015.gitbooks.io/lintcode/maximum_subarray_iii_43.html)
  - [local + global dp: without local dp array](https://blog.csdn.net/gqk289/article/details/70146480)
    - [localMax[i][k] = max(localMax[i - 1][k] + nums[i - 1], globalMax[i - 1][k - 1] + nums[i - 1]); globalMax[i][k] = max(globalMax[i - 1][k], localMax[i][k])](http://hehejun.blogspot.com/2015/01/lintcodemaximum-subarray-iii.html)
<!-- 
https://zhengyang2015.gitbooks.io/lintcode/maximum_subarray_iii_43.html
local[i][k]表示前i个元素取k个子数组并且必须包含第i个元素的最大和。
global[i][k]表示前i个元素取k个子数组不一定包含第i个元素的最大和。
local[i][k]的状态函数： max(global[i-1][k-1], local[i-1][k]) + nums[i-1]
有两种情况，第一种是第i个元素自己组成一个子数组，则要在前i－1个元素中找k－1个子数组，第二种情况是第i个元素属于前一个元素的子数组，因此要在i－1个元素中找k个子数组（并且必须包含第i－1个元素，这样第i个元素才能合并到最后一个子数组中），取两种情况里面大的那个.

global[i][k]的状态函数：
max(global[i-1][k]，local[i][k])
有两种情况，第一种是不包含第i个元素，所以要在前i－1个元素中找k个子数组，第二种情况为包含第i个元素，在i个元素中找k个子数组且必须包含第i个元素，取两种情况里面大的那个
 -->

```java
public int maxSubArray(ArrayList<Integer> nums, int k) {  
    int n = nums.size();  
    int[][] d = new int[n+1][k+1];  
    for (int j = 1; j <= k; j++) {  
        for (int i = j; i <= n; i++) {  
            d[i][j] = Integer.MIN_VALUE;  
            int max = Integer.MIN_VALUE;  
            int localMax = 0;  
            for (int m = i-1; m >= j-1; m--) {  
                localMax = Math.max(nums.get(m), nums.get(m)+localMax);  
                max = Math.max(localMax, max);  
                d[i][j] = Math.max(d[i][j], d[m][j-1] + max);  
            }  
        }  
    }  
    return d[n][k];  
}
public int maxSubArray(int[] nums, int k) {
    int len = nums.length;
    //local[i][k]: the max sum when split first i elements into k arrays and must include ith element
    int[][] localMax = new int[len + 1][k + 1];
    //global[i][k] the max sum when split first i elements into k arrays    
    int[][] globalMax = new int[len + 1][k + 1];
    for(int j = 1; j <= k; j++){
        localMax[j - 1][j] = Integer.MIN_VALUE;
        for(int i = j; i <= len; i++){
            localMax[i][j] = Math.max(globalMax[i - 1][j - 1], localMax[i - 1][j]) + nums[i - 1];
            if(i == j){
                globalMax[i][j] = localMax[i][j];
            }else{
                globalMax[i][j] = Math.max(globalMax[i - 1][j], localMax[i][j]);
            }
        }
    }
    return globalMax[len][k];
}
public int maxSubArray(int[] nums, int k) {
  int[][] dp = new int[k + 1][nums.length + 1];
  for (int i = 1; i <= k; i++) {
    int local = Integer.MIN_VALUE;
    for (int j = i; j <= nums.length; j++) {
      local = Math.max(local, dp[i - 1][j - 1]) + nums[j - 1];
      if (j == i) {
        dp[i][j] = local;
      } else {
        dp[i][j] = Math.max(local, dp[i][j - 1]);
      }
    }
  }
  return dp[k][nums.length];
}
```