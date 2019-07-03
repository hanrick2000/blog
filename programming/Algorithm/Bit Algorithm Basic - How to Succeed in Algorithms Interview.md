### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

- Get all 1-bits ~0
- n&(n+1) == 0 to check whether all 1s(if exists) are at the end: like 00001111.
#### Extract last bit
- A&-A or A&~(A-1) or x^(x&(x-1))
```java
public boolean isPowerOfTwo(int n) {
    return n > 0 && (n & -n) == n;
}
```
#### Remove last bit: A&(A-1)
- n&(n-1) == 0 to check whether there is only 1.
- Check count of set bit
- Remove last bit: A&(A-1)
  - make the the first 1 from end to become 0.
```java
public boolean isPowerOfTwo(int n) {
   return ((n & (n-1))==0 && n>0);
}
```

#### ^ tricks
- X^X = 0, A ^ B ^ A = B
- 0^A = A
- use ^ to get corresponding bits are different
- Use ^ to remove even exactly same numbers and save the odd, or save the distinct bits and remove the same.
```java
// https://leetcode.com/problems/hamming-distance/discuss/94713/Java-solution
public int hammingDistance(int x, int y) {
    int xor = x ^ y, count = 0;

    while (xor != 0) {
        xor &= (xor - 1);
        count++;
    }
    return count;
}
bool hasAlternatingBits(int n) {
    return !((n ^= n/4) & n-1);
}
bool hasAlternatingBits(int n) {
    return !((n ^= n/2) & n+1);
}
```

#### Bit + DP
- dp[i] = dp[i >> 1] + dp[i & 1]
- [TopCoder ImportsList](https://apps.topcoder.com/forums/?module=Thread&threadID=671561&start=0)

#### XOR
##### [LintCode 196 - Find the Missing Number I](https://www.kancloud.cn/kancloud/data-structure-and-algorithm-notes/73113)
```text
Given an array contains N numbers of 0 .. N, find which number doesn't exist in the array.
Example
Given N = 3 and the array [0, 1, 3], return 2.
```
- [XOR](https://www.kancloud.cn/kancloud/data-structure-and-algorithm-notes/73113)
- [Put Ai to i and keep swapping](https://zhengyang2015.gitbooks.io/lintcode/find_the_missing_number_196.html)
```java
public int findMissing(int[] nums) {
    int x = 0;
    for (int i = 0; i <= nums.length; i++) {
        x ^= i;
    }
    for (int i = 0; i < nums.length; i++) {
        x ^= nums[i];
    }
    return x;
}
public int findMissing(int[] nums) {
    //和first missing positive number思想一样。遍历数组，看当前位置上的数和其下标是否一致，若不一致，则将该数和正确下标位置上的数交换，然后继续检查新来的数，直到满足条件为止。
    if(nums == null || nums.length == 0){
        return 0;
    }
    for(int i = 0; i < nums.length; i++){
        while(nums[i] != i && nums[i] < nums.length){
            //index为num[i]因该被放到的位置
            int index = nums[i];
            //若要放到的位置上已经有正确的数则不交换
            if(nums[index] == nums[i]){
                break;
            }
            int temp = nums[i];
            nums[i] = nums[index];
            nums[index] = temp;
        }
    }
    for(int i = 0; i < nums.length; i++){
        if(nums[i] != i){
            return i;
        }
    }
    return nums.length;
}
```

#### Misc
- [LeetCode 371 - Sum of Two Integers](http://www.geeksforgeeks.org/add-two-numbers-without-using-arithmetic-operators/)
```java
// https://leetcode.com/problems/sum-of-two-integers/discuss/84290/Java-simple-easy-understand-solution-with-explanation
public int getSum(int a, int b) {
	if (a == 0) return b;
	if (b == 0) return a;

	while (b != 0) {
		int carry = a & b;
		a = a ^ b;
		b = carry << 1;
	}
	return a;
}

// Iterative
public int getSubtract(int a, int b) {
	while (b != 0) {
		int borrow = (~a) & b;
		a = a ^ b;
		b = borrow << 1;
	}
	return a;
}

```

```java
Integer.bitCount(n);
Integer.highestOneBit(num);
String bits = Integer.toBinaryString(n);

Integer.numberOfLeadingZeros(n)
floor(log2(x)) = 31 - numberOfLeadingZeros(x)
ceil(log2(x)) = 32 - numberOfLeadingZeros(x - 1)

```

- [LeetCode 190 - Reverse Bits](https://leetcode.com/problems/reverse-bits/discuss/54916/whats-with-the-follow-up)
  - Lookup Table
```java
public int reverseBits(int n) {
    // note: mutating formal parameter
    n = ((n & 0x5555_5555) << 1) | ((n >>> 1) & 0x5555_5555);
    n = ((n & 0x3333_3333) << 2) | ((n >>> 2) & 0x3333_3333);
    n = ((n & 0x0F0F_0F0F) << 4) | ((n >>> 4) & 0x0F0F_0F0F);
    return (n >>> 24) | ((n >>> 8) & 0xFF00) | ((n & 0xFF00) << 8) | (n << 24);
}
c = (BitReverseTable256[v & 0xff] << 24) |
    (BitReverseTable256[(v >> 8) & 0xff] << 16) |
    (BitReverseTable256[(v >> 16) & 0xff] << 8) |
    (BitReverseTable256[(v >> 24) & 0xff]);
```

#### Resources
- <https://leetcode.com/problems/sum-of-two-integers/discuss/84278/a-summary-how-to-use-bit-manipulation-to-solve-problems-easily-and-efficiently>

