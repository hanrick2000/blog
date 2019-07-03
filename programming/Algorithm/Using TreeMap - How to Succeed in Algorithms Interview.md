#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### Application of TreeMap
- find floor, ceiling
- next greater, previous smaller
- interval

### Make it sorted and traverse
- [LeetCode 853 - Car Fleet](https://leetcode.com/problems/car-fleet/discuss/139999/Easy-understanding-JAVA-TreeMap-Solution-with-explanation-and-comment)
```java
public int carFleet(int target, int[] position, int[] speed) {
    TreeMap<Integer, Integer> map = new TreeMap<>();
    int n = position.length;
    for(int i=0; i<n; ++i){
        map.put(target - position[i], speed[i]);
    }
    int count = 0;
    double r = -1.0;
    for(Map.Entry<Integer, Integer> entry: map.entrySet()){
        int d = entry.getKey(); // distance
        int s = entry.getValue(); // speed
        double t = 1.0*d/s; // time to target
        if(t>r){ // this car is unable to catch up previous one, form a new group and update the value
            ++count;
            r = t;
        }
    }
    return count;
}
```

### Find floor/ceiling
- [LeetCode 436 - Find Right Interval](https://leetcode.com/problems/find-right-interval/discuss/91789/java-clear-on-logn-solution-based-on-treemap)
  - TreeMap can simplify code related with binary search
```java
public int[] findRightInterval(Interval[] intervals) {
    int[] result = new int[intervals.length];
    java.util.NavigableMap<Integer, Integer> intervalMap = new TreeMap<>();
    for (int i = 0; i < intervals.length; ++i) {
        intervalMap.put(intervals[i].start, i);    
    }
    for (int i = 0; i < intervals.length; ++i) {
        Map.Entry<Integer, Integer> entry = intervalMap.ceilingEntry(intervals[i].end);
        result[i] = (entry != null) ? entry.getValue() : -1;
    }
    return result;
}
```

- [LeetCode 870 - Advantage Shuffle](https://leetcode.com/problems/advantage-shuffle/discuss/149840/C%2B%2BJava-Greedy-Solution-Using-Map)
```java
public int[] advantageCount(int[] A, int[] B) {
    TreeMap<Integer, Integer> m = new TreeMap<>();
    for (int i : A) m.put(i, m.getOrDefault(i, 0) + 1);
    int[] res = new int[A.length];
    for (int i = 0; i < A.length; ++i) {
        Integer x = m.higherKey(B[i]);
        if (x == null) x = m.firstKey();
        m.put(x, m.get(x) - 1);
        if (m.get(x) == 0) m.remove(x);
        res[i] = x;
    }
    return res;
}
```
- [LeetCode 239 - Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/discuss/65884/java-on-solution-using-deque-with-explanation)
- [HARD LeetCode 862 - Shortest Subarray with Sum at Least K](https://leetcode.com/articles/shortest-subarray-with-sum-atleast-k/)
  - [monotone queue on prefix sum](https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k/discuss/143726/C%2B%2BJavaPython-O(N)-Using-Deque)
    - store the possible values of the start pointer in the queue
    <!-- -
    http://hehejun.blogspot.com/2018/07/leetcodeshortest-subarray-with-sum-at.html
    如果对于i < j，presum[i] >= presum[j]的情况，显然对于j之后的index k。如果presum[k] - presum[i]大于等于K，那么因为presum[k] - presum[j] >= presum[k] - presum[i]，所以presum[k] - presum[j]必定也满足条件而且[j + 1, k]这个区间比[i + 1, k]更短
    对于j > i，如果j是满足presum[j] - presum[i] >= K的最小值。那么对于k > j，我们不需要考虑presum[k] - presum[i]了，因为即使区间和大于K也比[i +1, j]要长
    -->
  - [bisection: O(nlognlogn)](https://ttzztt.gitbooks.io/lc/content/combination/shortest-subarray-with-sum-at-least-k.html)
  - [TreeMap: prune bad candidates](https://ttzztt.gitbooks.io/lc/content/combination/shortest-subarray-with-sum-at-least-k.html)
```java
public int shortestSubarray(int[] A, int K) {
     if (A.length == 0) return -1;
     TreeMap<Long, Integer> map = new TreeMap();
     map.put(0L, -1); // pay attention to the initial state
     long cumSum = 0; // sum of range[0-->i]
     int minLen = Integer.MAX_VALUE;
     for (int i = 0; i < A.length; i++) {
         // get cur cumSum
         cumSum += A[i];
         // find all candidates and update res (firstKey() will throw exception if map is empty)
         Long lowestKey = map.firstKey(), floorKey = map.floorKey(cumSum - K);
         if (lowestKey != null && floorKey != null) {
             Map<Long, Integer> subMap = new HashMap(map.subMap(lowestKey, true, floorKey, true));
             for (Long key: subMap.keySet()) {
                 int curLen = i - subMap.get(key);
                 if (minLen > curLen) minLen = curLen;  // update res
                 map.remove(key);                  // prune bad candidate
             }
         }
         // put new cumSum to tree
         map.put(cumSum, i);
     }
     return minLen == Integer.MAX_VALUE ? -1 : minLen;
 }
```

- [LintCode 360 - Sliding Window Median](https://zhengyang2015.gitbooks.io/lintcode/sliding_window_median_360.html)
  - TreeMap as maxHeap and minHeap but Ologn for remove

### Examples
- [LintCode 502 - Mini Cassandra](https://blog.csdn.net/jmspan/article/details/51749526)
- [TimeTravelingHashTable: Map<String, TreeMap<Integer, String>> map](https://gist.github.com/bookybooky/a4161cdd3fdd6200cd33d06014a68019)
- [LeetCode 846 - Hand of Straights](https://leetcode.com/problems/hand-of-straights/discuss/135598/C%2B%2BJavaPython-O(MlogM)-Complexity)
  - TreeMap
  - Remainder
- [LeetCode 954 - Array of Doubled Pairs](https://leetcode.com/problems/array-of-doubled-pairs/discuss/203183/JavaC%2B%2BPython-Match-from-the-Smallest-or-Biggest-100)
  - starting point: min/max value
  - O(nlogk): k is the count of distinct values
```java
public boolean canReorderDoubled(int[] A) {
    Map<Integer, Integer> count = new TreeMap<>();
    for (int a : A)
        count.put(a, count.getOrDefault(a, 0) + 1);
    for (int x : count.keySet()) {
        if (count.get(x) == 0) continue;
        int want = x < 0 ? x / 2 : x * 2;
        if (x < 0 && x % 2 != 0 || count.get(x) > count.getOrDefault(want, 0))
            return false;
        count.put(want, count.get(want) - count.get(x));
    }
    return true;
}
```

- [LeetCode 975 - Odd Even Jump](https://leetcode.com/problems/odd-even-jump/discuss/217981/JavaC%2B%2BPython-DP-idea-Using-TreeMap-or-Stack)
  - scan backward + use TreeMap to find floor, ceiling
```java
public int oddEvenJumps(int[] A) {
    int n  = A.length, res = 1;
    boolean[] higher = new boolean[n], lower = new boolean[n];
    higher[n - 1] = lower[n - 1] = true;
    TreeMap<Integer, Integer> map = new TreeMap<>();
    map.put(A[n - 1], n - 1);
    for (int i = n - 2; i >= 0; --i) {
        Map.Entry hi = map.ceilingEntry(A[i]), lo = map.floorEntry(A[i]);
        if (hi != null) higher[i] = lower[(int)hi.getValue()];
        if (lo != null) lower[i] = higher[(int)lo.getValue()];
        if (higher[i]) res++;
        map.put(A[i], i);
    }
    return res;
}
```

- [LeetCode 911 - Online Election](https://leetcode.com/problems/online-election/discuss/173387/Java-two-methods-with-comment-using-TreeMap-and-binary-search-respectively)
```java
private TreeMap<Integer, Integer> tm = new TreeMap<>(); // time and leading candidate
public TopVotedCandidate(int[] persons, int[] times) {
    int[] count = new int[persons.length]; // count[i]: count of votes for persons[i].
    for (int i = 0, max = -1; i < times.length; ++i) {
        ++count[persons[i]]; // at times[i], persons[i] got a vote.
        if (max <= count[persons[i]]) { // is persons[i] leading?
            max = count[persons[i]]; // update leading count.
            tm.put(times[i], persons[i]); // update leading candidate.
        }
    }
}
public int q(int t) {
    return tm.floorEntry(t).getValue(); // fetch the corresponding information.
}

private Map<Integer, Integer> map = new HashMap<>(); // time and leading candidate
private int[] times;
public TopVotedCandidate(int[] persons, int[] times) {
    this.times = times;
    int[] count = new int[persons.length + 1]; // count[i]: count of votes for persons[i].
    for (int i = 0, winner = -1; i < times.length; ++i) {
        ++count[persons[i]]; // at times[i], persons[i] got a vote.
        // is persons[i] leading? update winner.
        if (map.isEmpty() || count[winner] <= count[persons[i]]) { winner = persons[i]; }
        map.put(times[i], winner); // update time and winner.
    }
}
public int q(int t) {
    int idx = Arrays.binarySearch(times, t); // search for the time slot.
    return map.get(times[idx < 0 ? -idx - 2 : idx]); // fetch the corresponding information.
}
```
### Methods of TreeMap
```java
treeMap.subMap(column_start, true, column_end, true);
map.put(item, map.getOrDefault(item,0)+1);
map.merge(item, 1, Integer::sum)
map.merge(key, msg, String::concat)
```