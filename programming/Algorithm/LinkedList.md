- Dummy Node
- pointers:
  - head: return it
  - tail: update and connect them

### Dummy Node
- LinkedList
- [LeetCode 23 - Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/discuss/10809/13-lines-in-Java)
  - [PriorityQueue: O(nlogk)](https://leetcode.com/problems/merge-k-sorted-lists/discuss/10809/13-lines-in-Java)
  - [Divide and Conquer: O(nlogk)](https://leetcode.com/problems/merge-k-sorted-lists/discuss/11010/A-solution-use-divide-and-conquer-algorithm-in-java)
    - T(n) = n + 2 T(k/2)
```java
public ListNode mergeKLists(List<ListNode> lists) {
    Queue<ListNode> heap = new PriorityQueue(new Comparator<ListNode>(){
        @Override public int compare(ListNode l1, ListNode l2) { 
            return Integer.compare(l1.val, l2.val);
        }
    });
    ListNode head = new ListNode(0), tail = head;
    for (ListNode node : lists) if (node != null) heap.offer(node);
    while (!heap.isEmpty()) {
        tail.next = heap.poll();
        tail = tail.next;
        if (tail.next != null) heap.offer(tail.next);
    }
    return head.next;
}
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

- [LeetCode 25 - Reverse Nodes in k-Group]()