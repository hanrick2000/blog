
- [Merge Sort](https://www.cs.cmu.edu/~adamchik/15-121/lectures/Sorting%20Algorithms/code/MergeSort.java)
- divide and conquer
- merge procedure with auxiliary array


#### Merge two sorted arrays
- [Find the sum of the maximum sum path to reach from beginning of any array to end of any of the two arrays. We can switch from one array to another array only at common elements](https://www.geeksforgeeks.org/maximum-sum-path-across-two-arrays/)
- [LeetCode 632 - Smallest Range (shortest range in k-sorted lists)](https://leetcode.com/articles/smallest-range/)

#### Divide and conquer + merge sort
- [LeetCode 493 - Reverse Pairs: count inversions in an array](https://www.geeksforgeeks.org/counting-inversions/)
  - [Number of swaps to sort when only adjacent swapping allowed](https://www.geeksforgeeks.org/number-swaps-sort-adjacent-swapping-allowed/)
  - [Count pairs in an array that hold i*arr[i] > j*arr[j]](https://www.geeksforgeeks.org/count-pairs-array-hold-iarri-jarrj/)

- [Positive-Negative partitioning preserving order](https://www.geeksforgeeks.org/rearrange-positive-and-negative-numbers/)
  - merge in such a way that negative part of left and right sub-array is copied first followed by positive part of left and right sub-array

- LeetCode 315 - Count of Smaller Numbers After Self
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

- LeetCode 327 - Count of Range Sum: return the number of range sums that lie in [lower, upper]
  - [Augmented BST: dupCnt, leftSize, rightSize](https://leetcode.com/problems/count-of-range-sum/discuss/78003/Java-BST-solution-averagely-O(nlogn))
  - [merge sort](https://leetcode.com/problems/count-of-range-sum/discuss/77990/share-my-solution)
    - count[i] = count of a <= S[j] - S[i] <= b with j > i
    - [In merge, separate calculate answer and merge to 2 steps](https://blog.csdn.net/qq508618087/article/details/51435944)
```cpp
int mergeSort(vector<long>& sum, int lower, int upper, int low, int high)
{
    if(high-low <= 1) return 0;
    int mid = (low+high)/2, m = mid, n = mid, count =0;
    count = mergeSort(sum,lower,upper,low,mid) + mergeSort(sum,lower,upper,mid,high);
    for(int i =low; i< mid; i++)
    {
        while(m < high && sum[m] - sum[i] < lower) m++;
        while(n < high && sum[n] - sum[i] <= upper) n++;
        count += n - m;
    }
    inplace_merge(sum.begin()+low, sum.begin()+mid, sum.begin()+high);
    return count;
}
int countRangeSum(vector<int>& nums, int lower, int upper) {
    int len = nums.size();
    vector<long> sum(len + 1, 0);
    for(int i =0; i< len; i++) sum[i+1] = sum[i]+nums[i];
    return mergeSort(sum, lower, upper, 0, len+1);
}
```

- [Shuffling a linked list](https://www.cnblogs.com/evasean/p/7232572.html)


