#### Starting point - focus
- first/last element/operation
- increase, decrease -> Monotone stack/queue
- boundaries
  - left most, top most
- local boundaries(min, max)
- Inflection point

### First/last element/operation
- boundaries
  - left most, top most
- [LeetCode 419 - Battleships in a Board](https://leetcode.com/problems/battleships-in-a-board/discuss/90902/Simple-Java-Solution)
```java
public int countBattleships(char[][] board) {
    for (int i=0; i<m; i++) {
        for (int j=0; j<n; j++) {
            if (board[i][j] == '.') continue;
            if (i > 0 && board[i-1][j] == 'X') continue;
            if (j > 0 && board[i][j-1] == 'X') continue;
            count++;
        }
    }    
    return count;
}
```
- [LeetCode 1007 - Minimum Domino Rotations For Equal Row](https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/discuss/252242/JavaPython-Find-Intersection-of-Dominos)
  - [first element](https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/discuss/252242/JavaPython-Find-Intersection-of-Dominos)
  - [limited set: check potential answer: Try all possibilities from 1 to 6](https://blog.csdn.net/weixin_41968820/article/details/88379766)
```java
public int minDominoRotations(int[] A, int[] B) {
    int n = A.length;
    for(int i = 0, a = 0, b = 0; i < n && (A[i] == A[0] || B[i] == A[0]); ++i) {
        if(A[i] == A[0]) a++;
        if(B[i] == A[0]) b++;
        if(i == n-1) return Math.min(n-a, n-b);
    }
    for(int i = 0, a = 0, b = 0; i < n && (A[i] == B[0] || B[i] == B[0]); ++i) {
        if(A[i] == B[0]) a++;
        if(B[i] == B[0]) b++;
        if(i == n-1) return Math.min(n-a, n-b);
    }
    return -1;
}
```
- [LeetCode 995 - Minimum Number of K Consecutive Bit Flips](https://leetcode.com/problems/minimum-number-of-k-consecutive-bit-flips/discuss/238609/JavaC%2B%2BPython-One-Pass-and-O(1)-Space)
  - the minimum number of K-bit flips required so that there is no 0 in the array
  - [Greedy + Starting point: first 0](https://leetcode.com/problems/minimum-number-of-k-consecutive-bit-flips/discuss/238609/JavaC%2B%2BPython-One-Pass-and-O(1)-Space)
    - flip -> xor ^
  - [Use Deque to store a window/candidates]
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
```

### (Local) Boundaries - min/max
- [LeetCode 128 - Longest Consecutive Sequence](https://leetcode.com/articles/longest-consecutive-sequence/)
```Java
public int longestConsecutive(int[] nums) {
   Set<Integer> set = new HashSet<>();
   for(int n : nums) {
       set.add(n);
   }
   int best = 0;
   for(int n : set) {
       if(!set.contains(n - 1)) {  // only check for one direction
           int m = n + 1;
           while(set.contains(m)) {
               m++;
           }
           best = Math.max(best, m - n);
       }
   }
   return best;
}
public int longestConsecutive(int[] nums) {
    int res = 0;
    Set<Integer> s = new HashSet<Integer>();
    for (int num : nums) s.add(num);
    for (int num : nums) {
        if (s.remove(num)) {
            int pre = num - 1, next = num + 1;
            while (s.remove(pre)) --pre;
            while (s.remove(next)) ++next;
            res = Math.max(res, next - pre - 1);
        }
    }
    return res;
}
public int longestConsecutive(int[] num) {
    int len = 0;
    HashMap<Integer,Integer> map = new HashMap<Integer,Integer>();//<val,len>
    for(int n:num){
        if(!map.containsKey(n)){
            //1.check if n has conseq and update len
            int left = (map.containsKey(n-1))?map.get(n-1):0;
            int right = (map.containsKey(n+1))?map.get(n+1):0;
            int sum = left + right +1;
            map.put(n,sum);
            len = Math.max(sum,len);
            // 2.Union by only updating boundary(maintaining total len)
            // Leave middle k-v dirty to avoid cascading update
            map.put(n-left,sum);
            map.put(n+right,sum);
        }else{
            //duplicates
            continue;
        }
    }
    return len;
}
```
#### Find 3 values/indexes
- Suppose i is the 2nd (starting) index: fix the middle index

- [LeetCode 689 - Maximum Sum of 3 Non-Overlapping Subarrays](https://leetcode.com/problems/maximum-sum-of-3-non-overlapping-subarrays/discuss/108231/C%2B%2BJava-DP-with-explanation-O(n))
  - posLeft/Right for starting index of the left/right max sum interval

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

#### Starting point: last ops
- [LeetCode 651 - 4 Keys Keyboard: the maximum numbers of 'A' you can print](http://reeestart.me/2018/12/09/LeetCode-651-4-Keys-Keyboard/)
  - starting/turning point: last ops are always paste

#### Starting point: max element
- [LeetCode 767 - Reorganize String: no duplicate characters are adjacent to each other](https://leetcode.com/articles/reorganized-string/)
- [LeetCode 358 - Rearrange String k Distance Apart]
  - [PriorityQueue: slot by slot](https://tenderleo.gitbooks.io/leetcode-solutions-/GoogleHard/358.html)
  - [PQ: char by char](https://tenderleo.gitbooks.io/leetcode-solutions-/GoogleHard/358.html)
- [LeetCode 621 - Task Scheduler](https://leetcode.com/articles/task-scheduler/)


#### Current/Every element
- [Maximum sum of pairs with specific difference](https://www.geeksforgeeks.org/maximum-sum-pairs-specific-difference/)
  - Pair up i with (i-1)th element or not
  - dp[i] denotes the maximum disjoint pair sum we can achieve using first i elements

### Turning point: local min/max
- [LeetCode 375 - Wiggle Subsequence](https://leetcode.com/articles/wiggle-subsequence/)
  - [Tuning/Starting Point, tow pointers + greedy](https://www.hrwhisper.me/leetcode-wiggle-subsequence/)
  - [dp: O(N^2)](https://leetcode.com/articles/wiggle-subsequence/)
  - [dp: O(N)](https://leetcode.com/problems/wiggle-subsequence/discuss/84843/Easy-understanding-DP-solution-with-O(n)-Java-version)
```java
public int wiggleMaxLength(int[] nums) {
    if(nums == null || nums.length==0)
        return 0;
    if(nums.length<2){
        return nums.length;
    }    
    int count=1;
    for(int i=1, j=0; i<nums.length; j=i, i++){
        if(nums[j]<nums[i]){
            count++;
            while(i<nums.length-1 && nums[i]<=nums[i+1]){
                i++;
            }
        }else if(nums[j]>nums[i]){
            count++;
            while(i<nums.length-1 && nums[i]>=nums[i+1]){
                i++;
            }
        }
    }
    return count;
}
```

### Focus
- [LeetCode 463 - Island Perimeter](https://www.cnblogs.com/grandyang/p/6096138.html)
  - focus on the edge
  - [focus on the block, check left and up block only](https://leetcode.com/problems/island-perimeter/discuss/94992/java-9-line-solution-add-4-for-each-land-and-remove-2-for-each-internal-edge)
```java
public int islandPerimeter(int[][] grid) {
    int permeter = 0;
    int n = grid.length;
    int m = grid[0].length;
    for(int i=0;i<n;i++){
        for(int j=0;j<m;j++){
            if(grid[i][j] == 1){
                if(i==0 || grid[i-1][j] == 0) permeter++;
                if(i==n-1 || grid[i+1][j] == 0) permeter++;
                if(j==0 || grid[i][j-1] == 0) permeter++;
                if(j==m-1 || grid[i][j+1] == 0) permeter++;
            }
        }
    }
    return permeter;
}
public static int islandPerimeter(int[][] grid) {
    if (grid == null || grid.length == 0 || grid[0].length == 0) return 0;
    int result = 0;
    for (int i = 0; i < grid.length; i++) {
        for (int j = 0; j < grid[0].length; j++) {
            if (grid[i][j] == 1) {
                result += 4;
                if (i > 0 && grid[i-1][j] == 1) result -= 2;
                if (j > 0 && grid[i][j-1] == 1) result -= 2;
            }
        }
    }
    return result;
}
```