### Limited set

### Brute Force
- when input or result is limited, and easier to implement brute force
- [LeetCode 401 - Binary Watch](https://leetcode.com/problems/binary-watch/discuss/88456/3ms-java-solution-using-backtracking-and-idea-of-permutation-and-combination)
  - [limited set/result: brute force](https://leetcode.com/problems/binary-watch/discuss/88458/simple-pythonjava)
  - [put hour, minutes in same array](https://blog.csdn.net/mebiuw/article/details/52575880)
  - [handle hour/minutes in same dfs func](https://leetcode.com/problems/binary-watch/discuss/88456/3ms-java-solution-using-backtracking-and-idea-of-permutation-and-combination)
```java
public List<String> readBinaryWatch(int num) {
    List<String> times = new ArrayList<>();
    for (int h=0; h<12; h++)
        for (int m=0; m<60; m++)
            if (Integer.bitCount(h * 64 + m) == num)
                times.add(String.format("%d:%02d", h, m));
    return times;        
}
```
- [LeetCode 681 - Next Closest Time](https://www.codetd.com/article/3422355)
```java
public String nextClosestTime(String time) {
    int hour = Integer.parseInt(time.substring(0, 2));
    int min = Integer.parseInt(time.substring(3, 5));
    while (true) {            
        if (++min == 60) {
            min = 0;
            ++hour;
            hour %= 24;
        }
        String curr = String.format("%02d:%02d", hour, min);
        Boolean valid = true;
        for (int i = 0; i < curr.length(); ++i)
            if (time.indexOf(curr.charAt(i)) < 0) {
                valid = false;
                break;
            }
        if (valid) return curr;
    }
}
```

#### Loop/Cycle - Limited possible states
- [LeetCode 957 -  Prison Cells After N Days](https://leetcode.com/articles/prison-cells-after-n-days/)
  - [2^n(n==8)](https://leetcode.com/problems/prison-cells-after-n-days/discuss/205684/JavaPython-Find-the-Loop-Mod-14)
```java
public int[] prisonAfterNDays(int[] cells, int N) {
    Map<String, Integer> seen = new HashMap<>();
    while (N > 0) {
        int[] cells2 = new int[8];
        seen.put(Arrays.toString(cells), N--);
        for (int i = 1; i < 7; ++i)
            cells2[i] = cells[i - 1] == cells[i + 1] ? 1 : 0;
        cells = cells2;
        if (seen.containsKey(Arrays.toString(cells))) {
            N %= seen.get(Arrays.toString(cells)) - N;
        }
    }
    return cells;
}
```

### Limited possible states
- long dp[] = new long[26]

- [LeetCode 940 - Distinct Subsequences II](https://leetcode.com/problems/distinct-subsequences-ii/discuss/192017/C++JavaPython-4-lines-O(N)-Time-O(1)-Space)
  - count the number of distinct, non-empty subsequences of S
  - [endswith[26]: endswith[i] to count how many sub sequence that ends with ith character](https://leetcode.com/problems/distinct-subsequences-ii/discuss/192017/C++JavaPython-4-lines-O(N)-Time-O(1)-Space)
  - [dp[i] represents the count of unique subsequence ends with S[i].if s[j] != s[i], dp[i] += dp[j]; if s[j] == s[i], do nothing to avoid duplicates](https://leetcode.com/problems/distinct-subsequences-ii/discuss/192030/Java-DP-O(N2)-time-greater-O(N)-time-greater-O(1)-space)
  - [countSub(n) = 2*Count(n-1) - Repetition](https://www.geeksforgeeks.org/count-distinct-subsequences/)
```java
public int distinctSubseqII(String S) {
    long end[] = new long[26], mod = (long)1e9 + 7;
    for (char c : S.toCharArray())
        end[c - 'a'] = Arrays.stream(end).sum()%mod + 1;
    return (int)(Arrays.stream(end).sum() % mod);
}
```

### Limited elements in index i
- [LeetCode 898 - Bitwise ORs of Subarrays](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-898-bitwise-ors-of-subarrays/)
  - Simple DP: O(N^2): dp[i][j] := A[i] | A[i + 1] | … | A[j]; dp[i][j] = dp[i][j – 1] | A[j]
  - dp[i] := {A[i], A[i] | A[i – 1], A[i] | A[i – 1] | A[i – 2], … , A[i] | A[i – 1] | … | A[0]}, bitwise ors of all subarrays end with A[i]: suffix
    - dp to store all results
    - dp[i+1] = a[i+1]|{element in dp[i]}
    - The size of the set in dp[i] is <= 32. O(32N)
```java
public int subarrayBitwiseORs(int[] A) {
  Set<Integer> ans = new HashSet<>();
  Set<Integer> cur = new HashSet<>();
  for (int a : A) {
    Set<Integer> next = new HashSet<>();
    next.add(a);
    for (int b : cur)
      next.add(a | b);
    ans.addAll(next);
    cur = next;
  }
  return ans.size();
}
```

### Limited possible results
- [LeetCode 869 - Reordered Power of 2](https://leetcode.com/problems/reordered-power-of-2/discuss/151949/Simple-Java-Solution-Based-on-String-Sorting)
  - Return true if and only if we can do this in a way such that the resulting number is a power of 2.
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
- [LeetCode 1007 - Minimum Domino Rotations For Equal Row](https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/discuss/252242/JavaPython-Find-Intersection-of-Dominos)
  - [first element](https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/discuss/252242/JavaPython-Find-Intersection-of-Dominos)
  - [limited set: check potential answer: Try all possibilities from 1 to 6](https://blog.csdn.net/weixin_41968820/article/details/88379766)
```java
int minDominoRotations(vector<int>& A, vector<int>& B) {
    vector<int> nums;
    int min=0;
    for(int i = 1; i <= 6; i++)
    {
        int changeA=0,changeB=0;
        for(int j = 0; j < A.size(); j++)
        {
            if(A[j] != i && B[j] !=i)
            {break;}
            if(A[j] == i && B[j] !=i)
                changeB++;
            if(A[j] != i && B[j] ==i)
                changeA++;
            if(j == A.size()-1)
            {
                nums.push_back(i);
                min = changeA<changeB?changeA:changeB;
            }
        }
    }
    if(nums.empty()) return -1;
    return min;
}
```
