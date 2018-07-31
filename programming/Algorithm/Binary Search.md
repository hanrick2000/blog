#### Binary search
##### Application
- optimize O(n) to logn
- the intersection of down and up functions 
  - [LeetCode 887 - Super Egg Drop](https://leetcode.com/articles/super-egg-drop/)
- Minimize Max

#### Types
1. Compare left, right, mid
2. compare mid, mid-1, mid+1
- [LeetCode 658 - Find K Closest Elements](https://leetcode.com/problems/find-k-closest-elements/discuss/106426/JavaC%2B%2BPython-Binary-Research-O(log(N-K)))
```java
public List<Integer> findClosestElements(List<Integer> arr, int k, int x) {
    int lo = 0, hi = arr.size() - k;
    while (lo < hi) {
        int mid = (lo + hi) / 2;
        if (x - arr.get(mid) > arr.get(mid+k) - x)
            lo = mid + 1;
        else
            hi = mid;
    }
    return arr.subList(lo, lo + k);
}
```

#### Related
- TreeSet, TreeMap
```java
int ret = Arrays.binarySearch(arr, value); 
if(ret < 0) ret = -ret - 1
```

#### Implementation - Different
- Mistakes: deadlock, 
- invariants
- Prefer []
- int mid = left + (right - left) / 2; then left=mid+1
- or **mid = low + ((high - low + 1) / 2);** then left=mid
### Possible Bugs
| | | | |
|-|-|-|-|
low|high|mid|while(?)
mid + 1	| mid - 1|low + ((high - low) / 2)|low <= high
mid + 1	| mid	|low + ((high - low) / 2)	| **low < high**
**mid** |	mid - 1	| **low + ((high - low + 1) / 2)** | low < high
mid	| mid |	X(infinite loop)	| X(invalid)
- loop not exit
- test with cases: left=2, right=3; mid=2
```java
private static int binarySearch0(int[] a, int fromIndex, int toIndex,
                                 int key) {
    int low = fromIndex;
    int high = toIndex - 1;

    while (low <= high) {
        int mid = (low + high) >>> 1;
        int midVal = a[mid];

        if (midVal < key)
            low = mid + 1;
        else if (midVal > key)
            high = mid - 1;
        else
            return mid; // key found
    }
    return -(low + 1);  // key not found.
}
public int searchRightIndex(int[] nums, int left, int right, int target) {  
    while (left <= right) {  
        int mid = (left + right) / 2;  
        if (nums[mid] > target) right = mid - 1;  
        else left = mid + 1;  
    }  
    return right;  
}  
public int searchLeftIndex(int[] nums, int left, int right, int target) {  
    while (left <= right) {  
        int mid = (left + right) / 2;  
        if (nums[mid] < target) left = mid + 1;  
        else right = mid - 1;  
    }  
    return left;  
}  
```
- [LeetCode 69 - Sqrt(x)](https://www.cnblogs.com/grandyang/p/4346413.html)
```java
public int mySqrt(int x) {
    long l=0,r=x; //in case of overflow
    while(l<r){
        long mid=l+(r-l+1)/2;
        if(mid*mid>x) r=mid-1;
        else l=mid;
    }
    return (int)l;
}
int mySqrt(int x) {
    if (x <= 1) return x;
    int left = 0, right = x;
    while (left < right) {
        int mid = left + (right - left) / 2;
        if (x / mid >= mid) left = mid + 1;
        else right = mid;
    }
    return right - 1;
}
```

- when need return low: low is valid value
- [**Given an integer x, find the maximum element y in an array of size N that satisfies the condition y <= x**](https://hackernoon.com/binary-search-in-detail-914944a1434a)
```java
int maxElementLesser(int[] array, int key) {
  int length = array.length;
  int low = 0;
  int high = length - 1;
  while (low < high) {
    int mid = low + ((high - low + 1) / 2);//\\
    int current = array[mid];
    if (current == key) {
      return array[mid];
    } else if (current < key) {
      low = mid;
    } else {
      high = mid - 1;
    }
  }
  return array[low];
}
```

- [LeetCode 300 - Longest Increasing Subsequence](https://leetcode.com/articles/longest-increasing-subsequence/)
  - Binary Search + DP: O(nlogn): dp[i] is the smallest number when length is i
  <!-- - dp[i]保存的是长度为i的LIS结尾元素的最小值 -->
  - LeetCode 354 - Russian doll envelopes
  - [LeetCode 673](https://leetcode.com/problems/number-of-longest-increasing-subsequence/discuss/107295/9ms-C%2B%2B-Explanation%3A-DP-%2B-Binary-search-%2B-prefix-sums-O(NlogN)-time-O(N)-space) [- Number of Longest Increasing Subsequence](http://guoyc.com/post/num_of_lis/dp)
```java
public int lengthOfLIS(int[] nums) {            
    int[] dp = new int[nums.length];
    int len = 0;

    for(int x : nums) {
        int i = Arrays.binarySearch(dp, 0, len, x);
        if(i < 0) i = -(i + 1);
        dp[i] = x;
        if(i == len) len++;
    }
    return len;
}
```

#### Search in rotated sort array

- [LeetCode 153 - Find the minimum element in a sorted and rotated array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/discuss/48484/A-concise-solution-with-proof-in-the-comment)
  - [Recursion](https://www.programcreek.com/2014/02/leetcode-find-minimum-in-rotated-sorted-array/)
```cpp
int findMin(vector<int> &num) {
    int low = 0, high = num.size() - 1;
    while (low < high) {
        auto mid = low + (high - low) / 2;
        if (num[mid] < num[high])
            high = mid;
        else if (num[mid] > num[high])
            low = mid + 1;
    }
    return num[low];
}
```


- [LeetCode 33 - Searching an Element in a Rotated Sorted Array](https://cheonhyangzhang.wordpress.com/2016/11/09/33-leetcode-java-search-in-rotated-sorted-array-hard/)
```java
public int search(int[] nums, int target) {
    int start = 0, end = nums.length - 1;
    while (start <= end) {
        int mid = ( start + end) / 2;
        if (nums[mid] == target) {
            return mid;
        }
        if (nums[start] <= nums[mid]) {
            if (nums[start] <= target && target < nums[mid]) {
                end = mid -1;
            }
            else {
                start = mid + 1;
            }
        }
        else{
            if (nums[mid] < target && target <= nums[end]) {
                start = mid + 1;
            }
            else {
                end = mid -1;
            }
        }
    }
    return -1;
}
```
- LeetCode 81 - Search in Rotated Sorted Array II
- LeetCode 154 - Find Minimum in Rotated Sorted Array II

### Examples
- [LeetCode 540 - Single Element in a Sorted Array](https://leetcode.com/problems/single-element-in-a-sorted-array/discuss/100754/Java-Binary-Search-short-(7l)-O(log(n))-w-explanations)
- [LeetCode 162 - Find Peak Element](http://www.jiuzhang.com/solutions/find-peak-element/)
```cpp
int findPeakElement(const vector<int> &num) 
{
    int low = 0;
    int high = num.size()-1;
    while(low < high)
    {
        int mid1 = low + (high-low)/2;
        int mid2 = mid1+1;
        if(num[mid1] < num[mid2])
            low = mid2;
        else
            high = mid1;
    }
    return low;
}
```

### Duplicates
- [Magic index 2 - with duplicates](https://www.cnblogs.com/wuchanming/p/4149788.html)
```java
int magicHelper(int arr[],int n,int l,int r)
{
    if(l>r||l<0||r>=n)
        return -1;
    int mid=(l+r)/2;
    if(mid==arr[mid])
        return mid;
    int rightindex=min(mid-1,arr[mid]);
    int left=magicHelper(arr,n,l,rightindex);
    if(left>=0)
        return left;
    int leftindex=max(mid+1,arr[mid]);
    int right=magicHelper(arr,n,leftindex,r);
    return right;
}
int magicFast(int arr[],int n)
{
    if(n==0)
        return -1;
    return magicHelper(arr,n,0,n-1);
}
```

- [Smallest Rectangle Enclosing Black Pixels]
```java
public int minArea(char[][] image, int x, int y) {
 int m = image.length, n = image[0].length;
 int colMin = binarySearch(image, true, 0, y, 0, m, true);
 int colMax = binarySearch(image, true, y + 1, n, 0, m, false);
 int rowMin = binarySearch(image, false, 0, x, colMin, colMax, true);
 int rowMax = binarySearch(image, false, x + 1, m, colMin, colMax, false);
 return (rowMax - rowMin) * (colMax - colMin);
}

public int binarySearch(char[][] image, boolean horizontal, int lower, int upper, int min, int max, boolean goLower) {
 while(lower < upper) {
  int mid = lower + (upper - lower) / 2;
  boolean inside = false;
     for(int i = min; i < max; i++) {
      if((horizontal ? image[i][mid] : image[mid][i]) == '1') {
       inside = true; 
       break;
      }
     }
  if(inside == goLower) {
   upper = mid;
  } else {
   lower = mid + 1;
  }
 }
 return lower;
}
```