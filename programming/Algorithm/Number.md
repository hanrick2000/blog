#### Reach a number
- [Minimum time to reach a point with +t and -t moves at time t](https://www.geeksforgeeks.org/minimum-time-to-reach-a-point-with-t-and-t-moves-at-time-t/)
- [LeetCode 754 - Reach A Number: during the n-th move (starting from 1), you take n steps](https://leetcode.com/problems/reach-a-number/discuss/112968/Short-JAVA-Solution-with-Explanation)
  - For ith move, if we switch the right move to the left, the change in summation will be 2*i less
  - If the difference value is odd, we need to increase the step until the difference is even
```java
public int reachNumber(int target) {
    target = Math.abs(target);
    int step = 0;
    int sum = 0;
    while (sum < target) {
        step++;
        sum += step;
    }
    while ((sum - target) % 2 != 0) {
        step++;
        sum += step;
    }
    return step;
}
```
#####
- [Minimum cost to reach a point N from 0 with two different operations allowed](https://www.geeksforgeeks.org/minimum-cost-to-reach-a-point-n-from-0-with-two-different-operations-allowed/)
- [LeetCode 991 - Broken Calculator: Double or ++](https://leetcode.com/problems/broken-calculator/discuss/234484/JavaC%2B%2BPython-Change-Y-to-X-in-1-Line)
  - guess, assume and prove/anti-example
  - from target to source
```java
public int brokenCalc(int X, int Y) {
  int ans = 0;
  while (Y > X) {
    ans++;
    if (Y % 2 == 1)
      Y++;
    else
      Y /= 2;
  }
  return ans + X - Y;
}
```

### Trailing Zero
- [LeetCode 175 - Factorial Trailing Zeroes](https://leetcode.com/problems/factorial-trailing-zeroes/discuss/52367/My-explanation-of-the-Log(n)-solution)
  - count = n / 5 + n / 25 + n / 125 + ...

- [HARD LeetCode 793 - Preimage Size of Factorial Zeroes Function](https://leetcode.com/problems/preimage-size-of-factorial-zeroes-function/discuss/117821/Four-binary-search-solutions-based-on-different-ideas)
  - Let f(x) be the number of zeroes at the end of x!. Given K, find how many non-negative integers x have the property that f(x) = K.
  - bisection on functions
```java
int preimageSizeFZF(int K) {
    long left = 0, right = 5L * (K + 1);
    while (left <= right) {
        long mid = left + (right - left) / 2;
        long num = numOfTrailingZeros(mid);
        if (num < K) {
            left = mid + 1;
        } 
        else if (num > K) {
            right = mid - 1;
        } 
        else {
            return 5;
        }
    }
    return 0;
}
```
