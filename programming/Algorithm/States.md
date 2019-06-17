### States/Variables
#### track local result + global result
- track prev min/max
- parent/prevNode
- what we need track or find out
- freqs, last[],
- int[] sums
  - [LeetCode 473 - Matchsticks to Square](https://leetcode.com/articles/matchsticks-to-square/)
- start position

### Known conditions
- index map
- left and right array: max(min)Left/Right, next/pre greater/lesser element


### Boyer-Moore Voting
- [LeetCode 169 - Majority Number I](https://leetcode.com/problems/majority-element/discuss/51613/on-time-o1-space-fastest-solution)
  - [Boyer-Moore Voting](https://leetcode.com/problems/majority-element/discuss/51613/on-time-o1-space-fastest-solution)
  - [32n - bit count](https://leetcode.com/problems/majority-element/discuss/51649/Share-my-solution-Java-Count-bits)
  - [Divide and Conquer](https://zxi.mytechroad.com/blog/divide-and-conquer/leetcode-169-majority-element/)

- [LeetCode 229 - Majority Number II: the majority number is the number that occurs more than 1/3 of the size of the array](https://leetcode.com/problems/majority-element-ii/discuss/174987/topic)
  - [Boyer-Moore Voting](https://leetcode.com/problems/majority-element-ii/discuss/174987/topic)
  - [generalized n /k case](https://leetcode.com/problems/majority-element-ii/discuss/63524/Java-solution-for-generalized-n-k-case)
```java
public int majorityNumber(ArrayList<Integer> nums) {
    int candidate1 = 0, candidate2 = 0;
    int count1, count2;
    count1 = count2 = 0;
    for (int i = 0; i < nums.size(); i++) {
        if (candidate1 == nums.get(i)) {
            count1 ++;
        } else if (candidate2 == nums.get(i)) {
            count2 ++;
        } else if (count1 == 0) {
            candidate1 = nums.get(i);
            count1 = 1;
        } else if (count2 == 0) {
            candidate2 = nums.get(i);
            count2 = 1;
        } else {
            count1--;
            count2--;
        }
    }
    count1 = count2 = 0;
    for (int i = 0; i < nums.size(); i++) {
        if (nums.get(i) == candidate1) {
            count1++;
        } else if (nums.get(i) == candidate2) {
            count2++;
        }
    }    
    return count1 > count2 ? candidate1 : candidate2;
}

public List<Integer> majorityElement(int[] nums) {
    if(nums == null || nums.length == 0) return new ArrayList<>();
    return helper(nums, 3);
}
public List<Integer> helper(int[] nums, int k){
    Map<Integer, Integer> majorities = new HashMap<>();
    List<Integer> ret = new ArrayList<>();
    for(int num : nums){
        if(majorities.containsKey(num)) majorities.put(num, majorities.get(num) + 1);
        else if(majorities.keySet().size() < k - 1) majorities.put(num, 1);
        else{
            Iterator<Map.Entry<Integer, Integer>> ite = majorities.entrySet().iterator();
            while(ite.hasNext()){
                Map.Entry<Integer, Integer> entry = ite.next();
                int val = entry.getValue();
                if(val == 1) ite.remove();
                else entry.setValue(val - 1);
            }
        }
    }
    for(Integer i : majorities.keySet()){
        majorities.put(i, 0);
    }
    for(int num : nums){
        if(majorities.containsKey(num)) majorities.put(num, majorities.get(num) + 1);
    }
    int target = nums.length / k;
    for(Integer i : majorities.keySet()){
        if(majorities.get(i) > target) ret.add(i);
    }
    return ret;
}
```


### Examples
- [LeetCode 339 - Nested List Weight Sum](https://www.programcreek.com/2014/05/leetcode-nested-list-weight-sum-java/)
  - states: level
- [LeetCode 364 - Nested List Weight Sum II](http://www.cnblogs.com/grandyang/p/5615583.html)
  - two types: integer or NestedInteger
  - [dfs(List<NestedInteger> nestedList, int intSum)](https://segmentfault.com/a/1190000005937820)
  - [find max depth first](https://blog.csdn.net/jmspan/article/details/51747784)
  - [bfs](http://www.cnblogs.com/grandyang/p/5615583.html)
- [LeetCode 845 - Longest Mountain in Array: up, down](https://leetcode.com/problems/longest-mountain-in-array/discuss/135593/C%2B%2BJavaPython-1-pass-and-O(1)-space)

- [LeetCode 731 - My Calendar II: not cause a triple booking](https://leetcode.com/articles/my-calendar-ii/)
  - List<int[]> booked, dbooked;


- [LeetCode 121 - Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/discuss/39062/my-jave-accepted-solution-with-on-time-and-o1-space)
  - [track prev min](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/discuss/39062/my-jave-accepted-solution-with-on-time-and-o1-space)
  - [Kadane's Algorithm: max sum contiguous subarray](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/discuss/39038/Kadane's-Algorithm-Since-no-one-has-mentioned-about-this-so-far-%3A)-(In-case-if-interviewer-twists-the-input))
```java
public int maxProfit(int[] prices) {
    int maxCur = 0, maxSoFar = 0;
    for(int i = 1; i < prices.length; i++) {
        maxCur = Math.max(0, maxCur += prices[i] - prices[i-1]);
        maxSoFar = Math.max(maxCur, maxSoFar);
    }
    return maxSoFar;
}
```
- [LeetCode 1014 - Best Sightseeing Pair](https://leetcode.com/problems/best-sightseeing-pair/discuss/260909/JavaPython-Descriptive-solution.O(N)-Time-or-O(1)-Space.-Very-similar-to-Kadence-Algo!)
```java
public int maxScoreSightseeingPair(int[] a) {
  int max_so_far = a[0];
  int result = 0;
  for(int i=1;i<a.length;i++){
      result = Math.max(result, max_so_far + a[i] - i);
      max_so_far = Math.max(max_so_far, a[i] + i);
  }   
  return result;
}
```


- [LeetCode 152 - Maximum Product Subarray](https://leetcode.com/problems/maximum-product-subarray/discuss/48330/Simple-Java-code)
```java
public int maxProduct(int[] A) {
    int max = A[0], min = A[0], result = A[0];
    for (int i = 1; i < A.length; i++) {
        int temp = max;
        max = Math.max(Math.max(max * A[i], min * A[i]), A[i]);
        min = Math.min(Math.min(temp * A[i], min * A[i]), A[i]);
        if (max > result) {
            result = max;
        }
    }
    return result;
}
```
- [LeetCode 158 - Read N Characters Given Read4 II](http://yuanhsh.iteye.com/blog/2186426)
```java
private char[] buffer = new char[4];  
private int offset = 0, bufsize = 0;   
public int read(char[] buf, int n) {  
    int total = 0;  
    boolean eof = false;  
    while (!eof && total < n) {  
        if (bufsize == 0) {  
            bufsize = read4(buffer);  
            if (bufsize < 4) {  
                eof = true;  
            }  
        }  
        int bytes = Math.min(n - total, bufsize);   
        System.arraycopy(buffer /*src*/, offset /*srcPos*/,   
                         buf /*dest*/,   total /*destPos*/,   
                         bytes /*length*/);  
        offset = (offset + bytes) % 4;  
        bufsize -= bytes;  
        total += bytes;  
    }  
    return total;  
}
```

- [LeetCode 369 - Plus One Linked List](http://www.cnblogs.com/grandyang/p/5626389.html)
  - [lastnot9](https://leetcode.com/problems/add-two-numbers-ii/discuss/92788/Java-iterative-O(1)-space-lastNot9-solution-Changed-from-Plus-One-Linked-List)
```java
public ListNode plusOne(ListNode head) {
    ListNode dummy = new ListNode(0); // start with 0. If need to update dummy, then check if dummy is modified to 1
    dummy.next = head;
    ListNode cur = dummy, lastnot9 = null;
    while(cur != null){
       if(cur.val != 9){
           lastnot9 = cur;
       }
       cur = cur.next;
    }    
    lastnot9.val += 1;
    cur = lastnot9.next;
    while(cur != null){
       cur.val = 0;
       cur = cur.next;
    }
    if(dummy.val == 1) return dummy;
    return dummy.next;
}

```

- [LeetCode 794 - Valid Tic-Tac-Toe State](https://leetcode.com/problems/valid-tic-tac-toe-state/discuss/117580/Straightforward-Java-solution-with-explaination)
```java
public boolean validTicTacToe(String[] board) {
    int turns = 0;
    boolean xwin = false;
    boolean owin = false;
    int[] rows = new int[3];
    int[] cols = new int[3];
    int diag = 0;
    int antidiag = 0;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (board[i].charAt(j) == 'X') {
                turns++; rows[i]++; cols[j]++;
                if (i == j) diag++;
                if (i + j == 2) antidiag++;
            } else if (board[i].charAt(j) == 'O') {
                turns--; rows[i]--; cols[j]--;
                if (i == j) diag--;
                if (i + j == 2) antidiag--;
            }
        }
    }
    xwin = rows[0] == 3 || rows[1] == 3 || rows[2] == 3 ||
           cols[0] == 3 || cols[1] == 3 || cols[2] == 3 ||
           diag == 3 || antidiag == 3;
    owin = rows[0] == -3 || rows[1] == -3 || rows[2] == -3 ||
           cols[0] == -3 || cols[1] == -3 || cols[2] == -3 ||
           diag == -3 || antidiag == -3;
    if (xwin && turns == 0 || owin && turns == 1) {
        return false;
    }
    return (turns == 0 || turns == 1) && (!xwin || !owin);
}
```
- [LeetCode 562 - Longest Line of Consecutive One in Matrix](https://segmentfault.com/a/1190000017237619)
```java
public int longestLine(int[][] M) {
    if (M == null || M.length == 0 || M[0].length == 0) return 0;
    int max = 0, m = M.length, n = M[0].length;
    int[] row = new int[m];
    int[] col = new int[n];
    int[] d = new int[m+n];
    int[] ad = new int[m+n];
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (M[i][j] == 1) {
                row[i]++;
                col[j]++;
                d[i+j]++;
                ad[j-i+m]++;
                max = Math.max(max, Math.max(row[i], col[j]));
                max = Math.max(max, Math.max(d[i+j], ad[j-i+m]));
            } else {
                row[i] = 0;
                col[j] = 0;
                d[i+j] = 0;
                ad[j-i+m] = 0;
            }
        }
    }
    return max;
}
```
- [LeetCode 993 - Cousins in Binary Tree](https://leetcode.com/problems/cousins-in-binary-tree/discuss/242789/Java-Summary-of-2-solutions)
  - [level order traverse](https://leetcode.com/problems/cousins-in-binary-tree/discuss/242789/Java-Summary-of-2-solutions)
  - [dfs](https://leetcode.com/problems/cousins-in-binary-tree/discuss/240081/Java-easy-to-understand-and-clean-solution)
```java
TreeNode xParent = null;
TreeNode yParent = null;
int xDepth = -1, yDepth = -1;
public boolean isCousins(TreeNode root, int x, int y) {
    getDepthAndParent(root, x, y, 0, null);
    return xDepth == yDepth && xParent != yParent? true: false;
}
public void getDepthAndParent(TreeNode root, int x, int y, int depth, TreeNode parent){
    if(root == null){
        return;
    }
    if(root.val == x){
        xParent = parent;
        xDepth = depth;
    }else if(root.val == y){
        yParent = parent;
        yDepth = depth;
    } else {       
        getDepthAndParent(root.left, x, y, depth + 1, root);
        getDepthAndParent(root.right, x, y, depth + 1, root);
   }
}
public static boolean isCousins(TreeNode root, int x, int y) {
   if(root == null) return false;
   Queue<TreeNode> queue = new LinkedList<>();
   TreeNode xParent = null, yParent = null;
   queue.offer(root);
   while(!queue.isEmpty()){
       int size = queue.size();
       while(size > 0){
           TreeNode node = queue.poll();
           if(node.left != null){
               queue.offer(node.left);
               if(node.left.val == x) xParent = node;
               if(node.left.val == y) yParent = node;
           }
           if(node.right != null){
               queue.offer(node.right);
               if(node.right.val == x) xParent = node;
               if(node.right.val == y) yParent = node;
           }
           --size;
           if(xParent != null && yParent != null) break;
       }
       if(xParent != null && yParent != null) return xParent != yParent;
       if((xParent != null && yParent == null) ||
          (xParent == null && yParent != null)) return false;       
   }
   return false;
}
```