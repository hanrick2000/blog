### [DP - Tree](https://www.commonlounge.com/discussion/8573ee40c4cb4673824c867715a5bc7b)
- DFS + cache on Tree
- post-order traversal
- track parent node
- isParentTaken
- Use Map<TreeNode, State> dp as cache, or return State with results for different cases
  - [Google – Binary Tree Maximum Path Without Consecutive Nodes]
- [](https://leetcode.com/problems/house-robber-iii/discuss/79330/Step-by-step-tackling-of-the-problem)
- dp[node_number][state]: 0/1 for chosen or not chosen, the result: max{dp[0][state]}


### DP - Tree
- [LeetCode 823 - Binary Trees With Factors]()
  - dp[i] be the number of ways to have a root node with value A[i]
```java
public int numFactoredBinarydps(int[] A) {
    long res = 0L, mod = (long) Math.pow(10, 9) + 7;
    Arrays.sort(A);
    HashMap<Integer, Long> dp = new HashMap<>();
    for (int i = 0; i < A.length; ++i) {
        dp.put(A[i], 1L);
        for (int j = 0; j < i; ++j)
            if (A[i] % A[j] == 0 && dp.containsKey(A[i] / A[j]))
                dp.put(A[i], (dp.get(A[i]) + dp.get(A[j]) * dp.get(A[i] / A[j])) % mod);
    }
    for (long v : dp.values()) res = (res + v) % mod;
    return (int) res;
}
```

### child-parent-child
- only

### Return different values from answer
- [LeetCode 543 - Diameter of a Binary Tree](https://leetcode.com/articles/diameter-of-binary-tree/)
  - child-parent-child
```Java
int ans;
public int diameterOfBinaryTree(TreeNode root) {
    ans = 1;
    depth(root);
    return ans - 1;
}
public int depth(TreeNode node) {
    if (node == null) return 0;
    int L = depth(node.left);
    int R = depth(node.right);
    ans = Math.max(ans, L+R+1);
    return Math.max(L, R) + 1;
}
```

- [LeetCode 110 - Balanced Binary Tree](https://www.jiuzhang.com/solutions/balanced-binary-tree/)
  - ResultType: {isBalanced, maxDepth}
  - not necessary better
```Java
public boolean isBalanced(TreeNode root) {
    return maxDepth(root) != -1;
}
private int maxDepth(TreeNode root) {
    if (root == null) {
        return 0;
    }
    int left = maxDepth(root.left);
    int right = maxDepth(root.right);
    if (left == -1 || right == -1 || Math.abs(left-right) > 1) {
        return -1;
    }
    return Math.max(left, right) + 1;
}
```

### Return multiple values for different cases/states
- [LeetCode 373 - House Robber III](https://leetcode.com/problems/house-robber-iii/discuss/79330/Step-by-step-tackling-of-the-problem)
  - [dfs + cache](https://leetcode.com/problems/house-robber-iii/discuss/79330/Step-by-step-tackling-of-the-problem)
  - return pair: [0] is when root is selected, [1] is when not
```java
public int[] helper(TreeNode root){
    if(root == null){
        int[] result = {0, 0};
        return result;
    }
    int[] result = new int[2];
    int[] left = helper(root.left);
    int[] right = helper (root.right);
    // result[0] is when root is selected, result[1] is when not. 
    result[0] = root.val + left[1] + right[1];
    result[1] = Math.max(left[0], left[1]) + Math.max(right[0], right[1]);
    return result;
}
```

- [HARD LeetCode 968 -  Binary Tree Cameras](https://leetcode.com/articles/binary-tree-cameras/)
  - [greedy](https://leetcode.com/problems/binary-tree-cameras/discuss/211180/JavaC%2B%2BPython-Greedy-DFS)
```java
public int minCameraCover(TreeNode root) {
  int[] ans = solve(root);
  return Math.min(ans[1], ans[2]);
}
// 0: Strict ST; All nodes below this are covered, but not this one
// 1: Normal ST; All nodes below and incl this are covered - no camera
// 2: Placed camera; All nodes below this are covered, plus camera here
public int[] solve(TreeNode node) {
  if (node == null)
    return new int[] { 0, 0, 99999 };
  int[] L = solve(node.left);
  int[] R = solve(node.right);
  int mL12 = Math.min(L[1], L[2]);
  int mR12 = Math.min(R[1], R[2]);
  int d0 = L[1] + R[1];
  int d1 = Math.min(L[2] + mR12, R[2] + mL12);
  int d2 = 1 + Math.min(L[0], mL12) + Math.min(R[0], mR12);
  return new int[] { d0, d1, d2 };
}
```

- [LeetCode 549 - Binary Tree Longest Consecutive Sequence II: include child-Parent-child order](https://www.jianshu.com/p/571b93217ee3)
  - [post-order traversal + return result:{inc, dec}; anwser=max{dec+inc-1}](https://www.jianshu.com/p/571b93217ee3)


## DP - Trie
- variables: level in the trie
- create a new dp cache in every level
- [LintCode 623 - K EDIT DISTANCE: output all the strings for each the edit distance with the target no greater than k](http://ninefu.github.io/blog/KEditDistance/)
  - [O(n*26^L)](https://www.jiuzhang.com/qa/9656/)
  - <https://github.com/chendddong/LintCode/blob/master/623.%20K%20Edit%20Distance.java>
  <!-- - dp[i] 表示从Trie的root节点走到当前node节点，形成的Prefix和 target的前i个字符的最小编辑距离 -->
```java
public List<String> kDistance(String[] words, String target, int k) {
    TrieNode root = new TrieNode(); /* Need a virtual root */
    for (int i = 0; i < words.length; i++)
        TrieNode.addWord(root, words[i]); /* Add words to the Trie */
    List<String> result = new ArrayList<String>();
    int n = target.length();
    /*
     * State: dp[i] means walking down the trie from the virtual root to the current node, the
     * min edit distance between the formed prefix and the target's 0 to ith characters.
     */
    int[] dp = new int[n + 1];
    for (int i = 0; i <= n; ++i)
        dp[i] = i;
    find(root, result, k, target, dp);
    return result;
}
public void find(TrieNode node, List<String> result, int k, String target, int[] dp) {
    int n = target.length();
    if (node.hasWord && dp[n] <= k) { /* Where the answer satisfies */
        result.add(node.str);
    }
    /* Each search we need to create a new dp */
    int[] next = new int[n + 1];
    for (int i = 0; i <= n; ++i)
        next[i] = 0;
    for (int i = 0; i < 26; ++i) /* 26 Characters */
        if (node.children[i] != null) {
            next[0] = dp[0] + 1; /* Init */
            for (int j = 1; j <= n; j++) {
                if (target.charAt(j - 1) - 'a' == i) { /* Matches */
                    next[j] = Math.min(dp[j - 1], Math.min(next[j - 1] + 1,
                            dp[j] + 1)); /* Check two j - 1 check one dp j */
                } else { /* Does not match */
                    next[j] = Math.min(dp[j - 1] + 1, Math.min(next[j - 1] + 1, dp[j] + 1));
                    /* Check two j - 1 check one dp j */
                }
            }
            find(node.children[i], result, k, target, next);
        }
}
```
- [LeetCode 139 - Word Break](https://leetcode.com/problems/word-break/discuss/43790/Java-implementation-using-DP-in-two-ways)
  - [dp on trie to avoid substring or stringbuilder to string](https://leetcode.com/problems/word-break/discuss/43790/java-implementation-using-dp-in-two-ways/43002)
  - [O(n^2) or O(n*dictSize)](https://www.cnblogs.com/lightwindy/p/8509053.html)
  - [bfs](https://leetcode.com/problems/word-break/discuss/43797/A-solution-using-BFS)
```java
public boolean wordBreak(String s, Set<String> wordDict) {
    TrieNode t = new TrieNode(), cur;
    for (String i : wordDict) addWord(t, i);
    char[] str = s.toCharArray();
    int len = str.length;
    boolean[] f = new boolean[len + 1];
    f[len] = true;
    for (int i = len - 1; i >= 0; i--) {
        cur = t;
        for (int j = i; cur != null && j < len ; j++) {
            cur = cur.c[(int)str[j]];
            if (cur != null && cur.isWord && f[j + 1]) {
                f[i] = true;
                break;
            }
        }
    }
    return f[0];
}
```