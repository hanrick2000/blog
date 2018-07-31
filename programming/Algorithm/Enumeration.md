### enumerate
 
- [LeetCode 910 - Smallest Range II](https://leetcode.com/problems/smallest-range-ii/discuss/173505/Java-Solution-with-the-Picture-to-explain-it)
  - presort, two parts, for every index, enumerate 
```java
public int smallestRangeII(int[] A, int K) {
    Arrays.sort(A);
    int n = A.length;
    int res = A[n - 1] - A[0];
    for (int i = 0; i < n - 1; i++) {
        int max = Math.max(A[i] + K, A[n - 1] - K);
        int min = Math.min(A[i + 1] - K, A[0] + K);
        res = Math.min(res, max - min);
    }
    return res;
}
```

#### Enumerate different cases and get min/max
- [LeetCode 857 - Minimum Cost to Hire K Workers](https://leetcode.com/problems/minimum-cost-to-hire-k-workers/discuss/185085/75ms-Java-with-Explanations)
  - sort by ratio and try all ratio
  - use PQ to remove max quality
```java
public double mincostToHireWorkers(int[] quality, int[] wage, int K) {       
    int numWorkers = quality.length;
    /* qualityRatio[i] = {quality, wage[i] / quality[i]}. */
    double[][] qualityRatio = new double[numWorkers][2];
    for (int i = 0; i < numWorkers; i++) {
        qualityRatio[i][0] = quality[i];
        qualityRatio[i][1] = (double) wage[i] / quality[i];
    }
    Arrays.sort(qualityRatio, (a, b) -> Double.compare(a[1], b[1]));
    double minSumSalary = Integer.MAX_VALUE;
    int sumQuality = 0;;
    /* Always remove maximum quality. */
    PriorityQueue<Integer> maxHeap = new PriorityQueue<>((a, b) -> Integer.compare(b, a));
    for (int i = 0; i < numWorkers; i++) {
        maxHeap.add((int)qualityRatio[i][0]);
        sumQuality += qualityRatio[i][0];
        if (maxHeap.size() > K) {
            int qualityPolled = maxHeap.poll();
            sumQuality -= qualityPolled;
        }        
        if (maxHeap.size() == K) {
            /* Calculate sumSalary. */
            double curRatio = qualityRatio[i][1];
            minSumSalary = Math.min(minSumSalary, sumQuality * curRatio);
        }
    }    
    return minSumSalary;
}
```
- [POJ 3614 [zoj 3508] -- Sunscreen](https://www.cnblogs.com/dilthey/p/6804156.html)