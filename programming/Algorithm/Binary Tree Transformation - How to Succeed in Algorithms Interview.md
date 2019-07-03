#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Implementation of Bianry Tree Transformation
- return new root
- update left/right pointer while traverse
  - root.left/right = convert(root.left, ..);
- or track prev

#### Example
- [LeetCode 226 - Invert Binary Tree](https://leetcode.com/articles/invert-binary-tree/)
- [Sink Odd nodes in Binary Tree](https://www.geeksforgeeks.org/sink-odd-nodes-binary-tree/)
  - [Sink Zeros in Binary Tree](https://www.techiedelight.com/sink-nodes-containing-zero-bottom-binary-tree/)
- [Given a binary tree, remove all the half nodes](https://www.geeksforgeeks.org/given-a-binary-tree-how-do-you-remove-all-the-half-nodes/)
- [Convert a given tree to its Sum Tree](https://www.geeksforgeeks.org/convert-a-given-tree-to-sum-tree/)
- [Convert a Binary Tree into its Mirror Tree](https://www.geeksforgeeks.org/write-an-efficient-c-function-to-convert-a-tree-into-its-mirror-tree/)
- [LeetCode 669 - Trim a Binary Search Tree: Remove BST keys outside the given range](https://www.ideserve.co.in/learn/remove-out-of-range-bst-nodes)
```java
public TreeNode trimBST(TreeNode root, int L, int R) {
  if (root == null)
    return root;
  if (root.val > R)
    return trimBST(root.left, L, R);
  if (root.val < L)
    return trimBST(root.right, L, R);
  root.left = trimBST(root.left, L, R);
  root.right = trimBST(root.right, L, R);
  return root;
}
```

- [Remove nodes on root to leaf paths of length < K](https://www.geeksforgeeks.org/remove-nodes-root-leaf-paths-length-k/)
- [Remove all nodes which don’t lie in any path with sum>= k](https://www.ideserve.co.in/learn/remove-all-nodes-which-lie-on-path-having-sum-less-than-k)
```JAVA
static Node pruneUtil(Node root, int k,  
                      INT sum)  
{  
    if (root == null) return null;  
    INT lsum = new INT(sum.v + (root.data));  
    INT rsum = new INT(lsum.v);  
    root.left = pruneUtil(root.left, k, lsum);  
    root.right = pruneUtil(root.right, k, rsum);  
    sum.v = max(lsum.v, rsum.v);  
    if (sum.v < k)  
    {  
        root = null;  
    }  
    return root;  
}  

public Node prune(Node root, int sum) {
    if (root == null)
        return null;
    root.left = prune(root.left, sum - root.data);
    root.right = prune(root.right, sum - root.data);
    // if node is a leaf node whose data is smaller
    // than the sum we delete the leaf.An important
    // thing to note is a non-leaf node can become
    // leaf when its children are deleted.
    if (isLeaf(root)) {
        if (sum > root.data)
            root = null;
    }
    return root;
}  
```

- [LeetCode 156 - Binary Tree Upside Down](http://wlcoding.blogspot.com/2015/03/binary-tree-upside-down.html)
```java
public TreeNode upsideDownBinaryTree(TreeNode root) {
  if (root == null) {
    return null;
  }
  return upsideDownBinaryTree(root, null);
}

private TreeNode upsideDownBinaryTree(TreeNode root, TreeNode parent) {
  if (root == null) {
    return parent;
  }
  TreeNode newNode = upsideDownBinaryTree(root.left, root);
  root.left = parent == null ? null : parent.right;
  root.right = parent;
  return newNode;
}

public TreeNode upsideDownBinaryTree(TreeNode root) {
  if (root == null || root.left == null)
    return root;
  TreeNode newRoot = upsideDownBinaryTree(root.left);
  // root.left is newRoot everytime
  root.left.left = root.right;
  root.left.right = root;
  root.left = null;
  root.right = null;
  return newRoot;
}

public TreeNode upsideDownBinaryTree(TreeNode root) {
  TreeNode p = root, parent = null, parentRight = null;
  while (p != null) {
    TreeNode left = p.left;
    TreeNode right = p.right;
    p.left = parentRight;
    p.right = parent;
    parent = p;
    parentRight = right;
    p = left;
  }
  return parent;
}
```
#### BST example
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
- [LeetCode 108 - Convert Sorted Array to Binary Search Tree](https://discuss.leetcode.com/topic/14412/java-iterative-solution/2)
- [LeetCode 109 - Convert Sorted List to Balanced Binary Search Tree (BST)](https://leetcode.com/articles/convert-sorted-list-to-binary-search-tree/)
  - [inorder: insert nodes in BST in the same order as the appear in Linked List](https://www.geeksforgeeks.org/sorted-linked-list-to-balanced-bst)
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
- [LeetCode 450 - remove node from binary search tree](https://leetcode.com/problems/delete-node-in-a-bst/discuss/93296/Recursive-Easy-to-Understand-Java-Solution)
  - [iterative version](https://leetcode.com/problems/delete-node-in-a-bst/discuss/93378/An-easy-understanding-O(h)-time-O(1)-space-Java-solution.)
```java
public TreeNode deleteNode(TreeNode root, int key) {
    if(root == null){
        return null;
    }
    if(key < root.val){
        root.left = deleteNode(root.left, key);
    }else if(key > root.val){
        root.right = deleteNode(root.right, key);
    }else{
        if(root.left == null){
            return root.right;
        }else if(root.right == null){
            return root.left;
        }

        TreeNode minNode = findMin(root.right);
        root.val = minNode.val;
        root.right = deleteNode(root.right, root.val);
    }
    return root;
}
```
- [LeetCode 776 - Split BST](https://github.com/fishercoder1534/Leetcode/blob/master/src/main/java/com/fishercoder/solutions/_776.java)
```java
public TreeNode[] splitBST(TreeNode root, int V) {
    if (root == null)
        return new TreeNode[]{null, null};
    if (root.val == V) {
        TreeNode right = root.right;
        root.right = null;
        return new TreeNode[]{root, right};
    }
    else if (root.val > V) {
        TreeNode[] nodes = splitBST(root.left, V);
        TreeNode left = nodes[0];
        TreeNode right = nodes[1];
        root.left = right;
        return new TreeNode[]{left,root};
    } else {
        TreeNode[] nodes = splitBST(root.right, V);
        TreeNode left = nodes[0];
        TreeNode right = nodes[1];
        root.right=left;
        return new TreeNode[]{root, right};
    }
}
```
- [HARD Construct a Binary Search Tree from given postorder](https://www.geeksforgeeks.org/construct-a-binary-search-tree-from-given-postorder/)
  - [use monotone increasing stack](https://www.geeksforgeeks.org/construct-a-bst-from-given-postorder-traversal-using-stack/)
  - [(min, max) + recursion](https://www.ideserve.co.in/learn/serialize-deserialize-binary-search-tree-using-post-order-traversal)
```java
public TreeNode deserializeArrayOptimized(int[] postorder, int[] currIndex, int min, int max)
{
  if (currIndex[0] < 0) return null;
  TreeNode root = null;
  if ((postorder[currIndex[0]] > min) && (postorder[currIndex[0]] < max))
  {
      root = new TreeNode(postorder[currIndex[0]]);
      currIndex[0] -= 1;
      root.right = deserializeArrayOptimized(postorder, currIndex, root.val, max);
      root.left = deserializeArrayOptimized(postorder, currIndex, min, root.val);
  }     
  return root;
}
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

- [Construct Binary Search Tree from a given Preorder](https://algorithms.tutorialhorizon.com/construct-binary-search-tree-from-a-given-preorder-traversal-using-recursion/)
  - [(min, max) + recursion](https://algorithms.tutorialhorizon.com/construct-binary-search-tree-from-a-given-preorder-traversal-using-recursion/)
  - [monotone decreasing stack](https://algorithms.tutorialhorizon.com//construct-binary-search-tree-from-a-given-preorder-traversal-using-stack-without-recursion/)
```java
public int pIndex = 0;
public Node constructTree(int[] preorder, int data, int min, int max) {
  if (pIndex < preorder.length) {
    if (preorder[pIndex] > min && preorder[pIndex] < max) {
      Node root = new Node(data);
      pIndex++;
      if (pIndex < preorder.length) {
        root.left = constructTree(preorder, preorder[pIndex], min,data);
        root.right = constructTree(preorder, preorder[pIndex],data, max);
      }
      return root;
    }
  }
  return null;
}
public Node constructTree(int[] preorder) {
  Stack<Node> s = new Stack<Node>();
  Node root = new Node(preorder[0]);
  s.add(root);
  for (int i = 1; i < preorder.length; i++) {
    Node x = null;
    while (!s.isEmpty() && preorder[i] > s.peek().data) {
      x = s.pop();
    }
    if (x != null) {
      x.right = new Node(preorder[i]);
      s.push(x.right);
    } else {
      s.peek().left = new Node(preorder[i]);
      s.push(s.peek().left);
    }
  }
  return root;
}
```

### Tree Creation/Conversion
- [LeetCode 114 - Flatten Binary Tree to Linked List: pre-order](https://www.jiuzhang.com/solutions/flatten-binary-tree-to-linked-list/)
  - [post-order](http://fisherlei.blogspot.com/2012/12/leetcode-flatten-binary-tree-to-linked.html)
  - save all nodes into a list then link them
```java
  // pre-order
  TreeNode pre;
  void flatten(TreeNode root) {
    if (root == null)
      return;
    if (pre != null) {
      pre.left = null;
      pre.right = root;
    }
    pre = root;
    TreeNode right = root.right;    
    flatten(root.left);
    flatten(right);
  }
// post-order
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
- [Convert a Binary Tree into Doubly Linked List in spiral fashion](https://www.geeksforgeeks.org/convert-a-binary-tree-into-doubly-linked-list-in-spiral-fashion/)
- [LeetCode 606 - Construct String from Binary Tree](https://leetcode.com/problems/construct-string-from-binary-tree/discuss/104096/java-recursion-stringbuilder)


### Tree - Creation
- [LeetCode 889 - Construct Binary Tree from Preorder and Postorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/discuss/161286/C%2B%2B-O(N)-recursive-solution)
  - [indexMap to cache postorder](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/discuss/161286/C%2B%2B-O(N)-recursive-solution)
  - [stack](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/discuss/161268/C%2B%2BJavaPython-One-Pass-Real-O(N))

```java
Map<Integer, Integer> postMap = new HashMap<>();
public TreeNode constructFromPrePost(int[] pre, int[] post) {
    int length = pre.length;
    for(int i = 0; i < post.length; i++) {
        postMap.put(post[i], i);
    }
    return build(0, length - 1, 0, length - 1, pre, post);
}
private TreeNode build(int preLeft, int preRight, int postLeft, int postRight, int[] pre, int[] post) {
    if(preLeft > preRight || postLeft > postRight) {
        return null;
    }
    TreeNode root = new TreeNode(pre[preLeft]);
    if(preLeft + 1 <= preRight) {
        int index = postMap.get(pre[preLeft + 1]);
        int sum = index - postLeft;
        root.left = build(preLeft + 1, preLeft + sum + 1, postLeft, index, pre, post);
        root.right = build(preLeft + sum + 2, preRight, index + 1, postRight - 1, pre, post);
    }
    return root;
}

public TreeNode constructFromPrePost(int[] pre, int[] post) {
  Stack<TreeNode> stack = new Stack<>();
  TreeNode root = new TreeNode(pre[0]);
  stack.push(root);
  for (int i = 1, j = 0; i < pre.length; ++i) {
    TreeNode node = new TreeNode(pre[i]);
    while (stack.peek().val == post[j]) {
      stack.pop();
      j++;
    }
    if (stack.peek().left == null) {
      stack.peek().left = node;
    } else {
      stack.peek().right = node;
    }
    stack.push(node);
  }
  return root;
}
```
- [LeetCode 105 - Construct Binary Tree from Preorder and Inorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/discuss/34541/5ms-Java-Clean-Solution-with-Caching)
  - [indexmap to cache inorder](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/discuss/34541/5ms-Java-Clean-Solution-with-Caching)
- [Construct a tree from Inorder and Level order traversals](https://algorithms.tutorialhorizon.com/construct-a-binary-tree-from-given-inorder-and-level-order-traversal/)
- [LeetCode 654 - Maximum Binary Tree](https://leetcode.com/problems/maximum-binary-tree/discuss/106156/Java-worst-case-O(N)-solution)
  - monotone decreasing stack
  - create the TreeNode while access the data, push them into monotone stack, connect TreeNodes when push or pop
![](https://img-blog.csdnimg.cn/20181130151630632.png){.class height=80% width=80% }
```java
public TreeNode constructMaximumBinaryTree(int[] nums) {
    Deque<TreeNode> stack = new LinkedList<>();
    for(int i = 0; i < nums.length; i++) {
        TreeNode curr = new TreeNode(nums[i]);
        while(!stack.isEmpty() && stack.peek().val < nums[i]) {
            curr.left = stack.pop();
        }
        if(!stack.isEmpty()) {
            stack.peek().right = curr;
        }
        stack.push(curr);
    }    
    return stack.isEmpty() ? null : stack.removeLast();
}
```
- [LeetCode 536 - Construct Binary Tree from String - 4(2(3)(1))(6(5))](https://www.geeksforgeeks.org/construct-binary-tree-string-bracket-representation/)
- [LeetCode 998 - Maximum Binary Tree II](https://leetcode.com/problems/maximum-binary-tree-ii/discuss/242936/JavaC%2B%2BPython-Recursion-and-Iteration)

### Serialization
- [LeetCode 572 - Subtree of Another Tree](LeetCode 572 - Subtree of Another Tree)
  - Serialization or
```java
public boolean isSubtree(TreeNode s, TreeNode t) {
  StringBuilder sbd1 = new StringBuilder();
  StringBuilder sbd2 = new StringBuilder();
  preOrder(sbd1, s);
  preOrder(sbd2, t);
  return sbd1.toString().contains(sbd2);
}
private void preOrder(StringBuilder sbd, TreeNode t) {
  if(t == null) {
    sbd.append(",,");
    return;
  }		
  sbd.append(",").append(t.val);
  preOrder(sbd, t.left);
  preOrder(sbd, t.right);
}
```
- [LeetCode 297 - Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/discuss/74260/Recursive-DFS-Iterative-DFS-and-BFS)
  - [pre-order](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/discuss/74253/Easy-to-understand-Java-Solution)
  - [level order traverse](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/discuss/74260/Recursive-DFS-Iterative-DFS-and-BFS)
```java
public TreeNode deserialize(String data) {
    if (data == "") return null;
    Queue<TreeNode> q = new LinkedList<>();
    String[] values = data.split(" ");
    TreeNode root = new TreeNode(Integer.parseInt(values[0]));
    q.add(root);
    for (int i = 1; i < values.length; i++) {
        TreeNode parent = q.poll();
        if (!values[i].equals("n")) {
            TreeNode left = new TreeNode(Integer.parseInt(values[i]));
            parent.left = left;
            q.add(left);
        }
        if (!values[++i].equals("n")) {
            TreeNode right = new TreeNode(Integer.parseInt(values[i]));
            parent.right = right;
            q.add(right);
        }
    }
    return root;
}
```

- [LeetCode 449 - Serialize and Deserialize BST](https://leetcode.com/problems/serialize-and-deserialize-bst/discuss/93170/pre-or-post-order-with-only-keeping-one-bound(beat-98-and-95))
  - [pre-order + min/max](https://leetcode.com/problems/serialize-and-deserialize-bst/discuss/93179/java-on-recursive-dfs-without-null-changed-from-serialize-and-deserialize-bt)
  - [post-order](https://leetcode.com/problems/serialize-and-deserialize-bst/discuss/93170/pre-or-post-order-with-only-keeping-one-bound(beat-98-and-95))
- [LeetCode 428 - Serialize and Deserialize N-ary Tree](http://shibaili.blogspot.com/2018/11/428-serialize-and-deserialize-n-ary-tree.html)