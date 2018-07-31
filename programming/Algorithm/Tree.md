### Get extra data/info
- Child to parent map
- [Node to root path or distance](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/discuss/143752/JAVA-Graph-%2B-BFS)
- layer/level info
### Tree to Graph
- [LeetCode 863 - All Nodes Distance K in Binary Tree](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/discuss/143752/JAVA-Graph-%2B-BFS)
  - Create graph: Map<TreeNode, List<TreeNode>> map = new HashMap<>();
  - Clone and add Parent Node

### Without Tree Data Structure
- Map: parent -> children

- [LeetCode 582 - Kill Process](https://leetcode.com/articles/kill-process/)

### Prefer non-recursion version unless otherwise
- Easier to write, less error-prone
- Easier to reason its correctness
- [LeetCode 109 - Convert Sorted List to Balanced Binary Search Tree (BST)](https://leetcode.com/articles/convert-sorted-list-to-binary-search-tree)

### Examples
- [LeetCode 129 - Sum Root to Leaf Numbers](https://leetcode.com/problems/sum-root-to-leaf-numbers/discuss/41363/Short-Java-solution.-Recursion.)
```JAVA
return sum(root, 0);
public int sum(TreeNode n, int s){
  if (n == null) return 0;
  if (n.right == null && n.left == null) return s*10 + n.val;
  return sum(n.left, s*10 + n.val) + sum(n.right, s*10 + n.val);
}
```

