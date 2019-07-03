#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### Applications of Greedy Algorithm
- Optimize DP or other solution from O(n^2) to O(n)
- strategy used to pick element

#### Usually used together with Greedy Algorithm
- sort
- [PriorityQueue to get/remove min/max](https://www.cnblogs.com/dilthey/p/6804156.html)
- Bisection, two pointers, sliding window

### How
- Record/Update maxReach

### Examples
- [LeetCode 984 -  String Without AAA or BBB](https://leetcode.com/problems/string-without-aaa-or-bbb/discuss/226649/JavaC%2B%2B-(and-Python)-simple-greedy)
```java
public String strWithout3a3b(int A, int B) {
  StringBuilder res = new StringBuilder(A + B);
  char a = 'a', b = 'b';
  int i = A, j = B;
  if (B > A) { a = 'b'; b = 'a'; i = B; j = A; }
  while (i-- > 0) {
    res.append(a);
    if (i > j) { res.append(a); --i; }
    if (j-- > 0) res.append(b);
  }
  return res.toString();
}
```
- [LeetCode 55 - Jump Game](https://leetcode.com/articles/jump-game/)
  - track maxReach
  - [from target to source](https://leetcode.com/articles/jump-game/)
- [LeetCode 45 - Jump Game II](https://www.programcreek.com/2014/06/leetcode-jump-game-ii-java/)
```java
public int jump(int[] A) {
    int jumps = 0, curEnd = 0, curFarthest = 0;
    for (int i = 0; i < A.length - 1; i++) {
        curFarthest = Math.max(curFarthest, i + A[i]);
        if (i == curEnd) {
            jumps++;
            curEnd = curFarthest;
        }
    }
    return jumps;
}

int jump(int A[], int n) {
    int curMax = 0, steps = 0, i = 0;
    while(curMax<n-1) {
        int lastMax = curMax;
        for(; i<=lastMax; i++)
            curMax = max(curMax,i+A[i]);
        steps++;
        if(lastMax == curMax) return -1;
    }
    return steps;
}
```
- [LeetCode 646 - Maximum Length of Pair Chain](https://leetcode.com/articles/maximum-length-of-pair-chain/)
  - sort then greedy: O(nlogn)
  - [sort + stack](http://www.cnblogs.com/grandyang/p/7381633.html)
  - [sort then dp: O(n^2) dp[i][j] = max(dp[i][j], dp[i][k]+1 when pairs[k][1] < pairs[j][0])](https://leetcode.com/articles/maximum-length-of-pair-chain/)

```java
public int findLongestChain(int[][] pairs) {
    Arrays.sort(pairs, (a,b) -> a[1] - b[1]);
    int sum = 0, n = pairs.length, i = -1;
    while (++i < n) {
        sum++;
        int curEnd = pairs[i][1];
        while (i+1 < n && pairs[i+1][0] <= curEnd) i++;
    }
    return sum;
}
```

### Hard
- [LeetCode 995 - Minimum Number of K Consecutive Bit Flips](https://www.cnblogs.com/lz87/p/10398670.html)
  - the minimum number of K-bit flips required so that there is no 0 in the array
  - Greedy + Starting point: first 0

```java
public int minKBitFlips(int[] A, int K) {
    int count = 0;
    for(int i = 0; i < A.length; i++) {
        if(A[i] == 0 && i + K <= A.length) {
            for(int j = 0; j < K; j++) {
                A[i + j] = A[i + j] == 0 ? 1 : 0;
            }
            count++;
        }
        else if(A[i] == 0) {
            return -1;
        }
    }
    return count;
}
//
public int minKBitFlips(int[] A, int K) {
    int totalFlips = 0, currentEffectiveFlips = 0;
    Deque<Integer> flipIndices = new ArrayDeque<>();
    for(int i = 0; i < A.length; i++) {
        if(flipIndices.size() > 0 && flipIndices.peekFirst() + K == i) {
            flipIndices.remove();
            currentEffectiveFlips--;
        }
        if(A[i] == 0 && currentEffectiveFlips % 2 == 0
           || A[i] == 1 && currentEffectiveFlips % 2 != 0) {
            if(i + K > A.length) {
                return -1;
            }
            flipIndices.addLast(i);
            currentEffectiveFlips++;
            totalFlips++;
        }
    }
    return totalFlips;
}
```

#### Sort multiple arrays then two pointers
- starting points: min/max
- [LeetCode 826 - Most Profit Assigning Work](https://leetcode.com/problems/most-profit-assigning-work/discuss/127031/C++JavaPython-Sort-and-Two-pointer)
  - [sort then two pointers](https://leetcode.com/problems/most-profit-assigning-work/discuss/127031/C++JavaPython-Sort-and-Two-pointer)
  - [TreeMap](https://leetcode.com/problems/most-profit-assigning-work/discuss/127133/Java-Solution-with-TreeMap)

### Multiple criteria
- sort by one, scan them
- use PQ to store them in another order

#### Sort + PriorityQueue to get/remove min/max
- [LeetCode 630 - Course Schedule III](https://leetcode.com/problems/course-schedule-iii/discuss/104845/short-java-code-using-priorityqueue)
```java
public int scheduleCourse(int[][] courses) {
    Arrays.sort(courses,(a,b)->a[1]-b[1]); //Sort the courses by their deadlines (Greedy! We have to deal with courses with early deadlines first)
    PriorityQueue<Integer> pq=new PriorityQueue<>((a,b)->b-a);
    int time=0;
    for (int[] c:courses)
    {
        time+=c[0]; // add current course to a priority queue
        pq.add(c[0]);
        if (time>c[1]) time-=pq.poll(); //If time exceeds, drop the previous course which costs the most time. (That must be the best choice!)
    }        
    return pq.size();
}
```
- [LeetCode 502 - IPO](http://bookshadow.com/weblog/2017/02/05/leetcode-ipo/)
  - [sort + PQ](http://bookshadow.com/weblog/2017/02/05/leetcode-ipo/)
  - [2 PriorityQueue](https://leetcode.com/problems/ipo/discuss/98210/very-simple-greedy-java-solution-using-two-priorityqueues)

```java
public int findMaximizedCapital(int k, int W, int[] Profits, int[] Capital) {
    int size = Profits.length;
    int ans = W;
    Point projects[] = new Point[size];
    for (int i = 0; i < projects.length; i++) {
        projects[i] = new Point(Capital[i], Profits[i]);
    }
    Arrays.sort(projects, new Comparator<Point>(){
        public int compare(Point a, Point b) {
            if (a.x == b.x)
                return a.y - b.y;
            return a.x - b.x;
        }
    });
    PriorityQueue<Integer> pq = new PriorityQueue<Integer>(Comparator.reverseOrder());
    int j = 0;
    for (int i = 0; i < Math.min(k, size); i++) {
        while(j < size && projects[j].x <= ans) {
            pq.add(projects[j].y);
            j++;
        }
        if (!pq.isEmpty())
            ans += pq.poll();
    }
    return ans;
}
```

#### Enumerate + use PQ to get/remove min/max
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

#### Proof
- [LeetCode 881 - Boats to Save People](https://leetcode.com/problems/boats-to-save-people/discuss/156855/6-lines-Java-O(nlogn)-code-sorting-%2B-greedy-with-greedy-algorithm-proof)

