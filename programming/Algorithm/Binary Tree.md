
- Level Order traverse
- DFS(pre/post/in-order traverse)
- prev pointer

### Create tree data structure
- tree = new ArrayList<>();
  - every node stores new HashSet<Integer>()

### What info we can get
- how many sub nodes: cnt[i]=sum(cnt[child])+1
- distsum[i]=sum(distsum[child])+sum(cnt[i])

#### Right then Left
- [LeetCode 971 - Flip Binary Tree To Match Preorder Traversal](https://leetcode.com/problems/flip-binary-tree-to-match-preorder-traversal/discuss/214216/JavaC%2B%2BPython-DFS-Solution)
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

- [HARD LeetCode 834 - Sum of Distances in Tree](http://www.programmersought.com/article/1793330558/)
  - count[i] counts all nodes in the subtree i
  - res[i] counts sum of distance in subtree i
  - Post order dfs traversal, update count and res: count[root] = sum(count[i]) + 1; res[root] = sum(res[i]) + sum(count[i])
  - Pre order dfs traversal, update res: When we move our root from parent to its child i, count[i] points get 1 closer to root, n - count[i] nodes get 1 futhur to root. res[i] = res[root] - count[i] + N - count[i]
```java
private int[] res;
private int[] count;
private ArrayList<HashSet<Integer>> tree;
private int n;
public int[] sumOfDistancesInTree(int N, int[][] edges) {
    tree = new ArrayList<>();
    res = new int[N];
    count = new int[N];
    n = N;
    for (int i = 0; i < N; i++){
        tree.add(new HashSet<Integer>());
    }
    for (int[] edge : edges){
        tree.get(edge[0]).add(edge[1]);
        tree.get(edge[1]).add(edge[0]);
    }
    dfs(0, new HashSet<Integer>());
    dfs2(0, new HashSet<Integer>());
    return res;
}
private void dfs(int root, HashSet<Integer> seen){
    seen.add(root);
    for (int i : tree.get(root)){
        if (!seen.contains(i)){
            dfs(i, seen);
            count[root] += count[i];
            res[root] += res[i] + count[i];
        }
    }
    count[root]++;
}
private void dfs2(int root, HashSet<Integer> seen){
    seen.add(root);
    for (int i : tree.get(root)){
        if (!seen.contains(i)){
            res[i] = res[root] - count[i] + n - count[i];
            dfs2(i, seen);
        }
    }
}
```
### Preorder traverse
- divide and conquer
- [Minimum length sum path](http://www.zrzahid.com/minimum-length-sum-path/)
```java
private int minLenSumPathBT(final TreeNode root, final int sum, final int len) {
    if (root == null) {
        return Integer.MAX_VALUE;
    }
    final int diff = sum - root.key;
    if (diff == 0 && root.left == null && root.right == null) {
        return len + 1;
    } else {
        return Math.min(minLenSumPathBST(root.left, diff, len + 1), minLenSumPathBST(root.right, diff, len + 1));
    }
}
```



### Get height
- [LeetCode 222 - Count Complete Tree Nodes](https://leetcode.com/problems/count-complete-tree-nodes/discuss/61948/Accepted-Easy-Understand-Java-Solution)
```java
public int countNodes(TreeNode root) {
    int leftDepth = leftDepth(root);
	int rightDepth = rightDepth(root);
	if (leftDepth == rightDepth)
		return (1 << leftDepth) - 1;
	else
		return 1+countNodes(root.left) + countNodes(root.right);
}
private int rightDepth(TreeNode root) {
	int dep = 0;
	while (root != null) {
		root = root.right;
		dep++;
	}
	return dep;
}
private int leftDepth(TreeNode root) {
	int dep = 0;
	while (root != null) {
		root = root.left;
		dep++;
	}
	return dep;
}
```

### Traversal
- [LeetCode 116 - Populating Next Right Pointers in Each Node](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/discuss/37473/My-recursive-solution(Java))
  - [level order traverse without queue](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/discuss/37603/Java-solution-traversing-by-level-without-extra-space)
  - [preorder](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/discuss/37473/My-recursive-solution(Java))
```java
public void connect(TreeLinkNode root) {
    if(root == null)
        return;
    if(root.left != null){
        root.left.next = root.right;
        if(root.next != null)
            root.right.next = root.next.left;
    }    
    connect(root.left);
    connect(root.right);
}
```

- [LeetCode 662 - Maximum Width of Binary Tree](https://leetcode.com/problems/maximum-width-of-binary-tree/discuss/106645/cjava-bfsdfs3liner-clean-code-with-explanation)
  - [Only need store id of left most node in each layer: space: O(h)](https://leetcode.com/problems/maximum-width-of-binary-tree/discuss/106645/cjava-bfsdfs3liner-clean-code-with-explanation)
  - [bfs: space:O(max-nodes-in-layer)](https://leetcode.com/problems/maximum-width-of-binary-tree/discuss/106653/Java-One-Queue-Solution-with-HashMap)
```java
public int widthOfBinaryTree(TreeNode root) {
    List<Integer> lefts = new ArrayList<Integer>(); // left most nodes at each level;
    int[] res = new int[1]; // max width
    dfs(root, 1, 0, lefts, res);
    return res[0];
}
private void dfs(TreeNode node, int id, int depth, List<Integer> lefts, int[] res) {
    if (node == null) return;
    if (depth >= lefts.size()) lefts.add(id);   // add left most node
    res[0] = Integer.max(res[0], id + 1 - lefts.get(depth));
    dfs(node.left,  id * 2,     depth + 1, lefts, res);
    dfs(node.right, id * 2 + 1, depth + 1, lefts, res);
}
```
