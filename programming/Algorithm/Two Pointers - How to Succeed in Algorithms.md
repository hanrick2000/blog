#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Types of Two/Multiple Pointers
- One array, head and tail pointers
  - maintain interval, expand head when still meets criteria, shrink tail when not
- Slow and fast pointers
- 一个数组, 从两边向中间移动(对撞型)
- 一个数组, 同时向前移动(前向型)
- 两个数组(并行型)
- Two arrays, both from start or end
  - when element's value/state is related with afterwards elements
    - use stack
    - or maybe traverse from end

#### When to use Two/Multiple Pointers
- range related
<!-- - 一个连续区间求解某些最值 -->

#### How
- pre-sort the array
- usually related with greedy
  - [LeetCode 881 - Boats to Save People](https://leetcode.com/problems/boats-to-save-people/discuss/156855/6-lines-Java-O(nlogn)-code-sorting-%2B-greedy-with-greedy-algorithm-proof)

##### Multiple arrays (merge)
- [LeetCode 826 - Most Profit Assigning Work](https://leetcode.com/problems/most-profit-assigning-work/discuss/127031/C%2B%2BJavaPython-Sort-and-Two-pointer)
```java
public int maxProfitAssignment(int[] difficulty, int[] profit, int[] worker) {
    List<Pair<Integer, Integer>> jobs = new ArrayList<>();
    int N = profit.length, res = 0, i = 0, maxp = 0;
    for (int j = 0; j < N; ++j) jobs.add(new Pair<Integer, Integer>(difficulty[j], profit[j]));
    Collections.sort(jobs, Comparator.comparing(Pair::getKey));
    Arrays.sort(worker);
    for (int ability : worker) {
        while (i < N && ability >= jobs.get(i).getKey())
            maxp = Math.max(jobs.get(i++).getValue(), maxp);
        res += maxp;
    }
    return res;
}
```
- [LeetCode 44 - Wildcard Matching](https://leetcode.com/problems/wildcard-matching/discuss/17845/Python-DP-solution)
  - [dp: O(m+n)](https://leetcode.com/problems/wildcard-matching/discuss/17845/Python-DP-solution)
  - [two pointers: O(m+n)](https://leetcode.com/problems/wildcard-matching/discuss/17810/Linear-runtime-and-constant-space-solution)

##### Two/Multiple same direction pointers in one array(尺取法)
- [LeetCode 845 - Longest Mountain in Array](https://leetcode.com/problems/longest-mountain-in-array/discuss/135593/C%2B%2BJavaPython-1-pass-and-O(1)-space)
  - [up + down array](https://leetcode.com/problems/longest-mountain-in-array/discuss/135593/C%2B%2BJavaPython-1-pass-and-O(1)-space)
  - [two pointers](https://leetcode.com/articles/longest-mountain-in-array/)
- [LeetCode 844 - Backspace String Compare](https://leetcode.com/articles/backspace-string-compare/)
- [LeetCode 763 - Partition Labels](https://hk.saowen.com/a/561ee16eff6c0d2649cfa7225390e10ec3481feb92c1c042e36f4c7fcbea48dd)
```java
// start and end of the current window
int left = 0, right = 0;
// current pointer
for (int i = 0; i < S.size(); ++ i) {
    right = max(right, last[S.at(i)]); // maximum index of the current window
    // reach the end of current window
    if (i == right) {
        vResult.push_back(right - left + 1); // size of the current window
        left = i + 1; // move to start of the next window
    }
}
```
- [LeetCode 259 - 3Sum Smaller](https://www.cnblogs.com/yrbbest/p/5014972.html)
  - 3 pointers: i, int lo = i + 1, hi = nums.length - 1;
- [LeetCode 923 - 3Sum With Multiplicity]
  - [3 pointers](https://leetcode.com/problems/3sum-with-multiplicity/discuss/181098/Java-O(n2)-code-Sort-and-Match.)
  - [Map stores pair sum, build map and compute at same time](https://leetcode.com/problems/3sum-with-multiplicity/discuss/181128/10-lines-Super-Super-Easy-Java-Solution)
- [LeetCode 838 - Push Dominoes](https://leetcode.com/problems/shortest-distance-to-a-character/discuss/125788/)
  - the state of current element, only depend on the shortest distance to 'L' and 'R'.
  - Propose assumption and verify it

- [LeetCode 55 - Jump Game](https://leetcode.com/articles/jump-game/)
  - track maxReach: we don't care what positions a[i] can reach, only the maxReach
- [LeetCode 45 - Jump Game II: find the minimum number of jumps](https://www.jiuzhang.com/solution/jump-game-ii/)
  - [two pointers to maintain a cover range](https://www.jiuzhang.com/solution/jump-game-ii/)


#### Slow and fast pointers
- LeetCode 141 - Linked List Cycle
  - 2(a+b) = a+b+c+b, c = a

  ![](https://images0.cnblogs.com/blog/650745/201501/281406219094213.png){.class height=40% width=40% }
- [String Deduplicate - Google](https://docs.google.com/document/d/1qxA2wps0IhVRWULulQ55W4SGPMu2AE5MkBB37h8Dr58/)
- [LeetCode 287 - Find the Duplicate Number](https://leetcode.com/articles/find-the-duplicate-number/)
  - [bisection](https://leetcode.com/problems/find-the-duplicate-number/discuss/72841/Java-O(1)space-using-Binary-Search)
  - [find loop in the linkedlist](http://keithschwarz.com/interesting/code/find-duplicate/FindDuplicate.python.html)[index to value mapping](https://leetcode.com/problems/find-the-duplicate-number/discuss/72845/java-on-time-and-o1-space-solution-similar-to-find-loop-in-linkedlist)

  ![](http://cyukang.com/images/cycle3.png)
  ```java
  public int findDuplicate(int[] nums) {
      int slow = 0, fast = 0;
      do{
          slow = nums[slow];
          fast = nums[nums[fast]];
      }while(slow != fast);
      slow = 0;
      while(slow != fast){
          slow = nums[slow];
          fast = nums[fast];
      }
      return slow;
  }
  ```

#### Forward and backward pointers
- [GEEK - Find Maximum value of abs(i – j) * min(arr[i], arr[j]) in an array arr[]](https://www.geeksforgeeks.org/find-maximum-value-of-absi-j-minarri-arrj-in-an-array-arr/)
- [LeetCode 42 - Trapping Rain Water](http://wxx5433.github.io/trapping-rain-water.html)
  - If there are two bars higher than this bar on two sides, then we can safely add the min(leftMax, rightMax) - height. We only need to keep one pointer on each side and moves the pointer with lower height each time
```java
public int trap(int[] height) {
  int left = 0;
  int right = height.length - 1;
  int leftMax = 0;
  int rightMax = 0;
  int volume = 0;
  while (left < right) {
    if (height[left] <= height[right]) {
      if (height[left] >= leftMax) {
        leftMax = height[left];
      } else {
        volume += leftMax - height[left];
      }
      ++left;
    } else {
      if (height[right] >= rightMax) {
        rightMax = height[right];
      } else {
        volume += rightMax - height[right];
      }
      --right;
    }
  }

  return volume;
}
```
- [LeetCode 67 - Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/discuss/26810/Java-solution.-using-two-pointers-%2B-HashMap)
  - expand (end pointer) the window until it meets the criteria
  - shrink (start pointer) to make it smallest
- [LeetCode 340 - Longest Substring with At Most K Distinct Characters](http://buttercola.blogspot.com/2016/06/leetcode-340-longest-substring-with-at.html)
- LeetCode 360 - Sort Transformed Array
- [LeetCode 632 - Smallest Range](http://www.cnblogs.com/grandyang/p/7200016.html)

### Sliding Window
#### When to use
- window of size k
- Shortest/longest Subarray with xxx

#### How
- expand (end pointer) the window until it meets the criteria
- reset value when it violates
- shrink (start pointer) to make it smallest
- maintain states when expand and shrink: put in a map/set
- use together with queue or monotone queue

#### Implementation
- [ans += right - left + 1;](https://leetcode.com/articles/subarray-product-less-than-k/)

#### use together with queue or monotone queue
- [LeetCode 239 - Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/discuss/65884/java-on-solution-using-deque-with-explanation)
- [LeetCode 862 - Shortest Subarray with Sum at Least K](https://leetcode.com/articles/shortest-subarray-with-sum-atleast-k/)
```java
public int shortestSubarray(int[] A, int K) {
    int N = A.length;
    long[] P = new long[N+1];
    for (int i = 0; i < N; ++i)
        P[i+1] = P[i] + (long) A[i];

    // Want smallest y-x with P[y] - P[x] >= K
    int ans = N+1; // N+1 is impossible
    Deque<Integer> monoq = new LinkedList(); //opt(y) candidates, as indices of P

    for (int y = 0; y < P.length; ++y) {
        // Want opt(y) = largest x with P[x] <= P[y] - K;
        while (!monoq.isEmpty() && P[y] <= P[monoq.getLast()])
            monoq.removeLast();
        while (!monoq.isEmpty() && P[y] >= P[monoq.getFirst()] + K)
            ans = Math.min(ans, y - monoq.removeFirst());

        monoq.addLast(y);
    }

    return ans < N+1 ? ans : -1;
}
```
- [LeetCode 3 - Longest Substring Without Repeating Characters](https://leetcode.com/articles/longest-substring-without-repeating-characters/)
```java
public int lengthOfLongestSubstring(String s) {
     if (s.length()==0) return 0;
     HashMap<Character, Integer> map = new HashMap<Character, Integer>();
     int max=0;
     for (int i=0, j=0; i<s.length(); ++i){
         if (map.containsKey(s.charAt(i))){
             j = Math.max(j,map.get(s.charAt(i))+1);
         }
         map.put(s.charAt(i),i);
         max = Math.max(max,i-j+1);
     }
     return max;
 }
```
- [Find zeroes to be flipped so that number of consecutive 1's is maximized](https://www.geeksforgeeks.org/find-zeroes-to-be-flipped-so-that-number-of-consecutive-1s-is-maximized/)
  - [follow up](https://discuss.leetcode.com/topic/48827/java-o-nlogk-using-treemap-to-keep-last-occurrence-interview-follow-up-question/3)
```java
public int lengthOfLongestSubstringKDistinct(String str, int k) {
    if (str == null || str.isEmpty() || k == 0) {
        return 0;
    }
    TreeMap<Integer, Character> lastOccurrence = new TreeMap<>();
    Map<Character, Integer> inWindow = new HashMap<>();
    int j = 0;
    int max = 1;
    for (int i = 0; i < str.length(); i++) {
        char in = str.charAt(i);
        while (inWindow.size() == k && !inWindow.containsKey(in)) {
            int first = lastOccurrence.firstKey();
            char out = lastOccurrence.get(first);
            inWindow.remove(out);
            lastOccurrence.remove(first);
            j = first + 1;
        }
        //update or add in's position in both maps
        if (inWindow.containsKey(in)) {
            lastOccurrence.remove(inWindow.get(in));
        }
        inWindow.put(in, i);
        lastOccurrence.put(i, in);
        max = Math.max(max, i - j + 1);
    }
    return max;
}
```
- [LeetCode 340 - Longest Substring with At Most K Distinct Characters](https://massivealgorithms.blogspot.com/2016/04/leetcode-340-longest-substring-with-at.html)
- [Sum of minimum and maximum elements of all subarrays of size k](https://www.geeksforgeeks.org/sum-minimum-maximum-elements-subarrays-size-k/)
  - remove numbers out of range k
  - remove numbers in k range as they are useless
- [LeetCode 424 - Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/discuss/91271/Java-12-lines-O(n)-sliding-window-solution-with-explanation)
- [HARD: LeetCode 30 - Substring with Concatenation of All Words](https://leetcode.com/problems/substring-with-concatenation-of-all-words/discuss/13664/Simple-Java-Solution-with-Two-Pointers-and-Map)
```text
You are given a string, S, and a list of words, L, that are all of the same length. Find all starting indices of substring(s) in S that is a concatenation of each word in L exactly once and without any intervening characters.

For example, given:
S: "barfoothefoobarman"
L: ["foo", "bar"]

You should return the indices: [0,9]. (order does not matter).
```
  - [for (int i = 0; i < L[0].length(); i++) ](http://www.cnblogs.com/grandyang/p/4521224.html)
  - [Trie](https://leetcode.com/problems/substring-with-concatenation-of-all-words/discuss/13797/accepted-recursive-solution-using-trie-tree)
- [leetCode 475 - Heaters](https://leetcode.com/problems/heaters/discuss/95886/short-and-clean-java-binary-search-solution)
  - [presort + two pointers](https://leetcode.com/problems/heaters/discuss/95886/Short-and-Clean-Java-Binary-Search-Solution)
  - [TreeSet](https://leetcode.com/problems/heaters/discuss/95928/Java-TreeSet-log(n)-Solution-with-explanation)
  - [binary search](https://leetcode.com/problems/heaters/discuss/95886/Short-and-Clean-Java-Binary-Search-Solution)
