### Reverse Traversal

- [LeetCode 971 - Flip Binary Tree To Match Preorder Traversal](https://leetcode.com/problems/flip-binary-tree-to-match-preorder-traversal/discuss/214216/JavaC%2B%2BPython-DFS-Solution)
  - [return passed index](https://leetcode.com/problems/flip-binary-tree-to-match-preorder-traversal/discuss/214219/Java-DFS-try-the-only-way)
```java
public boolean dfs(TreeNode node, int[] v) {
    if (node == null) return true;
    if (node.val != v[i++]) return false;
    if (node.left != null && node.left.val != v[i]) {
        res.add(node.val);
        return dfs(node.right, v) && dfs(node.left, v);
    }
    return dfs(node.left, v) && dfs(node.right, v);
}
```








