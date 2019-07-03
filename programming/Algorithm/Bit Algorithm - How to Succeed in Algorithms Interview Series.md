#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Bit String
##### [LeetCode 320 - Generalized Abbreviation](http://www.cnblogs.com/grandyang/p/5261569.html)
```text
Write a function to generate the generalized abbreviations of a word.
Example:
Given "word"
Return the following list (order does not matter):
["word", "1ord", "w1rd", "wo1d", "wor1", "2rd", "w2d", "wo2", "1o1d", "1or1", "w1r1", "1o2", "2r1", "3d", "w3", "4"]
```
- For each char c[i], either abbreviate it or not.
- [Bit String: append the character when corresponding bit is 0, otherwise accumulate the count](http://www.cnblogs.com/grandyang/p/5261569.html)
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


#### O(32N) - bit count
- Compute every bit separately, build the answer bit by bit
- count the sum of each 32 bits separately and compare the expected answer to get the result
- the result is one value: missing/redundant
- less efficient than nlgn

##### [LeetCode 477 - Total Hamming Distance](https://leetcode.com/problems/total-hamming-distance/discuss/96226/java-on-time-o1-space)
```text
The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
Now your job is to find the total Hamming distance between all pairs of the given numbers.
```
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

##### [Maximum AND value of a pair in an array](https://www.geeksforgeeks.org/print-pair-with-maximum-and-value-in-an-array/)
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

##### [LeetCode 137 - Single Number II](https://leetcode.com/problems/single-number-ii/discuss/43313/A-general-C%2B%2B-solution-for-these-type-problems)
- Given an array of integers, every element appears three times except for one, which appears exactly once. Find that single one.
- [32n](https://leetcode.com/problems/single-number-ii/discuss/43313/A-general-C%2B%2B-solution-for-these-type-problems)
- [ones, twos, threes](https://leetcode.com/problems/single-number-ii/discuss/43403/java-bit-manipulation-solution)
```java
public int singleNumber(int[] nums) {
    int ans = 0;
    for(int i = 0; i < 32; i++) {
        int sum = 0;
        for(int j = 0; j < nums.length; j++) {
            if(((nums[j] >> i) & 1) == 1) {
                sum++;
                sum %= 3;
            }
        }
        if(sum != 0) {
            ans |= sum << i;
        }
    }
    return ans;
}
```

##### [LeetCode 169 - Majority Number I](https://leetcode.com/problems/majority-element/discuss/51649/Share-my-solution-Java-Count-bits)
- Given an array of integers, the majority number is the number that occurs more than 1/3 of the size of the array. Find it.
- [Boyer-Moore Voting](https://leetcode.com/problems/majority-element/discuss/51613/on-time-o1-space-fastest-solution)
- [32n - bit count](https://leetcode.com/problems/majority-element/discuss/51649/Share-my-solution-Java-Count-bits)
- [Divide and Conquer](https://zxi.mytechroad.com/blog/divide-and-conquer/leetcode-169-majority-element/)
```java
public int majorityElement(int[] num) {
    int ret = 0;
    for (int i = 0; i < 32; i++) {
        int ones = 0, zeros = 0;
        for (int j = 0; j < num.length; j++) {
            if ((num[j] & (1 << i)) != 0) {
                ++ones;
            }
            else
                ++zeros;
        }
        if (ones > zeros)
            ret |= (1 << i);
    }
    return ret;
}
```

##### [LeetCode 287 - Find the Duplicate Number](https://leetcode.com/articles/find-the-duplicate-number/)
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

##### [LeetCode 869 - Reordered Power of 2](https://leetcode.com/problems/reordered-power-of-2/discuss/151949/Simple-Java-Solution-Based-on-String-Sorting)
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

#### Bit Trie
##### [Find the maximum subarray XOR in a given array](https://github.com/cherryljr/NowCoder/blob/master/Find%20the%20Maximum%20Subarray%20XOR%20in%20an%20Array.java)
- prefix xor, xor[i,j]=prefix-xor[i]^prefix-xor[j]

##### [LeetCode 421 - Maximum XOR of Two Numbers in an Array](https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/discuss/91049/java-on-solution-using-bit-manipulation-and-hashmap)
- Given a list of numbers, a[0], a[1], a[2], … , a[N-1], where 0 <= a[i] < 2^32. Find the maximum result of a[i] XOR a[j].
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

#### Prefix Xors
- [Count the number of subarrays having a given XOR](https://www.geeksforgeeks.org/count-number-subarrays-given-xor/)

#### Use bit to store info
##### [LeetCode 187 - Repeated DNA Sequences](https://leetcode.com/problems/repeated-dna-sequences/discuss/53867/Clean-Java-solution-(hashmap-%2B-bits-manipulation))
```text
All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T, for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to identify repeated sequences within the DNA.
Write a function to find all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.
Example:
Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"

Output: ["AAAAACCCCC", "CCCCCAAAAA"]
```
```java
public List<String> findRepeatedDnaSequences(String s) {
    Set<Integer> words = new HashSet<>();
    Set<Integer> doubleWords = new HashSet<>();
    List<String> rv = new ArrayList<>();
    char[] map = new char[26];
    //map['A' - 'A'] = 0;
    map['C' - 'A'] = 1;
    map['G' - 'A'] = 2;
    map['T' - 'A'] = 3;
    for(int i = 0; i < s.length() - 9; i++) {
        int v = 0;
        for(int j = i; j < i + 10; j++) {
            v <<= 2;
            v |= map[s.charAt(j) - 'A'];
        }
        if(!words.add(v) && doubleWords.add(v)) {
            rv.add(s.substring(i, i + 10));
        }
    }
    return rv;
}
```

##### [LeetCode 318 - Maximum Product of Word Lengths](https://leetcode.com/problems/maximum-product-of-word-lengths/discuss/77021/32ms-Java-AC-solution)
```text
Given a string array words, find the maximum value of length(word[i]) * length(word[j]) where the two words do not share common letters. You may assume that each word will contain only lower case letters. If no such two words exist, return 0.
```
- [Use bit to check whether two items share same](https://leetcode.com/problems/maximum-product-of-word-lengths/discuss/76959/JAVA-Easy-Version-To-Understand!!!!!!!!!!!!!!!!!)
- `for(char c: words[i].toCharArray()) masks[i] |= 1 << (c - 'a');`{.java}
```java
public static int maxProduct(String[] words) {
  if (words == null || words.length == 0)
    return 0;
  int len = words.length;
  int[] value = new int[len];
  for (int i = 0; i < len; i++) {
    String tmp = words[i];
    value[i] = 0;
    for (int j = 0; j < tmp.length(); j++) {
      value[i] |= 1 << (tmp.charAt(j) - 'a');
    }
  }
  int maxProduct = 0;
  for (int i = 0; i < len; i++)
    for (int j = i + 1; j < len; j++) {
      if ((value[i] & value[j]) == 0 && (words[i].length() * words[j].length() > maxProduct))
        maxProduct = words[i].length() * words[j].length();
    }
  return maxProduct;
}
```

#### Bit tricks
- [LeetCode 260 - Single Number III](https://leetcode.com/problems/single-number-iii/discuss/68900/Accepted-C%2B%2BJava-O(n)-time-O(1)-space-Easy-Solution-with-Detail-Explanations)
- [LeetCode 201 - Bitwise AND of Numbers Range](http://www.cnblogs.com/grandyang/p/4431646.html)
