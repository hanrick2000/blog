#### When to use
- window of size k
- Shortest/longest Subarray with xxx
- continuous subarrays or substrings 
#### How
- expand (end pointer) the window until it meets the criteria
- reset value when it violates
- shrink (start pointer) to make it smallest
- maintain states when expand and shrink: put in a map/set
- use together with queue or monotone queue

#### Implementation
- [ans += right - left + 1;](https://leetcode.com/articles/subarray-product-less-than-k/)

#### Multiple List
- [LeetCode 632 - Smallest Range (shortest range in k-sorted lists)](https://leetcode.com/problems/smallest-range/discuss/104893/java-code-using-priorityqueue-similar-to-merge-k-array)
  - [PriorityQueue: track min and max during merge](https://discuss.leetcode.com/topic/94445/java-code-using-priorityqueue-similar-to-merge-k-array)
  - [sliding window: o(nlogn) - not best](http://www.cnblogs.com/grandyang/p/7200016.html)


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

- [LeetCode 67 - Minimum Window Substring]
  - expand (end pointer) the window until it meets the criteria
  - shrink (start pointer) to make it smallest

- [LeetCode 424 - Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/discuss/91271/Java-12-lines-O(n)-sliding-window-solution-with-explanation)
- [LeetCode 1004 - Max Consecutive Ones III](https://leetcode.com/problems/max-consecutive-ones-iii/discuss/247543/O(n)-Java-Solution-using-sliding-window)

- [LeetCode 904 - Fruit Into Baskets](https://leetcode.com/problems/fruit-into-baskets/discuss/170808/Java-Longest-Subarray-with-atmost-2-Distinct-elements)
  - [Map stores value to count](https://leetcode.com/problems/fruit-into-baskets/discuss/170740/Sliding-Window)
  - [Map store last index of value](https://leetcode.com/problems/fruit-into-baskets/discuss/170808/Java-Longest-Subarray-with-atmost-2-Distinct-elements)

- [LeetCode 438 - Find All Anagrams in a String](https://leetcode.com/problems/find-all-anagrams-in-a-string/discuss/92076/java-on-using-hashmap-easy-understanding)
```java
public List<Integer> findAnagrams(String s, String p) {
    Map<Character, Integer> map = counter(p);
    int match = 0;
    for (int i = 0; i < s.length(); i++) {
        char c = s.charAt(i);
        if (map.containsKey(c)) {
            map.put(c, map.get(c) - 1);
            if (map.get(c) == 0) {
                match++;
            }
        }
        if (i >= p.length()) {
            c = s.charAt(i - p.length());
            if (map.containsKey(c)) {
                map.put(c, map.get(c) + 1);
                if (map.get(c) == 1) {
                    match--;
                }
            }
        }
        if (match == map.size()) {
            result.add(i - p.length() + 1);
        }
    }
    return result;
}
```

### Window class
- [LeetCode 992 - Subarrays with K Different Integers](https://leetcode.com/problems/subarrays-with-k-different-integers/discuss/234482/JavaC++Python-Sliding-Window-with-Video)
  - Given an array A of positive integers, call a (contiguous, not necessarily distinct) subarray of A good if the number of different integers in that subarray is exactly K.
  - **exactly -> at most**
  - sliding window, two pointers
  - [window class, maintain 2 sliding windows with same end element](https://leetcode.com/articles/subarrays-with-k-different-integers/)
```java
public int subarraysWithKDistinct(int[] A, int K) {
  Window window1 = new Window();
  Window window2 = new Window();
  int ans = 0, left1 = 0, left2 = 0;
  for (int right = 0; right < A.length; ++right) {
    int x = A[right];
    window1.add(x);
    window2.add(x);
    while (window1.different() > K)
      window1.remove(A[left1++]);
    while (window2.different() >= K)
      window2.remove(A[left2++]);
    ans += left2 - left1;
  }
  return ans;
}
```
### Jumping Window + Fixed Size
- [LeetCode 683 - K Empty Slots](https://www.cnblogs.com/lightwindy/p/9727403.html)
    - [sliding window: find a match when i reaches end of current window](https://www.cnblogs.com/lightwindy/p/9727403.html)
    - [O(kn) brute force]
    - [TreeSet: lower/higher](https://blog.csdn.net/katrina95/article/details/79070941)
    - [Bucket](https://zxi.mytechroad.com/blog/simulation/leetcode-683-k-empty-slots/)
```java
public int kEmptySlots(int[] flowers, int k) {
    int[] days = new int[flowers.length];
    for (int i = 0; i < flowers.length; i++) days[flowers[i] - 1] = i + 1;
    int left = 0, right = k + 1, result = Integer.MAX_VALUE;
    for (int i = 0; right < days.length; i++) {
        if (days[i] < days[left] || days[i] <= days[right]) {
            if (i == right)
                result = Math.min(result, Math.max(days[left], days[right]));
            left = i;
            right = k + 1 + i;
        }
    }
    return (result == Integer.MAX_VALUE) ? -1 : result;
}
```