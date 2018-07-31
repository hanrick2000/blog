### Quick Sort
```java
public static void RandomizedQuickSort(int[] array, int startIndex, int endIndex) {
  if (startIndex < endIndex) {
    int pivot = randomizedPartition(array, startIndex, endIndex);
    RandomizedQuickSort(array, startIndex, pivot - 1);
    RandomizedQuickSort(array, pivot + 1, endIndex);
  }
}
public static int randomizedPartition(int[] array, int startIndex, int endIndex) {
  int randomEndIndex = randomNumberBetween(startIndex, endIndex);
  swap(array, endIndex, randomEndIndex);
  return partition(array, startIndex, endIndex);
}
public static int randomNumberBetween(int startNumber, int endNumber) {
  return (int) Math.floor(Math.random() * (endNumber - startNumber + 1) + startNumber);
}
public static int partition(int[] array, int startIndex, int endIndex) {
  int pivotValue = array[endIndex];
  int pivotIndex = startIndex;
  for (int j = startIndex; j < endIndex; j++) {
    if (array[j] <= pivotValue) {
      swap(array, pivotIndex, j);
      pivotIndex = pivotIndex + 1;
    }
  }
  swap(array, pivotIndex, endIndex);
  return pivotIndex;
}
```

- [LeetCode 215 - Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array/discuss/60294/Solution-explained)
  - [quick select](https://yuanhsh.iteye.com/blog/2213686)
```java
public int findKthLargest(int[] nums, int k) {
    shuffle(nums);
    return findKthLargest(nums, 0, nums.length-1, k-1);  
}  
private int findKthLargest(int[] nums, int l, int h, int k) {  
    if(k<l || k>h) return -1;  
    int p = partition(nums, l, h);  
    if(p == k) {  
        return nums[p];  
    } else if(p > k) {  
        return findKthLargest(nums, l, p-1, k);  
    } else {  
        return findKthLargest(nums, p+1, h, k);  
    }  
}  
private int partition(int[] nums, int l, int h) {  
    int pivot = nums[h];  
    int p = l;  
    for(int i=l; i<h; i++) {  
        if(nums[i]>pivot) {  
            swap(nums, i, p++);  
        }  
    }  
    swap(nums, p, h);  
    return p;  
}
```

- [LeetCode 148 - Sort List](https://www.jiuzhang.com/solutions/sort-list/)
  - [merge sort](https://www.jiuzhang.com/solutions/sort-list/)
  - quick sort
```java
private ListNode findMiddle(ListNode head) {
    ListNode slow = head, fast = head.next;
    while (fast != null && fast.next != null) {
        fast = fast.next.next;
        slow = slow.next;
    }
    return slow;
}    
private ListNode merge(ListNode head1, ListNode head2) {
    ListNode dummy = new ListNode(0);
    ListNode tail = dummy;
    while (head1 != null && head2 != null) {
        if (head1.val < head2.val) {
            tail.next = head1;
            head1 = head1.next;
        } else {
            tail.next = head2;
            head2 = head2.next;
        }
        tail = tail.next;
    }
    if (head1 != null) {
        tail.next = head1;
    } else {
        tail.next = head2;
    }
    return dummy.next;
}
public ListNode sortList(ListNode head) {
    if (head == null || head.next == null) {
        return head;
    }
    ListNode mid = findMiddle(head);
    ListNode right = sortList(mid.next); // sort right part first
    mid.next = null;
    ListNode left = sortList(head);
    return merge(left, right);
}
```