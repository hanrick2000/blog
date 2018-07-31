- Symmetry 利用对称性 范围减半
- break early
- math
- dp relation optimization

- O(N^2) -> O(nlong) or O(nlogX)
  - binary search, bisection
  - presort
- optimize to O(n)
  - monotone stack/queue
  - sliding Window, two pointers
  - dp
###
- greedy

### Only add valid and needed elements into (PQ, TreeMap)
### Prune bad candidates from PQ/TreeMap
- [TreeMap: prune bad candidates](https://ttzztt.gitbooks.io/lc/content/combination/shortest-subarray-with-sum-at-least-k.html)

### Space optimization
- use original input array/matrix

### min/maxLen
- [LeetCode 140 - Word Break II](https://www.jiuzhang.com/solutions/word-break-ii/)
  - dfs+cache
  - [boolean[][] isWord, boolean[] possible](https://www.jiuzhang.com/solutions/word-break-ii/)

### Reuse previous calculation
- jump to array[p] not just p--
- [LeetCode 32 - Longest Valid Parentheses SubString](https://leetcode.com/articles/longest-valid-parentheses/)
  - [stack](https://www.jianshu.com/p/392b9058f503)
  - [dp](https://www.jianshu.com/p/72a4cecbf8c7)
  ```Java
  if s[i] is ')':
     If s[i-1] is '(', longest[i] = longest[i-2] + 2
     Else if s[i-1] is ')' and s[i-longest[i-1]-1] == '(', longest[i] = longest[i-1] + 2 + longest[i-longest[i-1]-2]
     
    int longestValidParentheses(string s) {
       if(s.length() <= 1) return 0;
       int curMax = 0;
       vector<int> longest(s.size(),0);
       for(int i=1; i < s.length(); i++){
           if(s[i] == ')'){
               if(s[i-1] == '('){
                   longest[i] = (i-2) >= 0 ? (longest[i-2] + 2) : 2;
                   curMax = max(longest[i],curMax);
               }
               else{ // if s[i-1] == ')', combine the previous length.
                   if(i-longest[i-1]-1 >= 0 && s[i-longest[i-1]-1] == '('){
                       longest[i] = longest[i-1] + 2 + ((i-longest[i-1]-2 >= 0)?longest[i-longest[i-1]-2]:0);
                       curMax = max(longest[i],curMax);
                   }
               }
           }
           //else if s[i] == '(', skip it, because longest[i] must be 0
       }
       return curMax;
    }
  ```

- [LeetCode 109 - Convert Sorted List to Balanced Binary Search Tree (BST)](https://leetcode.com/articles/convert-sorted-list-to-binary-search-tree/)
  - [inorder: insert nodes in BST in the same order as the appear in Linked List](https://www.geeksforgeeks.org/sorted-linked-list-to-balanced-bst)
```JAVA
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


### Pre-compute and query it directly
### Majority
