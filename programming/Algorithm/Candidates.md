- Store candidates in data structure like queue or stack

### Examples
- [LeetCode 169 - Majority Number I]
  - [Boyer-Moore Voting](https://leetcode.com/problems/majority-element/discuss/51613/on-time-o1-space-fastest-solution)
  - [32n - bit count](https://leetcode.com/problems/majority-element/discuss/51649/Share-my-solution-Java-Count-bits)
  - [Divide and Conquer](https://zxi.mytechroad.com/blog/divide-and-conquer/leetcode-169-majority-element/)
```java
int majorityElement(vector<int> &num) {
    int majorityIndex = 0;
    for (int count = 1, i = 1; i < num.size(); i++) {
        num[majorityIndex] == num[i] ? count++ : count--;
        if (count == 0) {
            majorityIndex = i;
            count = 1;
        }
    }        
    return num[majorityIndex];
}
```


- [LeetCode 919 - Complete Binary Tree Inserter](https://leetcode.com/problems/complete-binary-tree-inserter/discuss/178427/Java-BFS-straightforward-code-two-methods-Initialization-and-insert-time-O(1)-respectively.)
  - [candidates in queue](https://leetcode.com/problems/complete-binary-tree-inserter/discuss/178427/Java-BFS-straightforward-code-two-methods-Initialization-and-insert-time-O(1)-respectively.)
  - [Store all in LinkedList](https://leetcode.com/problems/complete-binary-tree-inserter/discuss/178424/C++JavaPython-O%281%29-Insert)
```java
private TreeNode root;
private Queue<TreeNode> queue;

//O(N) build tree: Find the first node which doesn't have both left and right child.
public CBTInserter(TreeNode root) {
  this.root = root;
  queue = new LinkedList<>();
  queue.offer(root);
  while (true) {
    TreeNode cur = queue.peek();
    if (cur.left != null && cur.right != null) {
      queue.offer(cur.left);
      queue.offer(cur.right);
      queue.poll();
    } else {
      break;
    }
  }
}

public int insert(int v) {
  TreeNode cur = queue.peek();
  if (cur.left == null) {
    cur.left = new TreeNode(v);
  } else {
    cur.right = new TreeNode(v);
    queue.offer(cur.left);
    queue.offer(cur.right);
    queue.poll();
  }
  return cur.val;
}
```

- [LeetCode 871 - Minimum Number of Refueling Stops](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/149867/Simple-Java-using-pq-with-explanation)
  - [Greedy + PQ, curFarthest: O(NlogN)](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/149867/Simple-Java-using-pq-with-explanation)
    - Use PQ to store potential refuel stations
  - [DP: variables/states: station, refuel stops](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/151850/C%2B%2B-DP-solution-Space-complexity-from-O(n2)-to-O(n).)
    - dp[i][j] the farthest location we can get to using exactly j refueling stops among the first i refueling stops for j<i; dp[i][j] = max(dp[i][j], dp[i-1][j-1] + stations[i][1], dp[i-1][j])
    - [reduce space: dp[t] means the furthest distance that we can get with t times of refueling](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/149839/DP-O(N2)-and-Priority-Queue-O(NlogN))


