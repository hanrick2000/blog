#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Implementation Detail of Binary Search Tree
- track and update [minVal, maxVal], or just min, max
- in-order traverse
- convert bst to linkedlist
- track prev node
- if (root.val > k1) go left otherwise go right

##### Range value [minVal, maxVal]
- [LeetCode 98 - Validate Binary Search Tree](https://algorithms.tutorialhorizon.com/determine-whether-given-binary-tree-is-binary-search-treebst-or-not/)
  - [inorder: track prev node](https://github.com/mintycc/OnlineJudge-Solutions/blob/master/Leetcode/098_Validate_Binary_Search_Tree.java)
  - [preorder: isValidBST(root, minVal, maxVal)](https://leetcode.com/problems/validate-binary-search-tree/discuss/32109/my-simple-java-solution-in-3-lines)
  - **[post-order traverse: ResultValue:{isBst, min, max}](http://www.jiuzhang.com/solutions/validate-binary-search-tree/)**

- [delete redundant edge in BST]
```java
public void deleteEdge(TreeNode root) {
	if(root == null) return;
	root = dfs(root, Integer.MIN_VALUE, Integer.MAX_VALUE);
}
private TreeNode dfs(TreeNode root, int left, int right) {
	if(root == null) return null;
	if(root.val <= left || root.val >= right) return null;
	root.left = dfs(root.left, left, root.val);
	root.right = dfs(root.right, root.val, right);
	return root;
}
```

##### Examples
- [LeetCode 235 - Lowest Common Ancestor of a Binary Search Tree (BST)](https://leetcode.com/articles/lowest-common-ancestor-of-a-binary-search-tree/)
```Java
public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    if (root == null || p == null || q == null) return null;
    if(root.val<Math.min(p.val,q.val)) return lowestCommonAncestor(root.right,p,q);
    if(root.val>Math.max(p.val,q.val)) return lowestCommonAncestor(root.left,p,q);
    return root;
}
```

- [LeetCode 255 - Verify Preorder Sequence in Binary Search Tree](https://segmentfault.com/a/1190000003874375)
  - [divide and conquer: O(N^2](http://buttercola.blogspot.com/2015/09/leetcode-verify-preorder-sequence-in.html)
  - [track localMin for right branch, monotone decreasing stack](https://segmentfault.com/a/1190000003874375)
```JAVA
public boolean verifyPreorder(int[] preorder) {
    Stack<Integer> stk = new Stack<Integer>();
    int min = Integer.MIN_VALUE;
    for(int num : preorder){
        if(num < min) return false;
        while(!stk.isEmpty() && num > stk.peek()){
            min = stk.pop();
        }
        stk.push(num);
    }
    return true;
}
public boolean IsValidPostOrderBst(int[] nums)
{
    int i = nums.length;
    int max = Integer.MAX_VALUE;
    for (int j = nums.length - 1; j >= 0; j--)
    {
        if (nums[j] > max) return false;
        while (i <= nums.length - 1 && nums[j] > nums[i])
            max = nums[i++];
        nums[--i] = nums[j];
    }
    return true;
}
```

#### In-order traverse
- [LeetCode 426 - Convert BST to Sorted Doubly Linked List](https://blog.csdn.net/BigFatSheep/article/details/83239067)
```java
Node prev = null;
public Node treeToDoublyList(Node root) {
    if (root == null){
        return null;
    }
    Node dummy = new Node(0, null, null);
    prev = dummy;
    helper(root);
    //connect tail with head;
    prev.right = dummy.right;
    dummy.right.left = prev;
    return dummy.right;
}
private void helper(Node cur){
    if (cur == null){
        return;
    }
    helper(cur.left);
    prev.right = cur;
    cur.left = prev;
    prev = cur;
    helper(cur.right);
}
```
- [HARD LeetCode 109 - Convert Sorted List to Balanced Binary Search Tree (BST)](https://leetcode.com/articles/convert-sorted-list-to-binary-search-tree/)
  - [in-order: insert nodes in BST in the same order as the appear in Linked List](https://www.geeksforgeeks.org/sorted-linked-list-to-balanced-bst)
```JAVA
private TreeNode convertListToBST(int l, int r) {
  // Invalid case
  if (l > r) {
    return null;
  }
  int mid = (l + r) / 2;
  // First step of simulated inorder traversal. Recursively form
  // the left half
  TreeNode left = this.convertListToBST(l, mid - 1);
  // Once left half is traversed, process the current node
  TreeNode node = new TreeNode(this.head.val);
  node.left = left;
  // Maintain the invariance mentioned in the algorithm
  this.head = this.head.next;
  // Recurse on the right hand side and form BST out of them
  node.right = this.convertListToBST(mid + 1, r);
  return node;
}
private ListNode node;
inorderHelper(0, size - 1);
public TreeNode inorderHelper(int start, int end){
	if(start > end){
		return null;
	}
	int mid = start + (end - start) / 2;
	TreeNode left = inorderHelper(start, mid - 1);
	TreeNode treenode = new TreeNode(node.val);
	treenode.left = left;
	node = node.next;
	TreeNode right = inorderHelper(mid + 1, end);
	treenode.right = right;
	return treenode;
}
```
- [Two nodes of a BST are swapped, correct the BST](https://www.geeksforgeeks.org/fix-two-swapped-nodes-of-bst/)
  - find first, second, track prev node
- [LeetCode 653 - Two Sum IV - Input is a BST](https://leetcode.com/problems/two-sum-iv-input-is-a-bst/discuss/106061/Java-Simple-AC-with-Time-O(n)-Space-O(log-n)-in-Average)
  - two stacks, two pointers + iterators
- [LeetCode 272 - Closest Binary Search Tree Value II](https://www.cnblogs.com/grandyang/p/5247398.html)
  - [O(n): store candidates in Deque where elements are already sorted](https://www.cnblogs.com/grandyang/p/5247398.html)
  - [O((n-k)logk): use PriorityQueue]
  - [two stacks but still O(n)](https://gist.github.com/cixuuz/0a6a153b9131a2a8634a2a8c33efef29)
  - [two stack: O(K)]
```java
private boolean closestKValuesHelper(LinkedList<Integer> list, TreeNode root, double target, int k) {
    if (root == null) {
        return false;
    }
    if (closestKValuesHelper(list, root.left, target, k)) {
        return true;
    }
    if (list.size() == k) {
        if (Math.abs(list.getFirst() - target) < Math.abs(root.val - target)) {
            return true;
        } else {
            list.removeFirst();
        }
    }
    list.addLast(root.val);
    return closestKValuesHelper(list, root.right, target, k);
}
```

#### Postorder
- left, right, root
- scan backward from root to right then left
- [HARD Construct a Binary Search Tree from given postorder](https://www.geeksforgeeks.org/construct-a-binary-search-tree-from-given-postorder/)
  - [use monotone increasing stack](https://www.geeksforgeeks.org/construct-a-bst-from-given-postorder-traversal-using-stack/)
  - [recursion](https://www.geeksforgeeks.org/construct-a-binary-search-tree-from-given-postorder/)
```java
Node constructTreeUtil(int post[], int n)
{
    Node root = new Node(post[n - 1]);
    Stack<Node> s = new Stack<>();
    s.push(root);
    for (int i = n - 2; i >= 0; --i) {
        Node x = new Node(post[i]);
        Node temp = null;
        while (!s.isEmpty() && post[i] < s.peek().data)  
            temp = s.pop();       
        // Make x as left child of temp    
        if (temp != null)  
            temp.left = x;       
        // Else make x as right of top       
        else
            s.peek().right = x;
        s.push(x);
    }
    return root;
}
```
