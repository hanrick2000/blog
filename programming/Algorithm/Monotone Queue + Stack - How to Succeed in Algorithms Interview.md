#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### States
- what to store
  - element, index
  - candidates of starting index/element
  - prefix sum: not necessarily use the input data
- running length: element(or index), count of same values

### Partial Monotonic stack/queue
- [monotonic stack until k>0](https://leetcode.com/problems/remove-k-digits/discuss/88708/Straightforward-Java-Solution-Using-Stack)
### Monotonic Queue
- monotone stack: when no need to remove from front

### When to use
- expect time complexity O(N)
- find one range with xxx

#### Monotonic Queue Examples
- [LeetCode 239 - Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/discuss/65884/java-on-solution-using-deque-with-explanation)
- [合并果子](https://www.cnblogs.com/neverforget/archive/2011/10/13/ll.html)
  - 2 monotone queues

- [HDU 3530 - Subsequence]
  - two monotone queues: one stores max, the other stores min

#### DP - Monotone Queue
- F[i]=min(F[j]+a[i]:j<i) a[i]是与j无关的数
- moving interval
- NOIP - 烽火传递
- JZOJ 1772 - Holiday
- bzoj 3831 - Little Bird

#### Examples
- [LeetCode 239 - Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/discuss/65884/java-on-solution-using-deque-with-explanation)
- [HARD LeetCode 862 - Shortest Subarray with Sum at Least K](https://leetcode.com/articles/shortest-subarray-with-sum-atleast-k/)
  - [monotone queue on prefix sum](https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k/discuss/143726/C%2B%2BJavaPython-O(N)-Using-Deque)
    - store the possible values of the start pointer in the queue
    <!-- -
    http://hehejun.blogspot.com/2018/07/leetcodeshortest-subarray-with-sum-at.html
    如果对于i < j，presum[i] >= presum[j]的情况，显然对于j之后的index k。如果presum[k] - presum[i]大于等于K，那么因为presum[k] - presum[j] >= presum[k] - presum[i]，所以presum[k] - presum[j]必定也满足条件而且[j + 1, k]这个区间比[i + 1, k]更短
    对于j > i，如果j是满足presum[j] - presum[i] >= K的最小值。那么对于k > j，我们不需要考虑presum[k] - presum[i]了，因为即使区间和大于K也比[i +1, j]要长
    -->
  - [bisection: O(nlognlogn)](https://ttzztt.gitbooks.io/lc/content/combination/shortest-subarray-with-sum-at-least-k.html)
  - [TreeMap: prune bad candidates](https://ttzztt.gitbooks.io/lc/content/combination/shortest-subarray-with-sum-at-least-k.html)
```java
public int shortestSubarray(int[] A, int K) {
    int N = A.length;
    long[] P = new long[N+1];
    for (int i = 0; i < N; ++i)
        P[i+1] = P[i] + (long) A[i];

    // Want smallest y-x with P[y] - P[x] >= K
    int ans = N+1; // N+1 is impossible
    Deque<Integer> monoq = new LinkedList(); //opt(y) candidates, as indices of P

    for (int y = 0; y < P.length; ++y) {
        // Want opt(y) = largest x with P[x] <= P[y] - K;
        while (!monoq.isEmpty() && P[y] <= P[monoq.getLast()])
            monoq.removeLast();
        while (!monoq.isEmpty() && P[y] >= P[monoq.getFirst()] + K)
            ans = Math.min(ans, y - monoq.removeFirst());

        monoq.addLast(y);
    }

    return ans < N+1 ? ans : -1;
}
```

#### Monotonic Stack
- stack + greedy
- the answer is known when the element is popped out
- Focus on the element pushed in or popped out
##### When to use
- [单调栈这种数据结构，通常应用在一维数组上, 通常当前元素和前后元素之间的大小关系有关系的话](https://zhuanlan.zhihu.com/p/26465701)
- 每个元素出栈时候的意义
- 对每一个节点进行扩展的问题
- look for range with smallest/largest and xxx

##### Implementation
- calculate results when pop the element from the stack
- < or <=; > or >=

##### Examples
- [LeetCode 901 - Online Stock Span: the maximum number of consecutive days (starting from today and going backwards) for which the price of the stock was less than or equal to today's price](https://leetcode.com/problems/online-stock-span/discuss/168308/Short-Java-Solution)
- [Next Greater Element](https://www.geeksforgeeks.org/next-greater-element/)
  - decreasing stack
- [Find maximum difference between nearest left and right smaller elements](https://www.geeksforgeeks.org/find-maximum-difference-between-nearest-left-and-right-smaller-elements/)
  - reverse and call same function again
- [LeetCode 503 - Next Greater Element II: Circular](https://leetcode.com/problems/next-greater-element-ii/discuss/98273/java-10-lines-and-c-12-lines-linear-time-complexity-on-with-explanation)
  - Circular data: virtual double data
```java
public int[] nextGreaterElements(int[] nums) {
    int n = nums.length, next[] = new int[n];
    Arrays.fill(next, -1);
    Stack<Integer> stack = new Stack<>(); // index stack
    for (int i = 0; i < n * 2; i++) {
        int num = nums[i % n];
        while (!stack.isEmpty() && nums[stack.peek()] < num)
            next[stack.pop()] = num;
        if (i < n) stack.push(i);
    }   
    return next;
}
```
- [LeetCode 84 - Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28900/O(n)-stack-based-JAVA-solution)
  - [increasing stack](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28900/O(n)-stack-based-JAVA-solution)
  - [lessFromLeft/lessFromRight: idx of the first bar the left/right that is lower than current](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28902/5ms-O\(n\)-Java-solution-explained-(beats-96))
  - [Divide and conquer - O(nlogn): max(maxLeftOnly, maxRightOnly, maxCombineArea](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28910/Simple-Divide-and-Conquer-AC-solution-without-Segment-Tree/198911/)
```java
public int largestRectangleArea(int[] height) {
    height = Arrays.copyOf(height, height.length + 1);
    int maxRect = 0;
    Stack<Integer> stack = new Stack<Integer>();
    for(int i = 0; i < height.length; ++i) {
        while (!stack.isEmpty() && height[i] < height[stack.peek()]) {
            int rect = height[stack.pop()] * (stack.isEmpty() ? i : (i-stack.peek()-1));
            maxRect = Math.max(maxRect, rect);
        }
        stack.push(i);
    }
    return maxRect;
}
```
- [LeetCode 907. Sum of Subarray Minimums](https://leetcode.com/problems/sum-of-subarray-minimums/discuss/170750/C%2B%2BJavaPython-Stack-Solution)
  - [res = sum(A[i] * f(i)), f(i) = (left[i] + 1) * (right[i] + 1)](https://leetcode.com/problems/sum-of-subarray-minimums/discuss/170750/C%2B%2BJavaPython-Stack-Solution)
    - left[i], the length of strict bigger numbers on the left of A[i]
    - right[i], the length of bigger numbers on the right of A[i]
  - [monotone stack + DP](https://leetcode.com/problems/sum-of-subarray-minimums/discuss/170769/Java-O(n)-monotone-stack-with-DP)
    - suffix ending at i
    - dp[i + 1]: Sum of minimum of subarrays which end with A[i]

```java
  public int sumSubarrayMins(int[] A) {
      int res = 0, n = A.length, mod = (int)1e9 + 7;
      int[] left = new int[n], right = new int[n];
      Stack<int[]> s1 = new Stack<>(), s2 = new Stack<>();
      for (int i = 0; i < n; ++i) {
          int count = 1;
          while (!s1.isEmpty() && s1.peek()[0] > A[i])
              count += s1.pop()[1];
          s1.push(new int[] {A[i], count});
          left[i] = count;
      }
      for (int i = n - 1; i >= 0; --i) {
          int count = 1;
          while (!s2.isEmpty() && s2.peek()[0] >= A[i])
              count += s2.pop()[1];
          s2.push(new int[] {A[i], count});
          right[i] = count;
      }
      for (int i = 0; i < n; ++i)
          res = (res + A[i] * left[i] * right[i]) % mod;
      return res;
  }

  public int sumSubarrayMins(int[] A) {
      Stack<Integer> stack = new Stack<>();
      int[] dp = new int[A.length + 1];
      stack.push(-1); // case when stack is empty, not really needed
      int result = 0, M = (int)1e9 + 7;
      for (int i = 0; i < A.length; i++) {
          while (stack.peek() != -1 && A[i] <= A[stack.peek()]) {
              stack.pop();
          }
          dp[i + 1] = (dp[stack.peek() + 1] + (i - stack.peek()) * A[i]) % M;
          stack.push(i);
          result += dp[i + 1];
          result %= M;
      }
      return result;
  }

  public int sumSubarrayMins(int[] A) {
      Stack<Integer> s = new Stack<>();
      int n = A.length, res = 0, mod = (int)1e9 + 7, j,k;
      for (int i = 0; i <= n; i++) {
          while (!s.isEmpty() && A[stack.peek()] > (i == n ? 0 : A[i])) {
              j = stack.pop();
              k = stack.isEmpty() ? -1 : stack.peek();
              res = (res + A[j] * (i - j) * (j - k)) % mod;
          }
          stack.push(i);
      }
      return res;
  }
```
- [LeetCode 42 - Trapping Rain Water](https://leetcode.com/articles/trapping-rain-water/#approach-3-using-stacks-accepted)
```java
public int trap(int[] A) {
    if (A==null) return 0;
    Stack<Integer> s = new Stack<Integer>();
    int i = 0, maxWater = 0, maxBotWater = 0;
    while (i < A.length){
        if (s.isEmpty() || A[i]<=A[s.peek()]){
            s.push(i++);
        }
        else {
            int bot = s.pop();
            maxBotWater = s.isEmpty()? // empty means no il
            0:(Math.min(A[s.peek()],A[i])-A[bot])*(i-s.peek()-1);
            maxWater += maxBotWater;
        }
    }
    return maxWater;
}
```
- [LeetCode 85 - Maximal Rectangle](https://leetcode.com/problems/maximal-rectangle/discuss/29055/My-java-solution-based-on-Maximum-Rectangle-in-Histogram-with-explanation)
  - [calculate maxArea for each row](http://rleetcode.blogspot.com/2014/01/maximal-rectangle-java.html)
  - [Separate DP functions/states](https://leetcode.com/problems/maximal-rectangle/discuss/29054/Share-my-DP-solution)
    - left(i,j) = max(left(i-1,j), cur_left), cur_left can be determined from the current row
    - right(i,j) = min(right(i-1,j), cur_right), cur_right can be determined from the current row
    - height(i,j) = height(i-1,j) + 1, if matrix[i][j]=='1';

- [LeetCode 402 - Remove K Digits](https://leetcode.com/problems/remove-k-digits/discuss/88675/Clear-Java-Solution-Using-Deque)
  - [monotonic stack until k>0](https://leetcode.com/problems/remove-k-digits/discuss/88708/Straightforward-Java-Solution-Using-Stack)
```java
public String removeKdigits(String num, int k) {
    int len = num.length();
    Stack<Character> stack = new Stack<>();
    int i =0;
    while(i<num.length()){
        //whenever meet a digit which is less than the previous digit, discard the previous one
        while(k>0 && !stack.isEmpty() && stack.peek()>num.charAt(i)){
            stack.pop();
            k--;
        }
        stack.push(num.charAt(i));
        i++;
    }
    // corner case like "1111"
    while(k>0){
        stack.pop();
        k--;            
    }
    //construct the number from the stack
    StringBuilder sb = new StringBuilder();
    while(!stack.isEmpty())
        sb.append(stack.pop());
    sb.reverse();    
    //remove all the 0 at the head
    while(sb.length()>1 && sb.charAt(0)=='0')
        sb.deleteCharAt(0);
    return sb.toString();
}
```
- [LintCode 126 - Max Tree](https://segmentfault.com/a/1190000007471356)
```java
public TreeNode maxTree(int[] A) {
    if (A == null || A.length == 0) return null;
    Stack<TreeNode> stack = new Stack<>();
    for (int i = 0; i < A.length; i++) {
        //遍历A的每个元素，创造结点node
        TreeNode node = new TreeNode(A[i]);
        //将stack中小于当前结点的结点都pop出来，存为当前结点的左子树
        while (!stack.isEmpty() && node.val >= stack.peek().val) node.left = stack.pop();
        //如果stack仍非空，剩下的结点一定大于当前结点，所以将当前结点存为stack中结点的右子树；而stack中结点本来的右子树之前已经存为当前结点的左子树了
        if (!stack.isEmpty()) stack.peek().right = node;
        //stack中存放结点的顺序为：底部为完整的max tree，从下向上是下一层孩子结点的备份，顶部是当前结点的备份
        stack.push(node);
    }
    TreeNode root = stack.pop();
    while (!stack.isEmpty()) root = stack.pop();
    return root;
}
```

- [LeetCode 316 - Remove Duplicate Letters](https://leetcode.com/problems/remove-duplicate-letters/discuss/76769/java-solution-using-stack-with-comments)
  - remove duplicate letters so that every letter appear once and only once. You must make sure your result is the smallest in lexicographical order among all possible results
- [LeetCode 321 - Create Maximum Number](https://leetcode.com/problems/create-maximum-number/discuss/77285/Share-my-greedy-solution)
  - Given two arrays of length m and n with digits 0-9 representing two numbers. Create the maximum number of length k <= m + n from digits of the two. The relative order of the digits from the same array must be preserved. Return an array of the k digits. You should try to optimize your time and space complexity.
- [HARD LeetCode 654 - Maximum Binary Tree](https://leetcode.com/problems/maximum-binary-tree/discuss/106156/Java-worst-case-O(N)-solution)
  - decreasing stack
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
- [HARD LeetCode 456 - 132 Pattern - hard](https://leetcode.com/articles/132-pattern/)
  - [TreeMap: keep right elements in TreeMap and track min](ry to find if there exists the value in suffix which is greater than minimum and less than nums[i].)
    - fix the nums[i] as max value, find min form prefix, try to find if there exists the value in suffix which is greater than minimum and less than nums[i].
  - [Monotonic stack + interval](https://leetcode.com/problems/132-pattern/discuss/94077/java-on-solution-using-stack-in-detail-explanation)
    - non-overlapping intervals are formed in descending order by their min value
    - track largest candidate element less than top element in stack

```java
public boolean find132pattern(int[] nums) {
  if (nums.length < 3)
    return false;
  Stack<Integer> stack = new Stack<>();
  int[] min = new int[nums.length];
  min[0] = nums[0];
  for (int i = 1; i < nums.length; i++)
    min[i] = Math.min(min[i - 1], nums[i]);
  for (int j = nums.length - 1; j >= 0; j--) {
    if (nums[j] > min[j]) {
      while (!stack.isEmpty() && stack.peek() <= min[j])
        stack.pop();
      if (!stack.isEmpty() && stack.peek() < nums[j])
        return true;
      stack.push(nums[j]);
    }
  }
  return false;
}

// https://www.jianshu.com/p/910fe372d9a0
public boolean find132pattern(int[] nums) {
  boolean result = false;
  int third = Integer.MIN_VALUE; // the third number, 13(2)
  Stack<Integer> stack = new Stack<Integer>(); // decreasing stack
  for (int i = nums.length - 1; i >= 0; i--) {
    if (nums[i] < third)
      return true;
    while (!stack.isEmpty() && nums[i] > stack.peek()) {
      third = Math.max(third, stack.pop());
    }
    stack.push(nums[i]);
  }
  return result;
}
```

##### Monotonic stack stores candidates then scan original data from end
- [HARD LeetCode 962 - Maximum Width Ramp: A[i] <= A[j].  The width of such a ramp is j - i](https://www.acwing.com/solution/LeetCode/content/672/)
  - [pre-sort with element index](https://leetcode.com/articles/maximum-width-ramp/)
  - [TreeMap](https://leetcode.com/problems/maximum-width-ramp/discuss/209060/TreeMap-O(nlogn)-8-lines-of-Java)
  - [minL + maxR and then two pointers](https://www.acwing.com/solution/LeetCode/content/672/)
  - [monotonic stack stores candidates then scan original data from end](https://www.acwing.com/solution/LeetCode/content/672/)
```Java
public int maxWidthRamp(int[] A) {
    int N = A.length;
    Stack<Integer> s = new Stack(); // decreasing stack
    for (int i = 0; i < N; i++) {
        if (s.isEmpty() || A[i] < A[s.peek()]) {
            s.push(i);
        }
    }
    int res = 0;
    for (int i = N - 1; i >= 0; i--) {
        while (!s.isEmpty() && A[s.peek()] <= A[i]) {
            res = Math.max(res, i - s.pop());
        }      
    }
    return res;
}
```

- [LeetCode 768 - Max Chunks To Make Sorted II](http://www.cnblogs.com/grandyang/p/8850299.html)
  - [maxOfLeft, minOfRight](https://leetcode.com/problems/max-chunks-to-make-sorted-ii/discuss/113462/Java-solution-left-max-and-right-min.)
  - [Monotonic Stack](http://www.cnblogs.com/grandyang/p/8850299.html)
```java
int maxChunksToSorted(int[] arr) {
    Stack<Integer> st = new Stack<>();
    for (int i = 0; i < arr.size(); ++i) {
        if (st.empty() || st.top() <= arr[i]) {
            st.push(arr[i]);
        } else {
            int curMax = st.top(); st.pop();
            while (!st.empty() && st.top() > arr[i]) st.pop();
            st.push(curMax);
        }
    }
    return st.size();
}
```
- [LeetCode 769 - Max Chunks To Make Sorted](https://leetcode.com/problems/sum-of-distances-in-tree/discuss/130583/C%2B%2BJavaPython-Pre-order-and-Post-order-DFS-O(N))
  - [post order then pre order](https://leetcode.com/problems/sum-of-distances-in-tree/discuss/130583/C%2B%2BJavaPython-Pre-order-and-Post-order-DFS-O(N))
    - count[i] counts all nodes in the subtree i.
    - res[i] counts sum of distance in subtree i.

```java
int[] res, count; ArrayList<HashSet<Integer>> tree; int n;
public int[] sumOfDistancesInTree(int N, int[][] edges) {
    tree = new ArrayList<HashSet<Integer>>();
    res = new int[N];
    count = new int[N];
    n = N;
    for (int i = 0; i < N ; ++i ) tree.add(new HashSet<Integer>());
    for (int[] e : edges) {tree.get(e[0]).add(e[1]); tree.get(e[1]).add(e[0]);}
    dfs(0, new HashSet<Integer>());
    dfs2(0, new HashSet<Integer>());
    return res;
}
public void dfs(int root, HashSet<Integer> seen) {
    seen.add(root);
    for (int i : tree.get(root))
        if (!seen.contains(i)) {
            dfs(i, seen);
            count[root] += count[i];
            res[root] += res[i] + count[i];
        }
    count[root]++;
}
public void dfs2(int root, HashSet<Integer> seen) {
    seen.add(root);
    for (int i : tree.get(root))
        if (!seen.contains(i)) {
            res[i] = res[root] - count[i] + n - count[i];
            dfs2(i, seen);
        };
}
```