### How to
- use/follow examples to find patterns/solutions, check code
- find different cases
### brainstorm
- **states/variable**
  - **track local/global result, prev min/max etc**
- data structure
- algorithm
### Algorithm
- Two Pointers
- Sliding window
- **bisection**
- binary search
- **DP**
  - cases; include/exclude
  - knapsack
  - O(mn^2):dp[i][j] = min(dp[i][j], dp[i][k] + dp[k+1][j])
  - dp[i][j]=max(dp[i+1][j],dp[i][j-1]) or dp[i+1][j-1]+2
  - dp[i] stores all elements
- **Greedy**
- **Reverse thinking**
  - target to source
  - scan backward
- **Divide into smaller problems**
- Divide and Conquer
- Recursion
- Brute Force
  - dfs+cache
- Enumeration
- BFS
- **Topological sort**
- DFS
- brute force, enumerate
- Tree Traverse
  - post-order traverse
- Bit O(32n)
- Bit masking
  - dfs + cache
  - as state: visit all nodes
- **merge sort**
- Math
  - gcd, square(odd count of factor)
- **Bucket**
  - fixed window size, 
### Data Structure
- Union Find
- TreeMap/TreeSet
- PriorityQueue
- Stack
  - parenthesis
- Queue, Deque
- Monotone Stack/Queue
- Trie
  - dict, set of words
  - Bit Trie, Suffix Trie
- Augmented BST
- Binary Tree

### Binary Search Tree
- Range value [minVal, maxVal]
### Interval
- sort by start time or finish time
  - sort then choose greedily
  - sort then dynamic programming
  - track last max_end (or max_start)
- Two pointers both forward for input data: int[] start, end
- **Boundary count: start +1, end -1;**
  - with TreeMap: start -> end
- TreeMap or TreeSet: intervals, sort by start or end time
- PriorityQueue
  - merge k sorted list: [outerIndex, innerIndex]
  - [point, isStart] or interval
- Greedy
### Find the pattern
### Reverse thinking
- change perspective
- scan from right
- from target to source
### Strategy
- **left and right array**
  - find left/right boundary, find two numbers
### States

### Starting Point/Focus

### Time complexity brainstorm
- O(32n)
  - access each bit: 32 loop
  - bit trie
- O(N^2) -> O(nlong) or O(nlogX)
  - binary search, bisection
  - presort
- optimize to O(n)
  - greedy/better strategy
  - monotone stack/queue
  - sliding Window,
  - sort then two pointers
  - dp, states, scan backwards
- optimize O(n)
  - Monotonic stack/Deque
  - logn: binary search
  - divide and conquer: pow(x,n)
  - **limited set/states**

### Data Structure Design
- LinkedList + HashMap or Tree
### Misc
- DP - digit
  - calculate for each digit
  - cases: same digit; less digits
  - G(a to b)=G(b)-G(a-1)
  - dp[i] from dp[i/10] dp[i%10]
- Keep swapping: put Ai to i and keep swapping or change Ai index to negative
- Divisible: %, remainder map

### Approaches
- Find the most optimal solution first
- Explain the solution, time/space complexity, potential improvement
- Find bugs in your code on your own

### Mention: potential improvement
- KMP

### Code
- check condition, arguments