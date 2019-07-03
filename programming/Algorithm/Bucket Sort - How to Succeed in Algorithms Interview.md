#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Buckets
- fixed window size: k
- find min or max diff between adjacent elements
- the max size/frequency is limited, less than array size etc
- when optimize to O(n)
- 分桶; 统计
- map a range of values to the a bucket
- check elements in the same bucket or previous/next bucket
- Pigeon hole principle
  - if nn items are put into mm containers, with n>m, then at least one container must contain more than one item.

#### Implementation Detail
```java
List<List<Integer>> bucket = new ArrayList<>(size);
List<Integer>[] bucket = new List[nums.length+1];
// or use map
Map<Integer, List<Character>> map = new HashMap<>();
```
#### Simple
- [LeetCode 539 - Minimum Time Difference](https://leetcode.com/problems/minimum-time-difference/discuss/100640/Verbose-Java-Solution-Bucket)
  - finite set + bucket
- [LeetCode 347 - Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/discuss/81602/Java-O(n)-Solution-Bucket-Sort)
  - [Bucket sort: bucket = new ArrayList<>(maxFrequency)](https://leetcode.com/problems/top-k-frequent-elements/discuss/81602/Java-O(n)-Solution-Bucket-Sort)
```java
public List<Integer> topKFrequent(int[] nums, int k) {
 Map<Integer, Integer> frequencyMap = new HashMap<>();
 int maxFrequency = 0;
 for (int n : nums) {
  int frequency = frequencyMap.getOrDefault(n, 0) + 1;
  frequencyMap.put(n, frequency);
  maxFrequency = Math.max(maxFrequency, frequency);
 }
 List<List<Integer>> bucket = new ArrayList<>(maxFrequency);
 while (maxFrequency-- >= 0) {
  bucket.add(new ArrayList<>());
 }
 for (Map.Entry<Integer, Integer> entry : frequencyMap.entrySet()) {
  int frequency = entry.getValue();
  bucket.get(frequency).add(entry.getKey());
 }
 List<Integer> res = new ArrayList<>();
 for (int pos = bucket.size() - 1; pos >= 0 && res.size() < k; pos--) {
  res.addAll(bucket.get(pos));
 }
 return res;
}
```
- [LeetCode 451 - Sort Characters By Frequency](https://leetcode.com/problems/sort-characters-by-frequency/discuss/93420/Java-O(n)-Bucket-Sort-Solution-O(nlogm)-PriorityQueue-Solution-easy-to-understand)
- [Sorting a deck of cards](https://gist.github.com/bookybooky/d79a868a4ce7a891afcc85e6744ffb72)
  - bucket sort + Keep swapping

#### Hard Examples
- [LeetCode 683 - K Empty Slots](https://www.cnblogs.com/lightwindy/p/9727403.html)
    - [sliding window: find a match when i reaches end of current window](https://www.cnblogs.com/lightwindy/p/9727403.html)
    - [O(kn) brute force]
    - [TreeSet: lower/higher](https://blog.csdn.net/katrina95/article/details/79070941)
    - [Bucket](https://zxi.mytechroad.com/blog/simulation/leetcode-683-k-empty-slots/)
```java
int kEmptySlots(vector<int>& flowers, int k) {
    int n = flowers.size();
    if (n == 0 || k >= n) return -1;
    ++k;
    int bs = (n + k - 1) / k;
    vector<int> lows(bs, INT_MAX);
    vector<int> highs(bs, INT_MIN);
    for (int i = 0; i < n; ++i) {
        int x = flowers[i];
        int p = x / k;
        if (x < lows[p]) {
            lows[p] = x;
            if (p > 0 && highs[p - 1] == x - k) return i + 1;
        }
        if (x > highs[p]) {
            highs[p] = x;
            if (p < bs - 1 && lows[p + 1] == x + k) return i + 1;
        }            
    }

    return -1;
}
```

- [LeetCode 164 - Maximum Gap](https://leetcode.com/problems/maximum-gap/discuss/50643/bucket-sort-java-solution-with-explanation-on-time-and-space)
  - [Bucket sort](https://leetcode.com/problems/maximum-gap/discuss/50643/bucket-sort-java-solution-with-explanation-on-time-and-space)
  - the maximum gap will be no smaller than ceiling[(B - A) / (N - 1)]
  - [The maximum difference between elements in the same buckets will be at most len - 1, so the final answer will not be taken from two elements in the same buckets](http://codesniper.blogspot.com/2015/04/164-maximum-gap-leetcode-java.html)
```java
public int maximumGap(int[] num) {
    int max = num[0];
    int min = num[0];
    for(int i=1; i<num.length; i++){
        max = Math.max(max, num[i]);
        min = Math.min(min, num[i]);
    }
    Bucket[] buckets = new Bucket[num.length+1]; //project to (0 - n)
    for(int i=0; i<buckets.length; i++){
        buckets[i] = new Bucket();
    }
    double interval = (double) num.length / (max - min);
    for(int i=0; i<num.length; i++){
        int index = (int) ((num[i] - min) * interval);
        if(buckets[index].low == -1){
            buckets[index].low = num[i];
            buckets[index].high = num[i];
        }else{
            buckets[index].low = Math.min(buckets[index].low, num[i]);
            buckets[index].high = Math.max(buckets[index].high, num[i]);
        }
    }
    int result = 0;
    int prev = buckets[0].high;
    for(int i=1; i<buckets.length; i++){
        if(buckets[i].low != -1){
            result = Math.max(result, buckets[i].low-prev);
            prev = buckets[i].high;
        }
    }
    return result;
}
```
- [LeetCode 220 - Contains Duplicate III](https://leetcode.com/problems/contains-duplicate-iii/discuss/61645/AC-O(N)-solution-in-Java-using-buckets-with-explanation)
  - [whether there are two distinct indices i and j in the array such that the absolute difference between nums[i] and nums[j] is at most t and the absolute difference between i and j is at most k](https://baihuqian.github.io/2018-07-06-contains-duplicate-iii/)
  - [pre-sort with index](https://leetcode.com/problems/contains-duplicate-iii/discuss/61734/AC-Java-solution-without-set-or-dictionary.-Sort-the-nums-and-record-the-positions)
  - [Sliding window + TreeSet/Map](https://leetcode.com/problems/contains-duplicate-iii/discuss/61655/Java-O(N-lg-K)-solution)
  - [Sliding window + Bucket sort](https://leetcode.com/problems/contains-duplicate-iii/discuss/61639/JavaPython-one-pass-solution-O(n)-time-O(n)-space-using-buckets)
    - [Divide numbers into buckets of size t + 1. For example, numbers between 0 and t are in bucket 0, and numbers between t + 1 and 2t + 1 are in bucket 1(https://zhuhan0.blogspot.com/2017/06/leetcode-220-contains-duplicate-iii.html)
```java
private long getID(long i, long w) {
    return i < 0 ? (i + 1) / w - 1 : i / w;
}
public boolean containsNearbyAlmostDuplicate(int[] nums, int k, int t) {
    if (t < 0) return false;
    Map<Long, Long> d = new HashMap<>();
    long w = (long)t + 1;
    for (int i = 0; i < nums.length; ++i) {
        long m = getID(nums[i], w);
        if (d.containsKey(m))
            return true;
        if (d.containsKey(m - 1) && Math.abs(nums[i] - d.get(m - 1)) < w)
            return true;
        if (d.containsKey(m + 1) && Math.abs(nums[i] - d.get(m + 1)) < w)
            return true;
        d.put(m, (long)nums[i]);
        if (i >= k) d.remove(getID(nums[i - k], w));
    }
    return false;
}
```
- [LeetCode 220 - Contains Duplicate III](https://discuss.leetcode.com/topic/15199/ac-o-n-solution-in-java-using-buckets-with-explanation)
- [LeetCode 826 - Most Profit Assigning Work](https://zxi.mytechroad.com/blog/greedy/leetcode-826-most-profit-assigning-work/)
  - difficulty is in limited range
  - for each difficulty D, find the most profit job whose requirement is <= D
