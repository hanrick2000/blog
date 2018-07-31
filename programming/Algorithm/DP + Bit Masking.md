### Bit Mask - 2^n, 4^n
- [Add the jth object to the subset: A |= (1 << j)](https://codeforces.com/blog/entry/18169)
- To toggle (flip the status of) the j-th item of the set: A∧=(1 << j)

### Applications
- time complexity is 2^n, 4^n
- use bit (0,1) to choose the element or not
- visit all nodes
<!-- existence or different cases -->

### 状态压缩
### 状态压缩 + DP or DFS cache
- end: bit masking == target

### Bit masks to store states/visited nodes
### Bit masking for every cases
- [LeetCode 784 - Letter Case Permutation](http://www.cnblogs.com/grandyang/p/9065702.html)
  - [Bit masking](http://www.cnblogs.com/grandyang/p/9065702.html)
  - [BFS or DFS](https://leetcode.com/problems/letter-case-permutation/discuss/115485/Java-Easy-BFS-DFS-solution-with-explanation)
  - [BFS without using queue](https://leetcode.com/problems/letter-case-permutation/discuss/115671/Java-9-lines-iterative-code-using-backtracking.)

- [LeetCode 78 - Subsets](https://leetcode.com/problems/subsets/discuss/27278/C%2B%2B-RecursiveIterativeBit-Manipulation)
  - Time complexity: O(N*2^N)
  - [BFS](https://leetcode.com/problems/subsets/discuss/27294/simple-iteration-no-recursion-no-twiddling-explanation)
  - [DFS](https://leetcode.com/problems/subsets/discuss/27281/a-general-approach-to-backtracking-questions-in-java-subsets-permutations-combination-sum-palindrome-partitioning)
  - [Bit mask](https://leetcode.com/problems/subsets/discuss/27543/Simple-Java-Solution-Using-Bit-Operations)
```java
public List<List<Integer>> subsets(int[] nums) {
    int n = nums.length;
    Arrays.sort(nums);
    List<List<Integer>> subsets = new ArrayList<>();
    for (int i = 0; i < Math.pow(2, n); i++)
    {
        List<Integer> subset = new ArrayList<>();
        for (int j = 0; j < n; j++)
        {
            if (((1 << j) & i) != 0)
                subset.add(nums[j]);
        }
        subsets.add(subset);
    }
    return subsets;
}
```
- [LeetCode 90 - Subsets II - Contains duplicates](https://discuss.leetcode.com/topic/12706/java-solution-using-bit-manipulation)

### Examples
- [LeetCode 320 - Generalized Abbreviation](http://www.cnblogs.com/grandyang/p/5261569.html)
  - For each char c[i], either abbreviate it or not.
  - [append the character when corresponding bit is 0, otherwise accumulate the count](http://www.cnblogs.com/grandyang/p/5261569.html)
  - [dfs](http://www.cnblogs.com/grandyang/p/5261569.html)
```java
private String abbr(String word, int x) {
    StringBuilder builder = new StringBuilder();
    int m = 0;
    for (int i = 0; i < word.length(); ++i, x >>= 1) {
        if ((x & 1) == 0) {
            if (m > 0) builder.append(m);
            m = 0;
            builder.append(word.charAt(i));
        }
        m += x & 1;// change to else m++;
    }
    if (m > 0) builder.append(m);//\\
    return builder.toString();
}
```
### DP - Bit Mask
- See TSP
- [LeetCode 473 - Matchsticks to Square](https://leetcode.com/problems/matchsticks-to-square/discuss/95746/C%2B%2B-bit-masking-%2B-DP-solution-with-detailed-comments)
```cpp
// go through all possible subsets each represented by a bitmask
for (int mask = 0; mask <= all; mask++) {
    long subsetSum = 0;
    // calculate the sum of this subset
    for (int i = 0; i < 32; i++) {
      if ((mask >> i) & 1)
        subsetSum += nums[i];
    }
    // if this subset has what we want
    if (subsetSum == sideLen) {
      for (int usedMask : usedMasks) {
          // if this mask and usedMask are mutually exclusive
          if ((usedMask & mask) == 0) {
          // then they form a valid half subset whose sum is 2 * sideLen,
          // that can be further partitioned into two equal subsets (usedMask and mask)
          int validHalf = usedMask | mask;
          validHalfSubsets[validHalf] = true;
          // if in the past we concluded that the other half is also a valid
          // half subset, DONE!
            if (validHalfSubsets[all ^ validHalf])
              return true;
            }
      }
      usedMasks.push_back(mask);
    }
}
```