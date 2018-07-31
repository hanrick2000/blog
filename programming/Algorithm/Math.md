### Expected Value
- E(x) = sigma f(x)p(x)
### Combinatorics
- [LeetCode 634 - Find the Derangement of An Array](https://www.geeksforgeeks.org/count-derangements-permutation-such-that-no-element-appears-in-its-original-position/)
	- cases: countDer(n) = (n - 1) * [countDer(n - 1) + countDer(n - 2)]


### GCD
- while b > 0: (a, b) = (b, a % b)
```java
int gcd(int u, int v) {
	if (v == 0) {
		return u;
	}
	return gcd(v, u % v);
}
int lcm = A / gcd(A, B) * B;
```


### inclusion exclusion principle
- [LeetCode 878 - Nth Magical Number](https://leetcode.com/articles/nth-magical-number/)
  - n = X / A + X / B – X / lcm(A, B) = X / A + X / B – X / (A * B / gcd(A, B))


### [Combinatorics](https://www.mathsisfun.com/combinatorics/combinations-permutations.html)
#### Permutation
- Permutations with Repetition: N^K
- Permutations without Repetition
	- P(N,K) = N!/(N-K)!
#### Combinations
- Combinations without Repetition
	- C(N,K) = P(N,K)/K! = N!/((N-K)!K!) = ((n - k + 1) * (n - k + 2) * ... * n) / k!
- (N choose K+1) = (N choose K) * (N-K)/(K+1)
- C(N,K) = C(N-1, K) + C(N-1, K-1)
	- include nth or not
#### [Binomial Coefficient](https://www.geeksforgeeks.org/binomial-coefficient-dp-9/)

 - [LeetCode 62 - Unique Paths](https://leetcode.com/problems/unique-paths/discuss/22981/My-AC-solution-using-formula)
	 - C(m + n - 2, n - 1)

### Catalan number
<img src='http://i.imgur.com/hVkEdbp.png' />
```java
h(n) = h(1)*h(n-1) + h(2)*h(n-2) + ... + h(n-1)h(1)
h(n) = C(2n-2,n-1)/n
C(n, k) = n!/((n-k)! * k!)


```
- [LeetCode 96 - Unique Binary Search Trees I](https://leetcode.com/problems/unique-binary-search-trees/discuss/31666/DP-Solution-in-6-lines-with-explanation.-F(i-n)-G(i-1)-\*-G(n-i))
  - G(n): the number of unique BST for a sequence of length n.
  - F(i, n), 1 <= i <= n: the number of unique BST, where the number i is the root of BST, and the sequence ranges from 1 to n.
  - F(i, n) = G(i-1) * G(n-i)
  - G(n) = F(1, n) + F(2, n) + ... + F(n, n) = G(0) * G(n-1) + G(1) * G(n-2) + … + G(n-1) * G(0)
  - [Catalan number]


- [LeetCode 907 - Sum of Subarray Minimums](https://zxi.mytechroad.com/blog/stack/leetcode-907-sum-of-subarray-minimums/)
```text
For A[i], assuming there are L numbers that are greater than A[i] in range A[0] ~ A[i – 1], and there are R numbers that are greater or equal than A[i] in the range of A[i+1] ~ A[n – 1]. Thus A[i] will be the min of (L + 1) * (R + 1) subsequences.
e.g. A = [3,1,2,4], A[1] = 1, L = 1, R = 2, there are (1 + 1) * (2 + 1) = 6 subsequences are 1 is the min number. [3,1], [3,1,2], [3,1,2,4], [1], [1,2], [1,2,4]
```

- [LeetCode 621 - Task Scheduler](https://leetcode.com/articles/task-scheduler/)
  - [math: (maxFreq -1)x(interval+1)+(cnt of maxFreq)](https://github.com/mintycc/OnlineJudge-Solutions/blob/master/Leetcode/621_Task_Scheduler.java)
  - PriorityQueue
```java
public int leastInterval(char[] tasks, int n) {
		char[] cnt = new char[26];
		int maxn = 0;
		for (int task : tasks) {
				cnt[task - 'A'] ++;
				maxn = Math.max(maxn, cnt[task - 'A']);
		}
		int ans = (maxn - 1) * (n + 1);
		for (int i = 0; i < 26; i ++)
				if (cnt[i] == maxn)
						ans ++;
		return Math.max(ans, tasks.length);
}
```
- [LeetCode 892 - Surface Area of 3D Shapes](https://leetcode.com/articles/surface-area-of-3d-shapes/)
```java
//https://leetcode.com/problems/surface-area-of-3d-shapes/discuss/163414/C%2B%2BJava1-line-Python-Minus-Hidden-Area
public int surfaceArea(int[][] grid) {
		int res = 0, n = grid.length;
		for (int i = 0; i < n; ++i) {
				for (int j = 0; j < n; ++j) {
						if (grid[i][j] > 0) res += grid[i][j] * 4 + 2;
						if (i > 0) res -= Math.min(grid[i][j], grid[i - 1][j]) * 2;
						if (j > 0) res -= Math.min(grid[i][j], grid[i][j - 1]) * 2;
				}
		}
		return res;
}
```

### Divisible
- n*k
- %, remainder map
- [LeetCode 1013 - Pairs of Songs With Total Durations Divisible by 60](https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/discuss/256738/JavaC%2B%2BPython-Two-Sum-with-K-60)

- [LeetCode 523 - Continuous Subarray Sum](https://leetcode.com/problems/continuous-subarray-sum/discuss/99499/java-on-time-ok-space)
  - if the array has a continuous subarray of size at least 2 that sums up to the multiple of k, that is, sums up to n*k where n is also an integer
  - same remainder, n*k
```Java
public boolean checkSubarraySum(int[] nums, int k) {
    Map<Integer, Integer> map = new HashMap<Integer, Integer>(){{put(0,-1);}};;
    int runningSum = 0;
    for (int i=0;i<nums.length;i++) {
        runningSum += nums[i];
        if (k != 0) runningSum %= k; 
        Integer prev = map.get(runningSum);
        if (prev != null) {
            if (i - prev > 1) return true;
        }
        else map.put(runningSum, i);
    }
    return false;
}
```

- [LeetCode 1006 - Clumsy Factorial](https://leetcode.com/problems/clumsy-factorial/discuss/252247/C%2B%2BJava-Brute-Force)
  - [Find the loop](https://leetcode.com/problems/clumsy-factorial/discuss/252247/C%2B%2BJava-Brute-Force)
```java
public int clumsy(int N) {
    if (N == 0) return 0;
    if (N == 1) return 1;
    if (N == 2) return 2;
    if (N == 3) return 6;
    return N * (N - 1) / (N - 2) + helper(N - 3);
}
public int helper(int N) {
    if (N == 0) return 0;
    if (N == 1) return 1;
    if (N == 2) return 1;
    if (N == 3) return 1;
    return N - (N - 1) * (N - 2) / (N - 3) + helper(N - 4);
}
```

### Manhattan Distance
- sum(|p2.x - p1.x| + |p2.y - p1.y|)
- Calculate x, y separately
- **BFS**
- [LeetCode 296 - Best Meeting Point](http://www.cnblogs.com/grandyang/p/5291058.html)
<!-- 
https://www.jiuzhang.com/qa/885/
初阶：在一个n*m的矩阵中，有k个点，求矩阵中距离这k个点的距离和最近的点。
进阶：如果要求这个点与所给的k个点不重合，该怎么办？ -->


- [LeetCode 413 - Arithmetic Slices](https://leetcode.com/problems/arithmetic-slices/discuss/90058/simple-java-solution-9-lines-2ms)
```java
public int numberOfArithmeticSlices(int[] A) {
    int curr = 0, sum = 0;
    for (int i=2; i<A.length; i++)
        if (A[i]-A[i-1] == A[i-1]-A[i-2]) {
            curr += 1;//\\
            sum += curr;//\\
        } else {
            curr = 0;
        }
    return sum;
}
```
