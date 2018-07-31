
- [LeetCode 538 - Convert BST to Greater Tree](https://leetcode.com/problems/convert-bst-to-greater-tree/discuss/100506/Java-Recursive-O(n)-time)
  - reverse inorder traversal
```java
TreeNode prev;
public TreeNode convertBST(TreeNode root) {
  if (root == null)
    return null;
  convertBST(root.right);
  root.val += prev == null ? 0 : prev.val;
  prev = root;
  convertBST(root.left);
  return root;
}
```







