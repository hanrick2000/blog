- pre-sort
  - then binary search or two pointers
  - [so it has some properties](https://leetcode.com/problems/largest-divisible-subset/discuss/84006/classic-dp-solution-similar-to-lis-on2)
  - so we can prune
- prefix-sum
  - binary search on prefix-sum
- group by length

#### Pre-Sort
- with extra info:
  - index
  - [rankbyXXX](http://www.hankcs.com/program/cpp/poj-2010-moo-university-financial-aid-binary-search.html)
- different sort:
  - [sort_by_score, sort_by_rank](http://www.hankcs.com/program/cpp/poj-2010-moo-university-financial-aid-binary-search.html)
- [LeetCode 962 - Maximum Width Ramp](https://www.acwing.com/solution/LeetCode/content/672/)
  - [minL + maxR and then two pointers](https://www.acwing.com/solution/LeetCode/content/672/)
  - [monotonic stack stores candidates then scan original data from end](https://www.acwing.com/solution/LeetCode/content/672/)
  - [pre-sort with element index](https://leetcode.com/articles/maximum-width-ramp/)
```Java
public int maxWidthRamp(int[] A) {
  int N = A.length;
  Integer[] B = new Integer[N];
  for (int i = 0; i < N; ++i)
    B[i] = i;

  Arrays.sort(B, (i, j) -> ((Integer) A[i]).compareTo(A[j]));

  int ans = 0;
  int m = N;
  for (int i : B) {
    ans = Math.max(ans, i - m);
    m = Math.min(m, i);
  }

  return ans;
}
```
  - [pre-sort with element index then two pointers](https://leetcode.com/problems/maximum-width-ramp/discuss/208328/Two-pointer-O(nlogn)-C%2B%2B-O(n)-space)
```java
public int maxWidthRamp(int[] A) {
    int modA[][] = new int[A.length][2];
    for (int i = 0 ; i < A.length ; i++)    {
        modA[i] = new int[] { A[i], i};
    }    
    Arrays.sort(modA, (m1, m2) -> m1[0] - m2[0]);    
    int i = 0;
    int j = 1;
    int maxWidth = 0;
    while (j < A.length)    {
        if (modA[j][1] > modA[i][1])    {
            maxWidth = Integer.max(maxWidth, modA[j][1] - modA[i][1]);
            j++;
        }
        else
            i++;
        
        if (i == j)
            j++;
    }    
    return maxWidth;
}
```

#### Pre-Sum
- pre-sum's remainder
- binary search on prefix-sum

##### Divisible
- mod, remainder
- frequency map(array) for mod
- special case: mod=0 or K/2
- same remainder, or remainder: i and k-i;

- [Subset with no pair sum divisible by K](https://www.geeksforgeeks.org/subset-no-pair-sum-divisible-k/)
- [Longest subarray with sum divisible by k](https://www.geeksforgeeks.org/longest-subarray-sum-divisible-k/)
  - mod_arr[i] = ((curr_sum % k) + k) % k; Map: remainder -> index

- [LeetCode 974 - Subarray Sums Divisible by K](https://leetcode.com/problems/subarray-sums-divisible-by-k/discuss/217985/JavaC%2B%2B-Count-the-Remainder)