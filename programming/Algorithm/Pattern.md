- assumption
- Starting points: square
- 

#### Example -> Pattern

- [LeetCode 319 - Bulb Switcher](https://leetcode.com/problems/bulb-switcher/discuss/77104/Math-solution..)
```java
int bulbSwitch(int n) {
    return sqrt(n);
}
```
- [LeetCode 553 - Optimal Division](https://leetcode.com/articles/optimal-division/)
  - [2: dfs](https://leetcode.com/articles/optimal-division/)

- [LeetCode 397 - Integer Replacement](https://leetcode.com/problems/integer-replacement/discuss/87920/A-couple-of-Java-solutions-with-explanations)
```text
If n is even, halve it.
If n=3 or n-1 has less 1's than n+1, decrement n.
Otherwise, increment n.
```

#### F(i) - F(i-1)
- [LeetCode LeetCode 396 - Rotate Function](https://www.cnblogs.com/grandyang/p/5869791.html)
```java
public int maxRotateFunction(int[] A) {
 int n = A.length;
 int sum = 0;
 int candidate = 0;
 for (int i = 0; i < n; i++) {
  sum += A[i];
  candidate += A[i] * i;
 }
 int best = candidate;

 for (int i = n - 1; i > 0; i--) {
  candidate = candidate + sum - A[i] * n;
  best = Math.max(best, candidate);
 }
 return best;
}
```