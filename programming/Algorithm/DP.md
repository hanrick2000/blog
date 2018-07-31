### Related
- DFS + Cache
### When to Use DP
- Expected time complexity: O(N^2) or O(N^3)
- For questions like:
  - How many numbers
  - true/false
- suppose already know results of sub problems
- relation between current and prev element
### How
- Overlapping Subproblems
- Optimal Substructure
- States/Variables
- Initialization
  - size of the dp array: dp[n+1]
- Answer: dp[m-1][n-1] or max or sum(dp[m-1][0]...dp[m-1][n-1])

- prefer DP over dfs + cache which is hard to optimize space

### How to update
- increase len one by one: from smaller range to bigger range

### DP Variables/States
- i,j: index, position (sequence, matrix, range)
  - i from array a, j from array b
- number of X
- value/index of last end number
- [use map in dp - when there is negative value](https://leetcode.com/problems/target-sum/discuss/223661/Using-Map-java-Dp-solution)

### Initialization
- initialize dp to max/min or 0, false/true
- initialize the first row or column

### Answer
- dp[0][0] or min/max{dp[m][k] k:{0, n}}
- sum{dp[m][k] k:{0, n}}
- [LeetCode 576 - Out of Boundary Paths, answer: count+= when i,j out of boundary](https://discuss.leetcode.com/topic/88570/java-solution-dp-with-space-compression)

### Conditions/Cases
- use/include it or not
  - [LeetCode 115 - Distinct Subsequences](https://leetcode.com/problems/distinct-subsequences/discuss/37327/easy-to-understand-dp-in-java)
- when prev/cur values are same/or meet some conditions
- parity, position

### Implementation
- return value is what we need
- backward or forward: answer dp[0][0] or max(dp[n][k])

### DP vs dfs+cache
#### DP
- we can reduce one dimension in dp
- always go through all cases
#### dfs+cache
- no need go through all cases
- we can prune
### Prune
- Pre-sort

### recurrent relation
- [longest common subsequence](https://codeforces.com/blog/entry/43256)
```math
         {L[i-1,j],
L[i,j] = max|L[i,j-1],
         {L[i-1,j-1]+1   (only if last symbols are equal)
```

- Optimization DP problem
- Combinatoric DP problem

### [Print Solution](https://codeforces.com/blog/entry/43256)
- store back-links along with the DP result
- recalculate the DP from the end to the start

### DP States/Variables
- pos, step
- result
- include or not
- [Given a sequence of N numbers – A[1] , A[2] , …, A[N] . Find the length of the longest non-decreasing sequence](https://www.topcoder.com/community/competitive-programming/tutorials/dynamic-programming-from-novice-to-advanced/)
  - define a state i as being the longest non-decreasing sequence which has its last number A[i]
- HashMap<String/State, ResultType>

### DP array
- or use dfs + cache
- Make negative values positive
  - [use map in dp - when there is negative value](https://leetcode.com/problems/target-sum/discuss/223661/Using-Map-java-Dp-solution)
  - [LeetCode 494 - Target Sum: choose one from + and -](https://leetcode.com/problems/target-sum/discuss/97335/Short-Java-DP-Solution-with-Explanation)
    - because dp's range starts from -sum --> 0 --> +sum, so we need to add sum first, then the total starts from 0, then we add S
    - int[] dp = new int[2*sum+1]; return dp[sum+s];
    - [dfs + cache: map.containsKey(index + "->" + sum)](https://leetcode.com/problems/target-sum/discuss/97333/Java-simple-DFS-with-memorization)
    - [dp[i][j]=dp[i−1][j−a[i]]+dp[i−1][j+a[i]]](http://www.cnblogs.com/grandyang/p/6395843.html)
    - [subset sum: dp[j] += dp[j - nums[i]]](https://kingsfish.github.io/2017/08/22/Leetcode-494-Target-Sum/)

### Space Optimization
- Rolling array: t ^= 1

### Implementation
- DFS + cache (top down)
- Bottom up
  - Save space like O(N^2) -> O(n)

### Optimization of the function


### Types
- 坐标型
- 区间型

### [Digit DP](https://www.geeksforgeeks.org/digit-dp-introduction/)
- count the number of integers ‘x‘ between two integers say ‘a‘ and ‘b‘ such that x satisfies a specific property that can be related to its digits.
- G(b) – G(a-1)
- Possible States/Variables
  - isRestricted, isLead
  - dp[pos][state]
### Example
- 
```math
sum(10^d - 1) = sum(10^(d-1) - 1) * 10 + 45*(10^(d-1))
sum(328) = sum(299) + sum(300..328)
sum(299) = 3*sum(99) + (1 + 2)*100 
  = w*msd + (msd*(msd-1)/2)*10^d
sum(300..328) = 3*29 + recursive call "sum(28)" 
  = msd * (n % (msd*10d) + 1) + sum(n % (10d))
```
- [LeetCode 233 - Number of Digit One](https://www.cnblogs.com/yrbbest/p/5002299.html)

- [LeetCode 788 - Rotated Digits](https://leetcode.com/problems/rotated-digits/discuss/117975/Java-dp-solution-9ms)
  - dp[n] is related with dp[n/10] + dp[n%10]


### DFS + DP
- brute force + cache

### DP - Bit Masking (状态压缩DP)
- Each bitmask denotes a set of "used" states (1 is used, 0 is not)
- Use bit(bitset) for states
- dp(mask, i)
- [TSP](https://www.geeksforgeeks.org/bitmasking-dynamic-programming-set-2-tsp/)
  -  [d(i, V’)=min{Cik +  d(k, V’-{k})}](https://github.com/cormacpayne/Data-Structures-and-Algorithms/blob/master/dynamic-programming/bitmask-dynamic-programming/bitmask-dynamic-programming.md)


#### Examples
- LeetCode 471 - Encode String with Shortest Length
  - dp[i][j] = min(dp[i][k] + dp[k + 1][j]), where 1 <= k < j, ‘+’ means concatenate here
  - dp[i][j] = min(dp[i][j], compress(s[i:j])), compress is a function to find if we can shorten input string by find a repeating pattern in itself

- [LeetCode 410 - Split Array Largest Sum: split the non-negative array into m subarrays and minimize the largest sum](https://zhuhan0.blogspot.com/2017/08/leetcode-410-split-array-largest-sum.html)
  - [bisection: O(nlog(sum-max))](https://leetcode.com/problems/split-array-largest-sum/discuss/89817/Clear-Explanation%3A-8ms-Binary-Search-Java)
  - [dp: O(n^2k) dp[i][j] = min{max{dp[k][j-1], subsum(k+1, i)}}, 0 <= k < i](http://www.cnblogs.com/grandyang/p/5933787.html)
    - dp[i][j] is the optimal result for splitting nums[:i+1] into j subarrays
    - dp[1][i] = prefix sum of nums[i]
  - 

### Misc
- [Longest Arithmetic Progression: TODO](http://www.geeksforgeeks.org/length-of-the-longest-arithmatic-progression-in-a-sorted-array/)
  - pre-sort

### Code
```java
for (int len = 2; len < n; len++) {
    for (int start = 0; start + len < n; start++) {
        dp[start][start + len] = len + 1;
}}
```

### DP - Coordinates
- variables: i,j: the coordination, or values in the matrix if no duplicate

- [LeetCode 935 - Knight Dialer](https://hackernoon.com/google-interview-questions-deconstructed-the-knights-dialer-f780d516f029)
  - [dp[k][i][j] = sum(dp[k – 1][i + dy][j + dx])](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-935-knight-dialer/)
  - dp[k][i] as # of ways to dial and the last key is i after k steps, dp[k][i] = sum(dp[k-1][j]) that j can move to i
  - ans: sum(dp[k][i])
  - neighbors = new int[][]{{4,6},{6,8},{7,9},{4,8},{3,9,0},{},{1,7,0},{2,6},{1,3},{2,4}};


### Examples
- [Longest String Chain](https://www.cnblogs.com/EdwardLiu/p/6177843.html)
  - Pre-Sort by len, dp + HashMap

### DP - Two Pointers
- [Longest Arithmetic Progression of sorted array](https://orajavasolutions.wordpress.com/2014/06/28/length-of-longest-arithmetic-progression/)
  - starting point: 3 values, fix the middle value
  - [simplify the question to find if there exist three elements in Arithmetic Progression or not](https://orajavasolutions.wordpress.com/2014/06/27/finding-three-elements-in-arithmetic-progression-a-p/)
  - DP + two pointers: fix middle, <- middle ->
    - [Table[i][j] is set to length of AP with first and second element as A[i] and A[j]](https://gist.github.com/gcrfelix/54c096c66177208084db0d417419677f)
  - [DP states: diff: Map<Integer, List<int[]>> map](https://gist.github.com/gcrfelix/54c096c66177208084db0d417419677f)
```Java
int lengthLongesAP(int arr[], int n)
{
    int mat[][] = new int[n][n];
    int length = 0;     
    for(int i=0;i<n;i++)
        for(int j=0;j<n;j++)
            mat[i][j] = 2;
    for(int j=n-2;j>0;j--)
    {
        int i=j-1, k=j+1;
        int x = 2*arr[j];         
        while(i>=0 && k<n)
        {
            /* condition : a+c = 2*b */
            if(arr[i] + arr[k] == x)
            {    
                mat[i][j] = mat[j][k] + 1;
                if(mat[i][j] > length)
                    length = mat[i][j];
                 
                i--;k++;
            }
            else if(arr[i] + arr[k] < x)  //   a+c < 2*b, find a higher value of c by incrementing k  (array is in sorted order)
                k++;
            else                          //   a+c > 2*b, find a lower value of a by decrementing i   (array is in sorted order)
                i--;
        }
    }
    return length;
}
// https://gist.github.com/gcrfelix/54c096c66177208084db0d417419677f
public int longestArithmeticProgression(int[] nums) {
 //key is diff, value is list of index pair with the same diff
 HashMap<Integer, List<int[]>> map = new HashMap<Integer, List<int[]>>();  
 for(int i=0; i<nums.length-1; i++) {   // 注意这边是i<len-1
   for(int j=i+1; j<nums.length; j++) {
     int diff = nums[j] - nums[i];
     if(!map.containsKey(diff)) map.put(diff, new ArrayList<int[]>());
     map.get(diff).add(new int[]{i, j});
   }
 }
 int max = 0;
 for(int diff : map.keySet()) {
   int[] lengths = new int[nums.length];
   Arrays.fill(lengths, 1);    //initialize all nums to 1
   
   for(int[] pair : map.get(diff)) {
     lengths[pair[1]] = lengths[pair[0]] + 1;     //update length of this diff's Arithmetic Progression
     max = Math.max(max, lengths[pair[1]]);
   }
 }
 return max;
}
```

### DP + Sliding Window/Two Pointers/Variables to track
- [LeetCode 983 - Minimum Cost For Tickets](https://leetcode.com/problems/minimum-cost-for-tickets/discuss/226659/Two-DP-solutions-with-pictures)
  - [use queue or use prev pointer to maintain the sliding window](https://blog.csdn.net/mike_learns_to_rock/article/details/86669196)
  - [O(n): use week/month to find latest day in same week/month, minCost[day] = min(minCost[day-1] + costs[0], minCost[week] + costs[1], minCost[month] + costs[2])](https://blog.csdn.net/mike_learns_to_rock/article/details/86669196)
  - [O(365): minCost[day] = min(minCost[day-1] + costs[0], minCost[Math.max(0, day-7)] + costs[1], minCost[Math.max(0, day-30)] + costs[2])](https://leetcode.com/problems/minimum-cost-for-tickets/discuss/226670/Java-DP-Solution-with-explanation-O(n))

### Tutorials
- [7 Steps to Solve any DP Interview Problem](http://blog.refdash.com/dynamic-programming-tutorial-example/)
- [Dynamic Programming: From Novice to Advanced](https://www.topcoder.com/community/competitive-programming/tutorials/dynamic-programming-from-novice-to-advanced/)
- <https://www.geeksforgeeks.org/dynamic-programming/>


### Separate DP functions/states
- [LeetCode 85 - Maximal Rectangle](https://leetcode.com/problems/maximal-rectangle/discuss/29055/My-java-solution-based-on-Maximum-Rectangle-in-Histogram-with-explanation)
  - [calculate maxArea for each row](http://rleetcode.blogspot.com/2014/01/maximal-rectangle-java.html)
  - [Separate DP functions/states](https://leetcode.com/problems/maximal-rectangle/discuss/29054/Share-my-DP-solution)
    - left(i,j) = max(left(i-1,j), cur_left), cur_left can be determined from the current row
    - right(i,j) = min(right(i-1,j), cur_right), cur_right can be determined from the current row
    - height(i,j) = height(i-1,j) + 1, if matrix[i][j]=='1';

### DP - Monotone Queue Stack
- relation: current element with prev element in the stack
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

### DP + DFS: store all values
- List<Set<Integer>> dp or Set<Integer> dp, Map<Integer, HashSet<Integer>> map;

- [LeetCode - 403 Frog Jump](https://leetcode.com/problems/frog-jump/discuss/88824/very-easy-to-understand-java-solution-with-explanations)
  1. DFS
    - [variables: position, jump ability at position](http://www.cnblogs.com/grandyang/p/5888439.html)
    - [for loop based on all positions it can go]((http://www.cnblogs.com/grandyang/p/5888439.html))
  1. DP
    - [map: position -> the jump abilities](https://leetcode.com/problems/frog-jump/discuss/88824/Very-easy-to-understand-JAVA-solution-with-explanations)
```java
public boolean canCross(int[] stones) {
    HashMap<Integer, HashSet<Integer>> map = new HashMap<Integer, HashSet<Integer>>(stones.length);
    map.put(0, new HashSet<Integer>());
    map.get(0).add(1);
    for (int i = 1; i < stones.length; i++) {
      map.put(stones[i], new HashSet<Integer>() );
    }
    for (int i = 0; i < stones.length - 1; i++) {
      int stone = stones[i];
      for (int step : map.get(stone)) {
        int reach = step + stone;
        if (reach == stones[stones.length - 1]) {
          return true;
        }
        HashSet<Integer> set = map.get(reach);
        if (set != null) {
            set.add(step);
            if (step - 1 > 0) set.add(step - 1);
            set.add(step + 1);
        }
      }
    }
    return false;
}
```

- [LeetCode 898 - Bitwise ORs of Subarrays](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-898-bitwise-ors-of-subarrays/)
  - Simple DP: O(N^2): dp[i][j] := A[i] | A[i + 1] | … | A[j]; dp[i][j] = dp[i][j – 1] | A[j]
  - dp[i] := {A[i], A[i] | A[i – 1], A[i] | A[i – 1] | A[i – 2], … , A[i] | A[i – 1] | … | A[0]}, bitwise ors of all subarrays end with A[i]: suffix
    - dp to store all results
    - dp[i+1] = a[i+1]|{element in dp[i]}
    - The size of the set in dp[i] is <= 32. O(32N)
```java
public int subarrayBitwiseORs(int[] A) {
  Set<Integer> ans = new HashSet<>();
  Set<Integer> cur = new HashSet<>();
  for (int a : A) {
    Set<Integer> next = new HashSet<>();
    next.add(a);
    for (int b : cur)
      next.add(a | b);
    ans.addAll(next);
    cur = next;
  }
  return ans.size();
}
```

- [LeetCode 805 - Split Array With Same Average](https://leetcode.com/problems/split-array-with-same-average/discuss/127863/Share-a-Java-solution-using-DP)
  - [DP + DFS: store all values](https://leetcode.com/problems/split-array-with-same-average/discuss/127863/Share-a-Java-solution-using-DP)
  - [DP: dp[i][j] = dp[i][j] || dp[i-num][j - 1]](https://leetcode.com/problems/split-array-with-same-average/discuss/121140/DP-solution-in-C%2B%2B)
  - [dp[n][k][s] = dp[n-1][k][s] || dp[n-1][k-1][s - A[n - 1]]](https://leetcode.com/problems/split-array-with-same-average/discuss/121140/DP-solution-in-C%2B%2B)
  - [Enumerate len + DFS](https://leetcode.com/problems/split-array-with-same-average/discuss/120660/Java-accepted-recursive-solution-with-explanation)
```java
public boolean splitArraySameAverage(int[] A) {
    int sum = 0;
    for (int i : A) sum += i;
    if (!isPossible(sum, A.length)) return false;
    List<Set<Integer>> ls = new ArrayList<>();
    for (int i = 0; i <= A.length / 2; i++) {
        ls.add(new HashSet<>());
    }
    ls.get(0).add(0);
    for (int num : A) {
        for (int i = ls.size() - 1; i > 0; i--) {
            if (ls.get(i - 1).size() > 0) {
                for (int s : ls.get(i - 1)) ls.get(i).add(s + num);
            }
        }
    }
    for (int i = 1; i < ls.size(); i++) {
        if (sum * i % A.length == 0 && ls.get(i).contains(sum * i / A.length)) return true;
    }
    return false;
}
private boolean isPossible(int sum, int n) {
    for (int i = 1; i < n; i++) {
        if (sum * i % n == 0) return true;
    }
    return false;
}
```

- [LeetCode 813 - Largest Sum of Averages](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-813-largest-sum-of-averages/)
  - dp[k][i] = max(dp[k – 1][j] + sum(a[j] ~ a[i – 1]) / (i – j)) for j in k – 1,…,i-1.

### [Tower of People in Circus](https://github.com/careercup/CtCI-6th-Edition/tree/master/Java/Ch%2017.%20Hard/Q17_08_Circus_Tower)


### 状态压缩
- [LeetCode 956 - Tallest Billboard]
  - 
