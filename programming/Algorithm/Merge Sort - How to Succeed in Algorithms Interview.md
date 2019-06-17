#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### [Merge Sort](https://www.cs.cmu.edu/~adamchik/15-121/lectures/Sorting%20Algorithms/code/MergeSort.java)
- divide and conquer: left, right, count values while merging left and right
- merge procedure with auxiliary array

#### [Merge sort code](http://www.jiuzhang.com/solutions/reverse-pairs/)
```java
private int merge(int[] A, int start, int mid, int end) {
    int[] temp = new int[A.length];
    int leftIndex = start;
    int rightIndex = mid + 1;
    int index = start;
    int sum = 0;
    while (leftIndex <= mid && rightIndex <= end) {
        if (A[leftIndex] <= A[rightIndex]) {
            temp[index++] = A[leftIndex++];
        } else {
            temp[index++] = A[rightIndex++];
            sum += mid - leftIndex + 1;
        }
    }
    while (leftIndex <= mid) {
        temp[index++] = A[leftIndex++];
    }
    while (rightIndex <= end) {
        temp[index++] = A[rightIndex++];
    }
    for (int i = start; i <= end; i++) {
        A[i] = temp[i];
    }
    return sum;
}
```
- [LeetCode 23 - Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/discuss/10528/A-java-solution-based-on-Priority-Queue)
- [Merge K Sorted Iterators - Linkedin](http://www.1point3acres.com/bbs/thread-123314-1-1.html)
```java
public Iterable<Integer> mergeKSortedIterators(Iterator<Integer>[] iters){
     Queue<IntIter> minHeap = new PriorityQueue<IntIter>(iters.length, new iteratorComp());
     List<Integer> result = new ArrayList<Integer>();
     for(Iterator<Integer> iter : iters){
         if(iter.hasNext()){
             minHeap.add(new IntIter(iter));
         }
     }
     while(!minHeap.isEmpty()){
         IntIter curr = minHeap.poll();
         result.add(curr.next);
         if(curr.iter.hasNext()){
             minHeap.add(new IntIter(curr.iter));
         }. visit 1point3acres.com for more.
     }
     return result;
 }
 public class iteratorComp implements Comparator<IntIter>{
     public int compare(IntIter a, IntIter b){
         return a.next - b.next;
     }
 }
 public class IntIter {
     int next;
     Iterator<Integer> iter;
     public IntIter(Iterator<Integer> iter) {
         this.next = iter.next();
         this.iter = iter;
     }
 }
```

#### Merge two sorted arrays
- [Find the sum of the maximum sum path to reach from beginning of any array to end of any of the two arrays. We can switch from one array to another array only at common elements](https://www.geeksforgeeks.org/maximum-sum-path-across-two-arrays/)
- [LeetCode 632 - Smallest Range (shortest range in k-sorted lists)](https://leetcode.com/articles/smallest-range/)
  - Find the smallest range that includes at least one number from each of the klists.

#### Divide and conquer + merge sort
- [Count pairs in an array that hold i*arr[i] > j*arr[j]](https://www.geeksforgeeks.org/count-pairs-array-hold-iarri-jarrj/)
- [LeetCode 493 - Reverse Pairs: count inversions in an array](https://www.geeksforgeeks.org/counting-inversions/)
  - [Number of swaps to sort when only adjacent swapping allowed](https://www.geeksforgeeks.org/number-swaps-sort-adjacent-swapping-allowed/)
  - [build the Binary Search Tree from right to left and search the partially built tree with nums[i]/2.0](https://leetcode.com/problems/reverse-pairs/discuss/97280/very-short-and-clear-mergesort-bst-java-solutions)
```java
public int reversePairs(int[] nums) {
    if (nums == null || nums.length == 0) return 0;
    return mergeSort(nums, 0, nums.length - 1);
}
private int mergeSort(int[] nums, int l, int r) {
    if (l >= r) return 0;
    int mid = l + (r - l)/2;
    int count = mergeSort(nums, l, mid) + mergeSort(nums, mid + 1, r);
    int[] cache = new int[r - l + 1];
    int i = l, t = l, c = 0;
    for (int j = mid + 1; j <= r; j++, c++) {
        while (i <= mid && nums[i] <= 2 * (long)nums[j]) i++;
        while (t <= mid && nums[t] < nums[j]) cache[c++] = nums[t++];
        cache[c] = nums[j];
        count += mid - i + 1;
    }
    while (t <= mid) cache[c++] = nums[t++];
    System.arraycopy(cache, 0, nums, l, r - l + 1);
    return count;
}
```
- [Positive-Negative partitioning preserving order](https://www.geeksforgeeks.org/rearrange-positive-and-negative-numbers/)
  - merge in such a way that negative part of left and right sub-array is copied first followed by positive part of left and right sub-array
- [LeetCode 315 - Count of Smaller Numbers After Self]((https://leetcode.com/problems/count-of-smaller-numbers-after-self/discuss/76584/mergesort-solution))
  - [Augmented BST: dupCnt, smallerCnt](https://leetcode.com/problems/count-of-smaller-numbers-after-self/discuss/76580/9ms-short-Java-BST-solution-get-answer-when-building-BST)
  - [merge sort](https://leetcode.com/problems/count-of-smaller-numbers-after-self/discuss/76584/mergesort-solution)
    <!-- - 归并排序后，虽然数组有序的，但是原始顺序变化了，计算每个元素数量需要找到他们的位置，因此需要记录每个元素的index -->
    - count[i] = count of nums[j] - nums[i] < 0 with j > i
```java
private Pair[] mergeSort(Pair[] arr, Integer[] smaller) {
    if (arr.length <= 1) {
        return arr;
    }
    int mid = arr.length / 2;
    Pair[] left = mergeSort(Arrays.copyOfRange(arr, 0, mid), smaller);
    Pair[] right = mergeSort(Arrays.copyOfRange(arr, mid, arr.length), smaller);
    for (int i = 0, j = 0; i < left.length || j < right.length;) {
        if (j == right.length || i < left.length && left[i].val <= right[j].val) {
            arr[i + j] = left[i];
            smaller[left[i].index] += j;
            i++;
        } else {
            arr[i + j] = right[j];
            j++;
        }
    }
    return arr;
}
```
- [LeetCode 327 - Count of Range Sum: return the number of range sums that lie in (lower, upper)]((https://leetcode.com/problems/count-of-range-sum/discuss/77990/share-my-solution))
```text
Given an integer array nums, return the number of range sums that lie in [lower, upper] inclusive.
Range sum S(i, j) is defined as the sum of the elements in nums between indices i and j (i ≤ j), inclusive.
Note:
A naive algorithm of O(n2) is trivial. You MUST do better than that.
Example:
Given nums = [-2, 5, -1], lower = -2, upper = 2,
Return 3.
The three ranges are : [0, 0], [2, 2], [0, 2] and their respective sums are: -2, -1, 2.
```
  - [Augmented BST: dupCnt, leftSize, rightSize](https://leetcode.com/problems/count-of-range-sum/discuss/78003/Java-BST-solution-averagely-O(nlogn))
  - [merge sort](https://leetcode.com/problems/count-of-range-sum/discuss/77990/share-my-solution)
    - count[i] = count of a <= S[j] - S[i] <= b with j > i
    - [In merge, separate calculate answer and merge to 2 steps](https://blog.csdn.net/qq508618087/article/details/51435944)
```java
public int countRangeSum(int[] nums, int lower, int upper) {
    int n = nums.length;
    long[] sums = new long[n + 1];
    for (int i = 0; i < n; ++i)
        sums[i + 1] = sums[i] + nums[i];
    return countWhileMergeSort(sums, 0, n + 1, lower, upper);
}

private int countWhileMergeSort(long[] sums, int start, int end, int lower, int upper) {
    if (end - start <= 1) return 0;
    int mid = (start + end) / 2;
    int count = countWhileMergeSort(sums, start, mid, lower, upper)
              + countWhileMergeSort(sums, mid, end, lower, upper);
    int j = mid, k = mid, t = mid;
    long[] cache = new long[end - start];
    for (int i = start, r = 0; i < mid; ++i, ++r) {
        while (k < end && sums[k] - sums[i] < lower) k++;
        while (j < end && sums[j] - sums[i] <= upper) j++;
        while (t < end && sums[t] < sums[i]) cache[r++] = sums[t++];
        cache[r] = sums[i];
        count += j - k;
    }
    System.arraycopy(cache, 0, sums, start, t - start);
    return count;
}
```

- [Shuffling a linked list](https://www.cnblogs.com/evasean/p/7232572.html)
- [Find a permutation that causes worst case of Merge Sort](http://www.geeksforgeeks.org/find-a-permutation-that-causes-worst-case-of-merge-sort/)
- [LeetCode 148 - Sort LinkedList](http://www.jiuzhang.com/solutions/sort-list/)
  - fake head ListNode fakehead = new ListNode(-1);
- [Maximum Sum Path in Two Arrays](http://www.geeksforgeeks.org/maximum-sum-path-across-two-arrays/)
  - We can switch from one array to another array only at common elements.
