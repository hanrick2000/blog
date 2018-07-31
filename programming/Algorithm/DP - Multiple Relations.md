### Multiple DP Relations
- different actions/states: buy or sell

- [LeetCode 714 - Best Time to Buy and Sell Stock with Transaction Fee](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/discuss/108871/2-solutions-2-states-DP-solutions-clear-explanation!)
  - [buy[i] represents the max profit at day i in buy status; sell[i] represents the max profit at day i in sell status](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/discuss/108871/2-solutions-2-states-DP-solutions-clear-explanation!)
    - buy[i] = Math.max(buy[i - 1], sell[i - 1] - prices[i]);
    - sell[i] = Math.max(sell[i - 1], buy[i - 1] + prices[i]);
    - we can pay the fee when buy or sell the stock

- [LeetCode 552 - Student Attendance Record II](https://leetcode.com/problems/student-attendance-record-ii/discuss/101643/share-my-on-c-dp-solution-with-thinking-process-and-explanation)
  - [dp arrays: P[i], L[i], A[i] ending with P/L/A](https://leetcode.com/problems/student-attendance-record-ii/discuss/101643/share-my-on-c-dp-solution-with-thinking-process-and-explanation)
  - [f[i][j][k] denote the # of valid sequences of length i where: at most j A's in the entire sequence, at most k trailing L's](https://leetcode.com/problems/student-attendance-record-ii/discuss/101633/Improving-the-runtime-from-O(n)-to-O(log-n))
```text
A[i] = P1[i-1] + L1[i-1]
P1[i] = P1[i-1] + L1[i-1]
L1[i] = P1[i-1] + P1[i-2]
=>
A[i] = A[i-1] + A[i-2] + A[i-3]
```

- [LeetCode 96 - Unique Binary Search Trees I](https://leetcode.com/problems/unique-binary-search-trees/discuss/31666/DP-Solution-in-6-lines-with-explanation.-F(i-n)-G(i-1)-\*-G(n-i))
  - G(n): the number of unique BST for a sequence of length n.
  - F(i, n), 1 <= i <= n: the number of unique BST, where the number i is the root of BST, and the sequence ranges from 1 to n.
  - F(i, n) = G(i-1) * G(n-i)
  - G(n) = F(1, n) + F(2, n) + ... + F(n, n) = G(0) * G(n-1) + G(1) * G(n-2) + … + G(n-1) * G(0)
  - [Catalan number]


### Different cases -> different functions -> merge/simplify
- [LeetCode 276 - Fence Painter: the number of ways you can paint a fence with N posts using K colors such that no more than 2 adjacent fence posts are painted with the same color](https://baihuqian.github.io/2018-07-29-paint-fence/)
  - paint same color with the previous post: k*1 ways to paint
  - paint differently with the previous post: k*(k-1) ways to paint this way
```java
D(n) = (k - 1) * (S(n-1) + D(n-1))
S(n) = D(n-1)
T(n) = S(n) + D(n)
=> T(n) = (k - 1) * (T(n-1) + T(n-2)), n > 2
T(n) = (k - 1) * (T(n-1) + T(n-2)), n > 2
T(n) = same * (k - 1) + diff * (k - 1) = (same + diff) * (k - 1)
```


### Merge multiple relations to reduce numbers of relations or simplify
- [LeetCode 309 - Best Time to Buy and Sell Stock with Cooldown](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/discuss/75927/Share-my-thinking-process)
  - [O(N^2) to O(N)](http://www.programmersought.com/article/3527176644/)
  - [buy/sell[i]](https://soulmachine.gitbooks.io/algorithm-essentials/java/dp/best-time-to-buy-and-sell-stock-with-cooldown.html)
```Java
buy[i] means before day i what is the maxProfit for any sequence end with buy.
sell[i] means before day i what is the maxProfit for any sequence end with sell.
rest[i] means before day i what is the maxProfit for any sequence end with rest.
buy[i]  = max(rest[i-1]-price, buy[i-1]) 
sell[i] = max(buy[i-1]+price, sell[i-1])
rest[i] = max(sell[i-1], buy[i-1], rest[i-1]) = sell[i-1] (because buy[i] <= rest[i] <= sell[i])
=>
buy[i] = max(sell[i-2]-price, buy[i-1])
sell[i] = max(buy[i-1]+price, sell[i-1])
```


### Examples
- [LeetCode 474 - Ones and Zeroes]
  - dp(k, x, y) is the maximum strs we can include when we have x zeros, y ones and only the first k strs are considered.
  - dp(k, x, y) = max(dp(k-1, x-z, y-o) + 1, dp(k-1, x, y))   (z is zeroes in strs[k], o is ones in strs[k])
