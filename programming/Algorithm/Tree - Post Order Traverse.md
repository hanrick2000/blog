### Post Order Traverse
- what we need to return to our caller/parent node
- when handle parent node, children are already handled
- related with divide and conquer, merge sort
- preorder traverse can be faster than post order; as it can exit early

#### Path may not pass through the root
- return value for single path
- maintain max value across the node
- [LeetCode 687 - Longest Univalue Path](https://leetcode.com/problems/longest-univalue-path/discuss/108136/JavaC%2B%2B-Clean-Code)
  - [local + global max](https://medium.com/@rebeccahezhang/leetcode-687-longest-univalue-path-c7791a03c4a0)
  - return local max: Longest Univalue Path for single path
- [Find the maximum path sum between two leaves of a binary tree](https://www.geeksforgeeks.org/find-maximum-path-sum-two-leaves-binary-tree/)

#### Simple

- [LeetCode 814 - Binary Tree Pruning](https://leetcode.com/articles/binary-tree-pruning/)
  - [alternative](https://leetcode.com/problems/binary-tree-pruning/discuss/122747/Java-4-lines-Solution-using-Recursion)

- [LeetCode 663 - Equal Tree Partition](http://blog.csdn.net/TheSnowBoy_2/article/details/77448762)
- [LeetCode 366 - Find Leaves of Binary Tree](http://www.programcreek.com/2014/07/leetcode-find-leaves-of-binary-tree-java/)

- [Check if a given Binary Tree is SumTree](https://www.techiedelight.com/check-given-binary-tree-sum-tree-not/)
- [LeetCode 333 - Largest BST Subtree](http://buttercola.blogspot.com/2016/02/leetcode-largest-bst-subtree.html)
- [Print ancestors of a given binary tree node](https://www.geeksforgeeks.org/print-ancestors-of-a-given-node-in-binary-tree/)

- [LeetCode 298 - Binary Tree Longest Consecutive Sequence: from parent to child](https://github.com/YaokaiYang-assaultmaster/LeetCode/blob/master/LeetcodeAlgorithmQuestions/298.%20Binary%20Tree%20Longest%20Consecutive%20Sequence.md)
- [LeetCode 549 - Binary Tree Longest Consecutive Sequence II: include child-Parent-child order](https://www.jianshu.com/p/571b93217ee3)
  - [Result:{inc, dec, node}](https://www.jianshu.com/p/571b93217ee3)


- [LeetCode 652 - Find Duplicate Subtrees](https://leetcode.com/articles/find-duplicate-subtrees/)
  - [Use unique identifier to reduce time complexity](https://leetcode.com/articles/find-duplicate-subtrees/)
  - [long key = ((long)root.val) << 32 | getId(root.left) << 16 | getId(root.right);](https://zxi.mytechroad.com/blog/tree/leetcode-652-find-duplicate-subtrees/)
```java
Map<String, Integer> count;
List<TreeNode> ans;
public List<TreeNode> findDuplicateSubtrees(TreeNode root) {
    count = new HashMap();
    ans = new ArrayList();
    collect(root);
    return ans;
}
public String collect(TreeNode node) {
    if (node == null) return "#";
    String serial = node.val + "," + collect(node.left) + "," + collect(node.right);
    count.put(serial, count.getOrDefault(serial, 0) + 1);
    if (count.get(serial) == 2)
        ans.add(node);
    return serial;
}
```

- [LeetCode 979 - Distribute Coins in Binary Tree](https://leetcode.com/problems/distribute-coins-in-binary-tree/discuss/221939/C%2B%2B-with-picture-post-order-traversal)
```java
public int dfs(TreeNode node) {
  if (node == null)
    return 0;
  int L = dfs(node.left);
  int R = dfs(node.right);
  ans += Math.abs(L) + Math.abs(R);
  return node.val + L + R - 1;
}
```
- [LeetCode 236 - Lowest Common Ancestor in a Binary Tree](http://rainykat.blogspot.com/2017/01/leetcode-236-lowest-common-ancestor-of.html)
```Java
public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    if (root == null || root == p || root == q)
        return root;
    TreeNode leftN = lowestCommonAncestor(root.left, p, q);
    TreeNode rightN = lowestCommonAncestor(root.right, p, q);
    if (leftN != null && rightN != null)
        return root;// case:left is p/q and right is q/p root is LCA
    if (leftN == null)
        return rightN;// case: p,q both in right subtree, right is LCA
    return leftN;// case: both in left, left is LCA
}
```

- [LeetCode 114 - Flatten Binary Tree to Linked List: pre-order](https://www.jiuzhang.com/solutions/flatten-binary-tree-to-linked-list/)
  - [post-order](http://fisherlei.blogspot.com/2012/12/leetcode-flatten-binary-tree-to-linked.html)
  - save all nodes into a list then link them
```java
// post-order, return tail
TreeNode flatten(TreeNode root) {
  if (root == null)
    return null;

  TreeNode leftTail = flatten(root.left);
  TreeNode rightTail = flatten(root.right);

  if (root.left != null) {
    TreeNode temp = root.right;
    root.right = root.left;
    root.left = null;
    leftTail.right = temp;
  }
  if (rightTail != null)
    return rightTail;
  if (leftTail != null)
    return leftTail;
  return root;
}
```

- [LeetCode 236 - Lowest Common Ancestor of a Binary Tree](https://github.com/mintycc/OnlineJudge-Solutions/blob/master/Leetcode/236_Lowest_Common_Ancestor_of_a_Binary_Tree.java)
```java
TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
   if (!root || p == root || q == root) return root;
   TreeNode left = lowestCommonAncestor(root->left, p, q);
   if (left!=null && left != p && left != q) return left; // optimize
   TreeNode right = lowestCommonAncestor(root->right, p , q);
　　　　if (left && right) return root;
   return left ? left : right;
}
```

- [LeetCode 543 - Diameter of a Binary Tree](https://leetcode.com/articles/diameter-of-binary-tree/)
  - [General tree](https://github.com/mintycc/OnlineJudge-Solutions/blob/master/untag/Diameter%20of%20General%20Tree/DiameterOfTree.java)
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
// General tree
public int findDiameter(TreeNode root) {
    if (root == null) return 0;
    helper(root);
    return diameter;
}
int diameter = Integer.MIN_VALUE;
private int helper(TreeNode root) {
    int a = Integer.MIN_VALUE;
    int b = Integer.MIN_VALUE;
    for (TreeNode child : root.children) {
        if (child == null) continue;
        int tmp = helper(child);
        if (tmp > a) { b = a; a = tmp;}
        else if (tmp > b) b = tmp;
    }

    if (b >= 0) diameter = Math.max(diameter, a + b + 2);
    if (a >= 0) {
        diameter = Math.max(diameter, a + 1);
        return a + 1;
    }
    return 0;
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

- [LeetCode 124 - Binary Tree Maximum Path Sum](https://leetcode.com/problems/binary-tree-maximum-path-sum/discuss/39775/Accepted-short-solution-in-Java)
```java
public int maxPathSum(TreeNode root) {
    int[] max = new int[1];
    max[0] = Integer.MIN_VALUE;
    maxPathSum(max, root);
    return max[0];
}
private int maxPathSum(int[] max, TreeNode root){
    if(root == null)
        return 0;
    int leftMax =  Math.max(0, maxPathSum(max, root.left));
    int rightMax = Math.max(0, maxPathSum(max, root.right));
    max[0] = Math.max(max[0],  root.val+leftMax+rightMax);
    return root.val+Math.max(leftMax,rightMax);
}
```

- [LintCode 628 - Maximum Subtree](https://yeqiuquan.blogspot.com/2017/03/lintcode-628-maximum-subtree.html)
- [LintCode 597 - Subtree with Maximum Average: ResultType{sum, size}](https://www.jiuzhang.com/solution/subtree-with-maximum-average/)
```java
private class ResultType {
    public int sum, size;
    public ResultType(int sum, int size) {
        this.sum = sum;
        this.size = size;
    }
}
private TreeNode subtree = null;
private ResultType subtreeResult = null;
public TreeNode findSubtree2(TreeNode root) {
    helper(root);
    return subtree;
}
private ResultType helper(TreeNode root) {
    if (root == null) {
        return new ResultType(0, 0);
    }
    
    ResultType left = helper(root.left);
    ResultType right = helper(root.right);
    ResultType result = new ResultType(
        left.sum + right.sum + root.val,
        left.size + right.size + 1
    );
    
    if (subtree == null ||
        subtreeResult.sum * result.size < result.sum * subtreeResult.size
    ) {
        subtree = root;
        subtreeResult = result;
    }
    return result;
}
```
