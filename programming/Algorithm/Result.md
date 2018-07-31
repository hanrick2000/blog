- focus on the results
- what it contains or doesn't contain
- [LeetCode 395 - Longest Substring with At Least K Repeating Characters](https://leetcode.com/problems/longest-substring-with-at-least-k-repeating-characters/discuss/87761/Java-D-and-C-Solution)
  - [divide and conquer](https://leetcode.com/problems/longest-substring-with-at-least-k-repeating-characters/discuss/87761/Java-D-and-C-Solution)
```java
// Without the extra List and substring function
public int longestSubstring(String s, int k) {
    return helper(s, 0, s.length() - 1, k);
}
private int helper(String s, int start, int end, int k) {
    if (start > end) return 0;
    int[] count = new int[26];
    for (int i = start; i <= end; i++) {
        count[s.charAt(i) - 'a']++;
    }
    int preIndex = -1, maxRes = 0;
    for (int i = start; i <= end; i++) {
        if (count[s.charAt(i) - 'a'] < k) {
            maxRes = Integer.max(maxRes, helper(s, preIndex + 1, i - 1, k));
            preIndex = i;
        }
    }
    if (preIndex == -1) return end - start + 1;
    maxRes = Integer.max(maxRes, helper(s, preIndex + 1, end, k));
    return maxRes;
}
```





