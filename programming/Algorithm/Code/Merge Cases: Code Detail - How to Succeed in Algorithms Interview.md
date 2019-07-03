### [Series: How to Succeed in Algorithms Interview](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### Merge Cases
Usually after the loop, we need handle the case when some list is a longer. If possible we should try to merge these different cased and handle all cases in the loop.

- How to write concise code by merging cases.
- How to save your precious time in coding interview.

#### [LeetCode 2 - Add Two Numbers](https://leetcode.com/problems/add-two-numbers/discuss/1059/my-accepted-java-solution){target="blank"}
- Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
- Output: 7 -> 0 -> 8

Here we handle the case when list1 or list2 is longer and has more elements in the while loop, so after we don't have to handle the cases: list1 or list2 has more elements.

```java
public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
    ListNode prev = new ListNode(0);
    ListNode head = prev;
    int carry = 0;
    while (l1 != null || l2 != null || carry != 0) {
        ListNode cur = new ListNode(0);
        int sum = ((l2 == null) ? 0 : l2.val) + ((l1 == null) ? 0 : l1.val) + carry;
        cur.val = sum % 10;
        carry = sum / 10;
        prev.next = cur;
        prev = cur;

        l1 = (l1 == null) ? l1 : l1.next;
        l2 = (l2 == null) ? l2 : l2.next;
    }
    return head.next;
}
```

#### [LeetCode 445 - Add Two Numbers II](https://github.com/mintycc/OnlineJudge-Solutions/blob/master/Leetcode/445_Add_Two_Numbers_II.java)
- Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
- Output: 7 -> 8 -> 0 -> 7
```java
public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
    Stack<ListNode> s1 = new Stack<ListNode>();
    Stack<ListNode> s2 = new Stack<ListNode>();
    for (ListNode tmp = l1; tmp != null; tmp = tmp.next) s1.push(tmp);
    for (ListNode tmp = l2; tmp != null; tmp = tmp.next) s2.push(tmp);
    int carry = 0;
    ListNode prev = null;
    while (!s1.isEmpty() || !s2.isEmpty()) {
        int tmp = carry;
        if (!s1.isEmpty()) tmp += s1.pop().val;
        if (!s2.isEmpty()) tmp += s2.pop().val;
        carry = tmp / 10;
        ListNode cur = new ListNode(tmp % 10);
        cur.next = prev;
        prev = cur;
    }
    if (carry > 0) {
        ListNode cur = new ListNode(carry);
        cur.next = prev;
        prev = cur;
    }
    return prev;
}
```
#### [LeetCode 215 - Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array/discuss/60294/Solution-explained)
- [quick select](https://yuanhsh.iteye.com/blog/2213686)
```java
public int findKthLargest(int[] nums, int k) {
  final PriorityQueue<Integer> pq = new PriorityQueue<>();
  for(int val : nums) {
      pq.offer(val);
      if(pq.size() > k) {
          pq.poll();
      }
  }
  return pq.peek();
}
```

#### [LeetCode 401 - Binary Watch](https://leetcode.com/problems/binary-watch/discuss/88456/3ms-java-solution-using-backtracking-and-idea-of-permutation-and-combination)
  - [limited set/result: brute force](https://leetcode.com/problems/binary-watch/discuss/88458/simple-pythonjava)
  - [put hour, minutes in same array](https://blog.csdn.net/mebiuw/article/details/52575880)
  - [handle hour/minutes in same dfs func](https://leetcode.com/problems/binary-watch/discuss/88456/3ms-java-solution-using-backtracking-and-idea-of-permutation-and-combination)