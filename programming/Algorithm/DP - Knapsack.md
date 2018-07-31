## [Knapsack](http://massivealgorithms.blogspot.com/2015/06/lintcode-backpack-ii-neverlandly.html)
### 0-1 Knapsack
- 有 N 件物品和一个容量为 V 的背包。放入第 i 件物品耗费的费用是 Ci1，得到的价值是 Wi。求解将哪些物品装入背包可使价值总和最大
- c[i]表示第i个物品的价值。w[i]为第i个物品的大小
- f[i][v] = max(f[i-1][v], f[i-1][v-w[i]]+c[i]);
- 
```java
for(i=1; i<=N; i++)
  for(j=V; j>=w[i]; j--)
    f[j] = max(f[j-w[i]]+c[i], f[j]);
void ZeroOnePack(int cost, int weight){
    for(int i=V; i>=weight; i++)
        f[i] = max(f[i], f[i-weight]+cost)
}
```

### [Complete Knapsack 完全背包](https://blue2048.iteye.com/blog/2152688)
- 和01背包相似，所不同的是可取的物品数是无限
- f[i][v]=max(f[i-1][v], f[i][v-w[i]]+c[i])
```java
for(int i=1; i<=N; i++)
    for(int j=w[i]; j<=V; j++)
        f[j] = max{f[v], f[v-w[i]]+c[i]};
void CompletePack(int cost, int weight){
    for(int i=weight; i<=V; i++)
        f[i] = max(f[i], f[i-weight]+cost);
}
```
- [POJ 3181 - Dollar Dayz](https://blog.csdn.net/u014688145/article/details/71136194)
```text
dp[i][j] = dp[i-1][j] + dp[i-1][j-i] + dp[i-1][j-2*i] + ... + dp[i-1][0];
dp[i][j-i] = dp[i-1][j-i] + dp[i-1][j-2*i] + dp[i-1][j-3*i] + ... + dp[i-1][0];
dp[i][j] = dp[i-1][j] + dp[i][j-i];
```

### Multiple Knapsack 多重背包
- 每件物品数量不一定为1但有限
- 有N 种物品和一个容量为V 的背包。第i 种物品最多有Mi 件可用，每件耗费的空间是Ci，价值是Wi。求解将哪些物品装入背包可使这些物品的耗费的空间总和不超过背包容量，且价值总和最大。
- f[i][v]=max{f[i-1][v-k*c[i]]+k*w[I]}(0<=k<=n[I]) -> O(V*Σn[i])
- [二进制拆分](http://www.ahathinking.com/archives/109.html): O(nwlog(m)) 
```java
void MultiplePack(int weight, int cost, int amount){
    if(cost * amount >= V){ //如果第i种物品的费用总和超过背包容量，那么就是完全背包问题
        CompletePack(cost, weight);
        return;
    }
    int k = 1;
    while(k < num){// num 为物品种数
        ZeroOnePack(k*cost, k*weight);
        amount = amount-k;
        k *= 2;
    }
    ZeroOnePack(amount*cost, amount*weight);
}
```

### 混合三种背包
### 二维费用的背包问题
- dp[i][j][k]  前i件物品付出两种代价为j和k的最大价值
- dp[i][j][k] = max(dp[i-1][j][k],dp[i-1][j-a[i]][k-b[i]])

### 分组的背包
- 有N 件物品和一个容量为V 的背包。第i 件物品的费用是Ci，价值是Wi。这些物品被划分为K 组，每组中的物品互相冲突，最多选一件。求解将哪些物品装入背包可使这些物品的费用总和不超过背包容量，且价值总和最大。
- f[k][v]=max{f[k-1][v],f[k-1][v-c[i]]+w[i]|物品i属于组k}
```java
// dp[k][v] 表示前k组物品花费容量v能取到的最大值
for(i=1; i<=k; ++i) // for 所有的组k
   for(j=v;j>=0; --j)
       for(所有的l属于组k)
           if(j>=c[i])
               dp[i][j] = max(dp[i-1][j],dp[i-1][j-c[i]]+w[i]);
```

#### DP - Subset Sum
- [LeetCode 416 - Partition Equal Subset Sum](https://leetcode.com/problems/partition-equal-subset-sum/discuss/90592/01-knapsack-detailed-explanation)
  - boolean dp[i][j] = dp[i-1][j] || dp[i-1][j-nums[i]]
  - reduce space: order matters
- [3-partition problem](https://www.techiedelight.com/3-partition-problem/)
- [LeetCode 494 - Target Sum: choose one from + and -](https://leetcode.com/problems/target-sum/discuss/97335/Short-Java-DP-Solution-with-Explanation)
  - because dp's range starts from -sum --> 0 --> +sum, so we need to add sum first, then the total starts from 0, then we add S
  - int[] dp = new int[2*sum+1]; return dp[sum+s];
  - [dfs + cache: map.containsKey(index + "->" + sum)](https://leetcode.com/problems/target-sum/discuss/97333/Java-simple-DFS-with-memorization)
  - [dp[i][j]=dp[i−1][j−a[i]]+dp[i−1][j+a[i]]](http://www.cnblogs.com/grandyang/p/6395843.html)
  - [dp with map](https://leetcode.com/problems/target-sum/discuss/223661/Using-Map-java-Dp-solution)
  - [subset sum: dp[j] += dp[j - nums[i]]](https://kingsfish.github.io/2017/08/22/Leetcode-494-Target-Sum/)
```java
public int findTargetSumWays(int[] nums, int S) {
    int sum = 0;
    for (int i = 0; i < nums.length; i ++){
        sum += nums[i];
    }
    if (S > sum || (S + sum) % 2 != 0){
        return 0;
    }
    sum = (S + sum) / 2;
    int [] dp = new int[sum + 1];
    dp[0] = 1;
    for (int i = 0; i < nums.length; i ++){
        for (int j = sum; j >= nums[i]; j --){
            dp[j] += dp[j - nums[i]];
        }
    }
    return dp[sum];
}
```

### Examples
- Lintcode: Backpack I,II,III,IV,V
- [LeetCode 377 - Combination Sum IV](http://www.cnblogs.com/grandyang/p/5705750.html)
  - [pre-sort to prune](http://www.cnblogs.com/grandyang/p/5705750.html)
- [LeetCode 518 - Coin Change 2: the number of combinations that make up that amount](https://leetcode.com/problems/coin-change-2/discuss/99212/knapsack-problem-java-solution-with-thinking-process-onm-time-and-om-space)
  - dp[i][j] : the number of combinations to make up amount j by using the first i types of coins
  - exclude the ith coin
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

- [LeetCode 474 - Ones and Zeroes]
  - [dp[i][j][k] means the maximum number of strings we can get from the first i argument strs using limited j number of '0's and k number of '1's](https://leetcode.com/problems/ones-and-zeroes/discuss/95807/0-1-knapsack-detailed-explanation.)
  - dp[i][j][k] = Math.max(dp[i-1][j][k], dp[i-1][j-nums[0]][k-nums[1]]+1{use ith element});

