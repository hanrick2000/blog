- [@HARD LeetCode 793 - Preimage Size of Factorial Zeroes Function](https://leetcode.com/problems/preimage-size-of-factorial-zeroes-function/discuss/117821/Four-binary-search-solutions-based-on-different-ideas)
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




