#### O(32N) - bit count
- Compute every bit separately, build the answer bit by bit
- count the sum of each 32 bits separately and compare the expected answer to get the result
- the result is one value: missing/redundant
- less efficient than nlgn 

- [LeetCode 477 - Total Hamming Distance](https://leetcode.com/problems/total-hamming-distance/discuss/96226/java-on-time-o1-space)
  - Compute every bit separately
```java
public int totalHammingDistance(int[] nums) {
    int total = 0, n = nums.length;
    for (int j=0;j<32;j++) {
        int bitCount = 0;
        for (int i=0;i<n;i++) 
            bitCount += (nums[i] >> j) & 1;
        total += bitCount*(n - bitCount);
    }
    return total;
}
```

- [Maximum AND value of a pair in an array](https://www.geeksforgeeks.org/print-pair-with-maximum-and-value-in-an-array/)
```java
int maxAND (int arr[], int n) 
{ 
    int res = 0, count;    
    // iterate over total of 30bits  from msb to lsb 
    for (int bit = 31; bit >= 0; bit--) 
    { 
        // find the count of element having set msb 
        count = checkBit(res | (1 << bit), arr, n); // key: res | (1 << bit
        // if count >= 2 set particular  bit in result 
        if ( count >= 2 )      
            res |= (1 << bit);      
    }    
    return res; 
} 
```

- [LeetCode 137 - Single Number II]
  - [32n](https://leetcode.com/problems/single-number-ii/discuss/43313/A-general-C%2B%2B-solution-for-these-type-problems)
  - [ones, twos, threes](https://leetcode.com/problems/single-number-ii/discuss/43403/java-bit-manipulation-solution)

- [LeetCode 169 - Majority Number I]
  - [Boyer-Moore Voting](https://leetcode.com/problems/majority-element/discuss/51613/on-time-o1-space-fastest-solution)
  - [32n - bit count](https://leetcode.com/problems/majority-element/discuss/51649/Share-my-solution-Java-Count-bits)
  - [Divide and Conquer](https://zxi.mytechroad.com/blog/divide-and-conquer/leetcode-169-majority-element/)

- [LeetCode 287 - Find the Duplicate Number](https://leetcode.com/articles/find-the-duplicate-number/)
  - [Bisection (1, n), count(nums, int mid)](https://blog.csdn.net/xudli/article/details/48802345)
  - [O(n) find cycle in LinkedList](https://leetcode.com/articles/find-the-duplicate-number/)
  - [32n](https://leetcode.com/problems/find-the-duplicate-number/discuss/72872/o32n-solution-using-bit-manipulation-in-10-lines)
```java
public int findDuplicate(int[] nums) {
    int n = nums.length-1, res = 0;
    for (int p = 0; p < 32; ++ p) {
        int bit = (1 << p), a = 0, b = 0;
        for (int i = 0; i <= n; ++ i) {
            if (i > 0 && (i & bit) > 0) ++a;
            if ((nums[i] & bit) > 0) ++b;
        }
        if (b > a) res += bit;
    }
    return res;
}
```



#### Bit Trie
- [LeetCode 421 - Maximum XOR of Two Numbers in an Array]
  - [divide and conquer - nlogn](http://bookshadow.com/weblog/2016/10/15/leetcode-maximum-xor-of-two-numbers-in-an-array/)
  - [bit trie](https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/discuss/91059/Java-O(n)-solution-using-Trie)
  - [32n + bit prefix](https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/discuss/91049/java-on-solution-using-bit-manipulation-and-hashmap)
```java
public int findMaximumXOR(int[] nums) {
    int max = 0, mask = 0;
        // search from left to right, find out for each bit is there 
    // two numbers that has different value
    for(int i = 31; i >= 0; i--){
     // mask contains the bits considered so far
        mask = mask | (1 << i);
        Set<Integer> set = new HashSet<>();
        // store prefix of all number with right i bits discarded
        for(int num : nums){
            set.add(num & mask);// reserve Left bits and ignore Right bits
        }
        // now find out if there are two prefix with different i-th bit
        // if there is, the new max should be current max with one 1 bit at i-th position, which is candidate
        // and the two prefix, say A and B, satisfies:
        // A ^ B = candidate
        // so we also have A ^ candidate = B or B ^ candidate = A
        // thus we can use this method to find out if such A and B exists in the set 
        int tmp = max | (1 << i); //in each iteration, there are pair(s) whoes Left bits can XOR to max
        for(int prefix : set){
            if(set.contains(tmp ^ prefix)) {
                max = tmp;
                break;
            }
        }
    }
    return max;
}
```

### O(32)
- [LeetCode 869 - Reordered Power of 2](https://leetcode.com/problems/reordered-power-of-2/discuss/151949/Simple-Java-Solution-Based-on-String-Sorting)
  - limited set: power of 2
  - normalized: when order doesn't matter: sort or count array/map
```java
public boolean reorderedPowerOf2(int N) {
    char[] a1 = String.valueOf(N).toCharArray();
    Arrays.sort(a1);
    String s1 = new String(a1);
    
    for (int i = 0; i < 31; i++) {
        char[] a2 = String.valueOf((int)(1 << i)).toCharArray();
        Arrays.sort(a2);
        String s2 = new String(a2);
        if (s1.equals(s2)) return true;
    }
    
    return false;
}
```

