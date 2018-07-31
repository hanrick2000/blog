

### Median
- [LintCode 360 - Sliding Window Median](https://zhengyang2015.gitbooks.io/lintcode/sliding_window_median_360.html)
  - maxHeap and minHeap

### Build Tree
- [LintCode 126 - Max Tree](https://segmentfault.com/a/1190000007471356)

### Prefix sum
- extend(related): sort prefix sum with index and use two pointers

### Subarray sum
- prefix sum
- sliding window for sum of subarray size k

### Rolling hash(bit)
- [LeetCode 187 -  Repeated DNA Sequences](https://leetcode.com/problems/repeated-dna-sequences/discuss/53867/Clean-Java-solution-(hashmap-%2B-bits-manipulation))
  - [Rolling hash(bit)](https://leetcode.com/problems/repeated-dna-sequences/discuss/53902/Short-Java-"rolling-hash"-solution)

### Abbreviation
- if the len is different, the abbreviation would not conflict

- [LeetCode 320 - Generalized Abbreviation](https://kennyzhuang.gitbooks.io/leetcode-lock/content/320_generalized_abbreviation.html)
  - time complexity: O(2^n)
  - [bit mask: 0: original letter, 1: abbreviated](http://www.cnblogs.com/grandyang/p/5261569.html)
  - [dfs: abbreviate or not](https://kennyzhuang.gitbooks.io/leetcode-lock/content/320_generalized_abbreviation.html)
```java
public void DFS(List<String> res, StringBuilder sb, char[] c, int i, int num) {
    int len = sb.length();  
    if(i == c.length) {
        if(num != 0) sb.append(num);
        res.add(sb.toString());
    } else {
        DFS(res, sb, c, i + 1, num + 1);               // abbr c[i]
        if(num != 0) sb.append(num);                   // not abbr c[i]
        DFS(res, sb.append(c[i]), c, i + 1, 0);        
    }
    sb.setLength(len); 
}
```
- [LeetCode 527 - Word Abbreviation: generate minimal possible abbreviations for every word in the list](https://jogchat.com/shuati/60%E5%A4%A9%E5%B8%A6%E4%BD%A0%E5%88%B7%E5%AE%8CLeetcode%E3%80%90%E7%AC%AC15%E5%A4%A9%E3%80%91530%20~%20521.php)
  - [Split/groups by len or prefix_1_abbreviation](https://jogchat.com/shuati/60天带你刷完Leetcode【第15天】530%20~%20521.php)
  - [dfs](http://www.cnblogs.com/dongling/p/6539600.html)

- [HARD: LeetCode 411 - Minimum Unique Word Abbreviation: find an abbreviation with the smallest possible length](https://www.cnblogs.com/EdwardLiu/p/6196177.html)
  - [Priority Queue + validate](http://www.cnblogs.com/grandyang/p/5935836.html)
  - [Trie + Generate abbreviation by len then dfs search the Trie](https://github.com/fishercoder1534/Leetcode/blob/master/src/main/java/com/fishercoder/solutions/_411.java)
    - abbrGenerator: generate all the possible abbreviations given certain length (which is num parameter).


#### Anagram
- sort, normalize string

### Swap
- [Rearrange a Linked List/Array in Zig-Zag fashion](https://www.geeksforgeeks.org/convert-array-into-zig-zag-fashion/)


### Quick Select
- find kth(middle) element
- [LeetCode 215 - Kth Largest Element in an Array](https://www.jiuzhang.com/solutions/kth-largest-element/)
```java
public int helper(int[] nums, int l, int r, int k) {
    if (l == r) {
        return nums[l];
    }
    int position = partition(nums, l, r);
    if (position + 1 == k) {
        return nums[position];
    } else if (position + 1 < k) {
        return helper(nums, position + 1, r, k);
    }  else {
        return helper(nums, l, position - 1, k);
    }
}
public int partition(int[] nums, int l, int r) {
    int left = l, right = r;
    int pivot = nums[left];
    
    while (left < right) {
        while (left < right && nums[right] >= pivot) {
            right--;
        }
        nums[left] = nums[right];
        while (left < right && nums[left] <= pivot) {
            left++;
        }
        nums[right] = nums[left];
    }
    nums[left] = pivot;
    return left;//return where is the pivot; its position         
}
```
- [LeetCode 973 - K Closest Points to Origin](https://leetcode.com/problems/k-closest-points-to-origin/discuss/220235/Java-Three-solutions-to-this-classical-K-th-problem.)


### Slot

<!-- ### [利用对称性](https://blog.csdn.net/fuxuemingzhu/article/details/83716573) -->


### Median
- Two TreeSet or TreeMap
- Quick Select to find the median: O(n)
- Manhattan Distance: median in x and y
- [LeetCode 480 - Sliding Window Median](https://leetcode.com/problems/sliding-window-median/discuss/96346/Java-using-two-Tree-Sets-O(n-logk))
  - [store index in TreeSet, but compare by its value: or store both](https://leetcode.com/problems/sliding-window-median/discuss/96346/Java-using-two-Tree-Sets-O(n-logk))
  - [TreeMap, but maintain size(including duplicates) separately](https://leetcode.com/problems/sliding-window-median/discuss/96353/Easy-to-understand-O(nlogk)-Java-solution-using-TreeMap)
- [LeetCode 295 - Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/discuss/74047/JavaPython-two-heap-solution-O(log-n)-add-O(1)-find)
  - [PriorityQueue](https://leetcode.com/problems/find-median-from-data-stream/discuss/74047/JavaPython-two-heap-solution-O(log-n)-add-O(1)-find)
  - [follow up: remove with TreeMap](https://leetcode.com/problems/find-median-from-data-stream/discuss/228234/Java-TreeMap-Implementation-and-follow-up-O(1)-remove-function)
### Quick Select to find the median: O(n)
- LeetCode - 462 Minimum Moves to Equal Array Elements II
  - [sort](https://leetcode.com/problems/minimum-moves-to-equal-array-elements-ii/discuss/94937/Java(just-like-meeting-point-problem))
  - [quick select to find the median](https://leetcode.com/problems/minimum-moves-to-equal-array-elements-ii/discuss/94917/Java-O(n)-Time-using-QuickSelect)
- [determines the k numbers in S that are closest to the median of S](https://blog.csdn.net/lihenair/article/details/17685977)
  - get the median of S
  - compute the distance of S to the median, store in B
  - get the kth order statistics in B. the first k elements in partition of B is the output

### Direction
- dirs = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}}
- turn left d++, turn right: d--
- [LeetCode 874 - Walking Robot Simulation](https://leetcode.com/problems/walking-robot-simulation/discuss/152322/Maximum!-This-is-crazy!)

- [LeetCode 489 - Robot Room Cleaner](http://www.programmersought.com/article/3123180170/)
```java
public void cleanRoom(Robot robot) {    Set<String> visited = new HashSet<>();
    backtracking(robot, visited, 0, 0, 0);
}
int[][] dir = {{1,0}, {-1,0}, {0,1}, {0, -1}};
private void backtracking(Robot robot, Set<String> visited, int x, int y, int arrow) {
    String path = x + "-" + y;
    if (visited.contains(path)) return;
    visited.add(path);
    robot.clean();
    for (int i = 0; i < 4; i++) {
        if (robot.move()) {
            //go all the way till cannot move, then back one step
            int nx = x + dir[arrow][0];
            int ny = y + dir[arrow][1];
            backtracking(robot, visited, nx, ny, arrow);
            //trace back
            robot.turnLeft();
            robot.turnLeft();
            robot.move();
            robot.turnLeft();
            robot.turnLeft();
        }
        robot.turnLeft();// or turnRight();
        arrow = (arrow + 1) % 4;
    }
}
```