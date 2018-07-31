### Expected/Common time complexity
- Graph: O(V+E), O(VlogE), O(VE)
- Tree: O(N)

- state spaces
  - [LeetCode 494 - Target Sum: O(n*sum)](https://leetcode.com/problems/target-sum/discuss/97335/Short-Java-DP-Solution-with-Explanation)

### [Recursion Trees](https://www.cs.cornell.edu/courses/cs3110/2012sp/lectures/lec20-master/lec20.html)
- [LeetCode 222 - Count Complete Tree Nodes](https://leetcode.com/problems/count-complete-tree-nodes/discuss/61948/Accepted-Easy-Understand-Java-Solution)


### [master theorem](https://www.cs.cornell.edu/courses/cs3110/2012sp/lectures/lec20-master/lec20.html)

- logn*logn much less than O(n)

- complexity of recursion/dfs
  - same as the iterative or dp version


- []

- T(n) = 2T(n/2) + O(nLogn) -> T(n) = T(n x Logn x Logn)
- T(n) = 2T(n/2) + O(n) -> T(n) = T(n x Logn)


- [LeetCode 212 - Word Search II: find all words in the board](https://leetcode.com/problems/word-search-ii/discuss/59780/Java-15ms-Easiest-Solution-(100.00))
  - [Trie: O(rows * cols * m * 4^m) - m is the average len of word](https://leetcode.com/problems/word-search-ii/discuss/59780/Java-15ms-Easiest-Solution-(100.00))
    - Reuse input board[][] as visited
  - [Simple DFS: O(n * rows * cols  * 4^2n)](https://blog.csdn.net/xudli/article/details/45864915)

- [LeetCode 241 - Different Ways to Add Parentheses](https://leetcode.com/problems/different-ways-to-add-parentheses/discuss/66395/Java-recursive-solution-with-memorization)
  - dfs + cache or dp to store previous results
```Java
// dfs + no cache
f(n) = f(1)+f(2)+..+f(n-1)+f(n-1)+f(n-2)..+f(1) = 2*(f(1)+f(2)+...+f(n-1))
=> 
f(n+1) = 2*(f(1)+f(2)+..+f(n)) = 2*(f(1)+f(2)+...+f(n-1)) + 2f(n) = f(n)+2f(n) = 3f(n) 
=> 
f(n+1) = 3f(n) = 3*3*f(n-1) = ... = 3^(n+1)
// dfs + cache
O(2^n)
```

### Common Time complexity
- O(N!) only works for 10


- The complexity of indexOf is O(m*n) where n and m are the length of the search string and pattern respectively.
