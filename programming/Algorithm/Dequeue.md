
- ArrayDequeue or LinkedList

- [LeetCode 103 - Binary Tree Zigzag Level Order Traversal](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/discuss/34041/java-easy-understand-recursive-methods-beats-96-attach-easy-bfs-methods)
  - [Queue + Dequeue](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/discuss/34041/java-easy-understand-recursive-methods-beats-96-attach-easy-bfs-methods)
  - [dfs for fun: travel(TreeNode curr, List<List<Integer>> sol, int level)](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/discuss/33815/My-accepted-JAVA-solution)
  - [print directly: using 2 stacks](https://www.geeksforgeeks.org/level-order-traversal-in-spiral-form/)

#### Double Monotonic Queue
- [LeetCode 239 - Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/discuss/65884/java-on-solution-using-deque-with-explanation)

### Use Deque to store a window/candidates
- [LeetCode 995 - Minimum Number of K Consecutive Bit Flips](https://www.cnblogs.com/lz87/p/10398670.html)
  - the minimum number of K-bit flips required so that there is no 0 in the array
  - [Greedy + Starting point: first 0](https://www.cnblogs.com/lz87/p/10398670.html)
  - [Use Deque to store a window/candidates]
```java
public int minKBitFlips(int[] A, int K) {
    int count = 0;
    for(int i = 0; i < A.length; i++) {
        if(A[i] == 0 && i + K <= A.length) {
            for(int j = 0; j < K; j++) {
                A[i + j] = A[i + j] == 0 ? 1 : 0;
            }
            count++;
        }
        else if(A[i] == 0) {
            return -1;
        }
    }
    return count;
}
// 
public int minKBitFlips(int[] A, int K) {
    int totalFlips = 0, currentEffectiveFlips = 0;
    Deque<Integer> flipIndices = new ArrayDeque<>();
    for(int i = 0; i < A.length; i++) {
        if(flipIndices.size() > 0 && flipIndices.peekFirst() + K == i) {
            flipIndices.remove();
            currentEffectiveFlips--;
        }
        if(A[i] == 0 && currentEffectiveFlips % 2 == 0 
           || A[i] == 1 && currentEffectiveFlips % 2 != 0) {
            if(i + K > A.length) {
                return -1;
            }
            flipIndices.addLast(i);
            currentEffectiveFlips++;
            totalFlips++;
        }
    }
    return totalFlips;
}
```

