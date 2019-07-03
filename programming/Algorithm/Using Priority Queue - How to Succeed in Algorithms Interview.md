#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Applications of Priority Queue
- TopK

#### Implementation
- Use poll, peek, offer
- Don't use remove (if need update it: just keep the old one and add a new one)
- Alternation: use TreeSet/Map

#### Order - How to add elements
- [LeetCode - 719 Find K-th Smallest Pair Distance](https://leetcode.com/articles/find-k-th-smallest-pair-distance/)
  - add neighbor pairs first

```java
for (int i = 0; i + 1 < nums.length; ++i) {
    heap.offer(new Node(i, i+1));
}

Node node = null;
for (; k > 0; --k) {
    node = heap.poll();
    if (node.nei + 1 < nums.length) {
        heap.offer(new Node(node.root, node.nei + 1));
    }
}
```

#### Merge k sorted list
- Element: [outerIndex, innerIndex]
- Iterator

##### Examples
- [LeetCode 23 - Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/discuss/10528/A-java-solution-based-on-Priority-Queue)
- [LeetCode 632 - Smallest Range (shortest range in k-sorted lists)](https://leetcode.com/problems/smallest-range/discuss/104893/java-code-using-priorityqueue-similar-to-merge-k-array)
  - [PriorityQueue: track min and max during merge](https://discuss.leetcode.com/topic/94445/java-code-using-priorityqueue-similar-to-merge-k-array)
  - [sliding window: o(nlogn) - not best](http://www.cnblogs.com/grandyang/p/7200016.html)
- [LeetCode 759 - Employee Free Time](https://www.cnblogs.com/Dylan-Java-NYC/p/9399311.html)
  1. [Boundary count](http://www.cnblogs.com/grandyang/p/8552586.html)
  2. [sort intervals, not use the order of each employee's interval: O(nlogn)](https://segmentfault.com/a/1190000016324456)
  3. [PriorityQueue: O(nlogk)](https://www.cnblogs.com/Dylan-Java-NYC/p/9399311.html)

```java
public List<Interval> employeeFreeTime(List<List<Interval>> schedule) {
  List<Interval> res = new ArrayList<Interval>();
  PriorityQueue<Node> minHeap = new PriorityQueue<Node>(
      (a, b) -> schedule.get(a.employee).get(a.index).start - schedule.get(b.employee).get(b.index).start);
  int start = Integer.MAX_VALUE;
  for (int i = 0; i < schedule.size(); i++) {
    minHeap.add(new Node(i, 0));
    start = Math.min(start, schedule.get(i).get(0).start);
  }
  while (!minHeap.isEmpty()) {
    Node cur = minHeap.poll();
    if (start < schedule.get(cur.employee).get(cur.index).start) {
      res.add(new Interval(start, schedule.get(cur.employee).get(cur.index).start));
    }
    start = Math.max(start, schedule.get(cur.employee).get(cur.index).end);
    cur.index++;
    if (cur.index < schedule.get(cur.employee).size()) {
      minHeap.add(cur);
    }
  }
  return res;
}
class Node {
  int employee;
  int index;
  public Node(int employee, int index) {
    this.employee = employee;
    this.index = index;
  }
}
```

#### Examples
- [LeetCode 264 - Ugly Number II](https://leetcode.com/problems/ugly-number-ii/discuss/69362/O(n)-Java-solution)
  - O(nk) or [O(nlogk)](https://leetcode.com/problems/ugly-number-ii/discuss/69372/Java-solution-using-PriorityQueue)
- [LeetCode 313 - Super Ugly Number](https://leetcode.com/problems/super-ugly-number/discuss/76291/Java-three-methods-23ms-36-ms-58ms(with-heap)-performance-explained)
  - O(NlogK) or [O(nk)](https://leetcode.com/problems/super-ugly-number/discuss/76291/Java-three-methods-23ms-36-ms-58ms(with-heap)-performance-explained)

```java
public int nthSuperUglyNumber(int n, int[] primes) {
    int[] ugly = new int[n];
    int[] idx = new int[primes.length];
    int[] val = new int[primes.length];
    Arrays.fill(val, 1);

    int next = 1;
    for (int i = 0; i < n; i++) {
        ugly[i] = next;

        next = Integer.MAX_VALUE;
        for (int j = 0; j < primes.length; j++) {
            //skip duplicate and avoid extra multiplication
            if (val[j] == ugly[i]) val[j] = ugly[idx[j]++] * primes[j];
            //find next ugly number
            next = Math.min(next, val[j]);
        }
    }
    return ugly[n - 1];
}

public int nthSuperUglyNumberHeap(int n, int[] primes) {
    int[] ugly = new int[n];
    PriorityQueue<Num> pq = new PriorityQueue<>();
    for (int i = 0; i < primes.length; i++) pq.add(new Num(primes[i], 1, primes[i]));
    ugly[0] = 1;
    for (int i = 1; i < n; i++) {
        ugly[i] = pq.peek().val;
        while (pq.peek().val == ugly[i]) {
            Num nxt = pq.poll();
            pq.add(new Num(nxt.p * ugly[nxt.idx], nxt.idx + 1, nxt.p));
        }
    }
    return ugly[n - 1];
}
```

- [LeetCode 871 - Minimum Number of Refueling Stops](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/149867/Simple-Java-using-pq-with-explanation)
  - [Greedy + PQ, curFarthest: O(NlogN)](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/149867/Simple-Java-using-pq-with-explanation)
    - Use PQ to store potential refuel stations
  - [DP: variables/states: station, refuel stops](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/151850/C%2B%2B-DP-solution-Space-complexity-from-O(n2)-to-O(n).)
    - dp[i][j] the farthest location we can get to using exactly j refueling stops among the first i refueling stops for j<i; dp[i][j] = max(dp[i][j], dp[i-1][j-1] + stations[i][1], dp[i-1][j])
    - [reduce space: dp[t] means the furthest distance that we can get with t times of refueling](https://leetcode.com/problems/minimum-number-of-refueling-stops/discuss/149839/DP-O(N2)-and-Priority-Queue-O(NlogN))

```java
public int minRefuelStops(int target, int startFuel, int[][] stations) {
    int curFarthest = startFuel, refuel = 0;
    PriorityQueue<Integer> pq = new PriorityQueue<>((a, b) -> b - a);
    for (int[] station : stations) {
        // check if we can reach this station
        // if we cannot reach this station, refuel the gas from the previous station with most gas
        // redo the operation until we get enough gas to reach this station
        while (curFarthest < station[0]) {
            if (pq.isEmpty()) return -1; // if we reful in each station but still cannot reach this station, return -1
            curFarthest += pq.poll();
            refuel++;
        }
        pq.offer(station[1]);
    }
    // now we have reached the last station, check if we can reach the target
    while (curFarthest < target) {
        if (pq.isEmpty()) return -1;
        curFarthest += pq.poll();
        refuel++;
    }
    return refuel;
}

public int minRefuelStops(int target, int cur, int[][] s) {
    Queue<Integer> pq = new PriorityQueue<>();
    int i = 0, res;
    for (res = 0; cur < target; res++) {
        while (i < s.length && s[i][0] <= cur)
            pq.offer(-s[i++][1]);
        if (pq.isEmpty()) return -1;
        cur += -pq.poll();
    }
    return res;
}
```

#### Poll multiple elements - slots
- Poll multiple elements into a temp list, make some change then add them back
- starting point: max element
- [LeetCode 767 - Reorganize String: no duplicate characters are adjacent to each other](https://leetcode.com/articles/reorganized-string/)
  - [PriorityQueue: O(NlogA)](https://leetcode.com/problems/reorganize-string/discuss/113440/Java-solution-PriorityQueue)
  - [find the letter with largest occurrence, put it into even index first](https://leetcode.com/problems/reorganize-string/discuss/232469/Java-O(N)-3ms-beat-100)
- [LeetCode 358 - Rearrange String k Distance Apart](https://tenderleo.gitbooks.io/leetcode-solutions-/GoogleHard/358.html)
  - [PriorityQueue: slot by slot](https://tenderleo.gitbooks.io/leetcode-solutions-/GoogleHard/358.html)
  - [PQ: char by char](https://www.programcreek.com/2014/08/leetcode-rearrange-string-k-distance-apart-java/)

```java
public String rearrangeString(String str, int k) {
    if(k<=1){ return str; }
    int[] count = new int[26];
    for(int i=0; i<str.length(); i++){
        count[str.charAt(i)-'a']++;
    }
    PriorityQueue<int[]> pq = new PriorityQueue<>((a,b)->b[0]-a[0]);
    for(int i=0; i<count.length; i++){ pq.add(new int[]{ count[i], i}); }   
    char[] result = new char[str.length()];
    int idx = 0;
    int start = 0;
    while(!pq.isEmpty()){
        int[] num = pq.remove();
        for(int i=0; i<num[0]; i++){
            result[idx] = (char)(num[1]+'a');
            if(idx>0 && result[idx-1]==result[idx]){ return ""; }
            idx+=k;
            if(idx>=str.length()){ idx=++start; }
        }
    }
    return new String(result);
}
public String rearrangeString(String str, int k) {
    for(char c: map.keySet())
        queue.offer(c);
    StringBuilder sb = new StringBuilder();
    int len = str.length();
    while(!queue.isEmpty()){
        int cnt = Math.min(k, len);
        ArrayList<Character> temp = new ArrayList<Character>();
        for(int i=0; i<cnt; i++){
            if(queue.isEmpty())//\\
                return "";
            char c = queue.poll();
            sb.append(String.valueOf(c));
            map.put(c, map.get(c)-1);
            if(map.get(c)>0){
                temp.add(c);
            }
            len--;
        }
        for(char c: temp)
            queue.offer(c);
    }
    return sb.toString();
}
```
- [LeetCode 621 - Task Scheduler](https://leetcode.com/articles/task-scheduler/)
  - math: (maxFreq -1)x(interval+1)+(cnt of maxFreq)
  - [PriorityQueue or Sort, output solution](https://github.com/mintycc/OnlineJudge-Solutions/blob/master/Leetcode/621_Task_Scheduler.java)

```java
public int leastInterval(char[] tasks, int n) {
    Map<Character, Integer> counts = new HashMap<Character, Integer>();
    for (char t : tasks) {
        counts.put(t, counts.getOrDefault(t, 0) + 1);
    }
    PriorityQueue<Integer> pq = new PriorityQueue<Integer>((a, b) -> b - a);
    pq.addAll(counts.values());
    int alltime = 0;
    int cycle = n + 1;
    while (!pq.isEmpty()) {
        int worktime = 0;
        List<Integer> tmp = new ArrayList<Integer>();
        for (int i = 0; i < cycle; i++) {
            if (!pq.isEmpty()) {
                tmp.add(pq.poll());
                worktime++;
            }
        }
        for (int cnt : tmp) {
            if (--cnt > 0) {
                pq.offer(cnt);
            }
        }
        alltime += !pq.isEmpty() ? cycle : worktime;
    }    
    return alltime;
}
```


#### Min/MaxHeap(TreeSet)
- [LeetCode 295 - Find Median from Data Stream](http://www.programcreek.com/2015/01/leetcode-find-median-from-data-stream-java/)
- POJ 4302 Holedox Eating
- POJ 2010 Moo University – Financial Aid
  - [enumeration + pq](http://www.hankcs.com/program/cpp/poj-2010-moo-university-financial-aid.html)
  - [bisection - index](http://www.hankcs.com/program/cpp/poj-2010-moo-university-financial-aid-binary-search.html)


##### BFS + PriorityQueue
#### Dijkstra
- O(E+VlogV)
- frontier, settled set, expand
- PriorityQueue
- [LeetCode 743 - Network Delay Time](https://leetcode.com/articles/network-delay-time/)
  - we send a signal from a certain node K. How long will it take for all nodes to receive the signal?
  - [use dist map as visited, no need to remove: O(ElogE)](https://leetcode.com/articles/network-delay-time/)
- [LeetCode 505 - The Maze II: ball roll](https://leetcode.com/articles/the-maze-ii/)
- [LeetCode 499 - The Maze III: ball, roll, move in to the hole](https://github.com/Turingfly/leetcode/blob/master/LeetCode/src/bfs/_499_TheMazeIII.java)
- [LeetCode 787 - Cheapest Flights Within K Stops](https://leetcode.com/problems/cheapest-flights-within-k-stops/discuss/115541/Easy-and-Concise-Solution-Using-Priority-Queue-JavaPython)
  - [Dijkstra](https://leetcode.com/problems/cheapest-flights-within-k-stops/discuss/115541/Easy-and-Concise-Solution-Using-Priority-Queue-JavaPython)
  - [Bellman-Ford: dp[k][i]: min cost from src to i taken up to k flights (k-1 stops) dp[k][i] = min(dp[k-1][j] + price[j][i])](http://www.cnblogs.com/grandyang/p/9109981.html)
  - [BFS: track min for all k levels, O(n^k)](https://leetcode.com/problems/cheapest-flights-within-k-stops/discuss/115570/BFS-with-small-tweak-to-guarantee-k-stops)
- [LeetCode 778 - Swim in Rising Water](https://leetcode.com/problems/swim-in-rising-water/discuss/113770/Easy-and-Concise-Solution-using-PriorityQueue-PythonC%2B%2B)
  - find a path whose max is minimum
  - [PQ+BFS: O(N^2logN)](https://leetcode.com/problems/swim-in-rising-water/discuss/115696/Simple-Java-solution-using-priority-queue)
  - [Bisection + use bfs/dfs to validate](https://leetcode.com/problems/swim-in-rising-water/discuss/113758/c-two-solutions-binary-searchdfs-and-dijkstrabfs-on2logn-11ms)
  - [Bisection + use union find to validate](https://leetcode.com/problems/swim-in-rising-water/discuss/118204/Java-DFS-and-Union-Find)

#### Examples
- [LeetCode 378 - Kth Smallest Element in a Sorted Matrix](https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/discuss/85173/Share-my-thoughts-and-Clean-Java-Code)
  - [bisection: O(nlog(max-min)): k:[0-n^2]](https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/discuss/85177/Java-1ms-nlog(max-min)-solution)
  - [PriorityQueue: O(klogk)](https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/discuss/85301/java-priorityqueue-solution)

```java
public int kthSmallest(final int[][] matrix, int k) {
    int c = 0;
    PriorityQueue<int[]> queue = new PriorityQueue<>(
        k, (o1, o2) -> matrix[o1[0]][o1[1]] - matrix[o2[0]][o2[1]]);
    queue.offer(new int[] {0, 0});
    while (true) {
        int[] pair = queue.poll();
        if (++c == k) {
            return matrix[pair[0]][pair[1]];
        }
        if (pair[0] == 0 && pair[1] + 1 < matrix[0].length) {
            queue.offer(new int[] {0, pair[1] + 1});
        }
        if (pair[0] + 1 < matrix.length) {
            queue.offer(new int[] {pair[0] + 1, pair[1]});
        }
    }
}
```
- [LeetCode 373 - Find K Pairs with Smallest Sums](https://leetcode.com/problems/find-k-pairs-with-smallest-sums/discuss/84556/java-priorityqueue-9ms-without-helper-class)
  - [Priority Queue O(KlogK)](https://leetcode.com/problems/find-k-pairs-with-smallest-sums/discuss/84551/simple-Java-O(KlogK)-solution-with-explanation)

```java
// O(KlogK)
public List<int[]> kSmallestPairs(int[] nums1, int[] nums2, int k) {
    PriorityQueue<int[]> que = new PriorityQueue<>((a,b)->a[0]+a[1]-b[0]-b[1]);
    List<int[]> res = new ArrayList<>();
    if(nums1.length==0 || nums2.length==0 || k==0) return res;
    for(int i=0; i<nums1.length && i<k; i++) que.offer(new int[]{nums1[i], nums2[0], 0});
    while(k-- > 0 && !que.isEmpty()){
        int[] cur = que.poll();
        res.add(new int[]{cur[0], cur[1]});
        if(cur[2] == nums2.length-1) continue;
        que.offer(new int[]{cur[0],nums2[cur[2]+1], cur[2]+1});
    }
    return res;
}

public List<int[]> kSmallestPairs(int[] nums1, int[] nums2, int k) {
    List<int[]> res = new LinkedList<>();
    if(nums1==null || nums1.length==0 || nums2==null || nums2.length==0) {
        return res;
    }
    PriorityQueue<int[]> minQ = new PriorityQueue<>(new Comparator<int[]>(){
        public int compare(int[] pair1, int[] pair2) {
            return (nums1[pair1[0]]+nums2[pair1[1]])-(nums1[pair2[0]]+nums2[pair2[1]]);
        }
    });
    minQ.offer(new int[]{0, 0});
    while (k>0 && !minQ.isEmpty()) {
        int[] pair=minQ.poll();
        int i = pair[0];
        int j = pair[1];
        res.add(new int[]{nums1[i], nums2[j]});
        k--;
        if(j+1<nums2.length) {
            minQ.offer(new int[]{i, j+1});
        }
        if(j==0 && i+1<nums1.length){
            minQ.offer(new int[] {i+1, 0});
        }
    }
    return res;
}
```