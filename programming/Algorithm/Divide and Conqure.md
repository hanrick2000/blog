- smaller sub problems
- merge sort

- [LeetCode 84 - Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28900/O(n)-stack-based-JAVA-solution)
  - [increasing stack](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28900/O(n)-stack-based-JAVA-solution)
  - [lessFromLeft/lessFromRight: idx of the first bar the left/right that is lower than current](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28902/5ms-O(n)-Java-solution-explained-(beats-96))
  - [Divide and conquer - O(nlogn): max(maxLeftOnly, maxRightOnly, maxCombineArea](https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28910/Simple-Divide-and-Conquer-AC-solution-without-Segment-Tree/198911/)

- [LeetCode 23 - Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/discuss/10809/13-lines-in-Java)
  - [PriorityQueue: O(nlogk)](https://leetcode.com/problems/merge-k-sorted-lists/discuss/10809/13-lines-in-Java)
  - [Divide and Conquer: O(nlogk)](https://leetcode.com/problems/merge-k-sorted-lists/discuss/11010/A-solution-use-divide-and-conquer-algorithm-in-java)
    - T(n) = n + 2 T(k/2)
```java
// divide and conquer
public ListNode mergeKLists(ListNode[] lists) {
    if (lists == null || lists.length == 0)
        return null;
    return mergeKLists(lists, 0, lists.length - 1);
}
private ListNode mergeKLists(ListNode[] lists, int start, int end) {
    if (end < start) {
        return null;
    }
    if (end - start == 0) {
        return lists[start];
    }
    int mid = start + ((end - start) >> 1);
    ListNode lower = mergeKLists(lists, start, mid);
    ListNode upper = mergeKLists(lists, mid + 1, end);
    return mergeTwoLists(lower, upper);
}
private ListNode mergeTwoLists(ListNode head1, ListNode head2) {
    ListNode dummyHead = new ListNode(0), ptr = dummyHead;
    while (head1 != null && head2 != null) {
        if (head1.val < head2.val) {
            ptr.next = head1;
            head1 = head1.next;
        } else {
            ptr.next = head2;
            head2 = head2.next;
        }
        ptr = ptr.next;
    }
    if (head1 != null) {
        ptr.next = head1;
    } else if (head2 != null) {
        ptr.next = head2;
    }
    return dummyHead.next;
}
```

### Unusual
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






