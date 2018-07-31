- sort with index
### Related
- two pointers: -> <- or <- ->
- when order doesn't matter: min, max, or, and

- [Longest Arithmetic Progression of sorted array](https://orajavasolutions.wordpress.com/2014/06/28/length-of-longest-arithmetic-progression/)
  - starting point: 3 values, fix the middle value
  - simplify the question to find if there exist three elements in Arithmetic Progression or not
  - DP + two pointers: fix middle, <- middle ->
- [LeetCode 891 - Sum of Subsequence Widths](https://leetcode.com/problems/sum-of-subsequence-widths/discuss/161267/C++Java1-line-Python-Sort-and-One-Pass?page=2)
  - presort
```java
public int sumSubseqWidths(int[] A) {
  int MOD = 1_000_000_007;
  int N = A.length;
  Arrays.sort(A);
  long[] pow2 = new long[N];
  pow2[0] = 1;
  for (int i = 1; i < N; ++i)
    pow2[i] = pow2[i - 1] * 2 % MOD;
  long ans = 0;
  for (int i = 0; i < N; ++i)
    ans = (ans + (pow2[i] - pow2[N - 1 - i]) * A[i]) % MOD;
  return (int) ans;
}
```

### Sort with custom comparator
- then reorder
- [LeetCode 406 - Queue Reconstruction by Height](https://leetcode.com/problems/queue-reconstruction-by-height/discuss/89359/Explanation-of-the-neat-Sort+Insert-solution)
  - People are only counting (in their k-value) taller or equal-height others standing in front of them. So a smallest person is completely irrelevant for all taller ones.
  - starting point: tallest
```java
public int[][] reconstructQueue(int[][] people) {
  // pick up the tallest guy first
  // when insert the next tall guy, just need to insert him into kth position
  // repeat until all people are inserted into list
  Arrays.sort(people, new Comparator<int[]>() {
    @Override
    public int compare(int[] o1, int[] o2) {
      return o1[0] != o2[0] ? -o1[0] + o2[0] : o1[1] - o2[1];
    }
  });
  List<int[]> res = new LinkedList<>();
  for (int[] cur : people) {
    if (cur[1] >= res.size())
      res.add(cur);
    else
      res.add(cur[1], cur);
  }
  return res.toArray(new int[people.length][]);
}
```
### sort with index
- [LeetCode 506 - Relative Ranks](https://leetcode.com/problems/relative-ranks/discuss/98468/Easy-Java-Solution-Sorting.)
  - [sort with index](https://leetcode.com/problems/relative-ranks/discuss/98468/Easy-Java-Solution-Sorting.)
  - [Counting Sort: O(max(n))](https://leetcode.com/problems/relative-ranks/discuss/98492/Java-6ms-solution-O(n)-without-sorting)

- [Sort an array of 0s, 1s and 2s](https://www.geeksforgeeks.org/sort-an-array-of-0s-1s-and-2s/)
```java
// a[1..Lo-1] zeroes (red)
// a[Lo..Mid-1] ones (white)
// a[Mid..Hi] unknown
// a[Hi+1..N] twos (blue)
// http://www.zrzahid.com/dutch-national-flag-dnf-problem-3-way-partitioning/
static void sort012(int a[], int arr_size) 
{ 
    int lo = 0; 
    int hi = arr_size - 1; 
    int mid = 0,temp=0; 
    while (mid <= hi) 
    { 
        switch (a[mid]) 
        { 
        case 0: 
        { 
            swap(a, lo, mid);
            lo++; 
            mid++; 
            break; 
        } 
        case 1: 
            mid++; 
            break; 
        case 2: 
        { 
            swap(a, mid, high);
            hi--; 
            break; 
        } 
        } 
    } 
}
```