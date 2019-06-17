### Digit
- calculate for each digit
- cases: same digit; less digits

- [LeetCode 400 - Nth Digit](https://leetcode.com/problems/nth-digit/discuss/88363/Java-solution)
  - find the length of the number where the nth digit is from
  - find the actual number where the nth digit is from
```java
public int findNthDigit(int n) {
  int len = 1;
  long count = 9;
  int start = 1;

  while (n > len * count) {
    n -= len * count;
    len += 1;
    count *= 10;
    start *= 10;
  }

  start += (n - 1) / len;
  String s = Integer.toString(start);
  return Character.getNumericValue(s.charAt((n - 1) % len));
}
```
- [LeetCode 1015 - Numbers With Repeated Digits](https://leetcode.com/problems/numbers-with-repeated-digits/discuss/256725/JavaPython-Count-the-Number-Without-Repeated-Digit)
  - Count res the Number Without Repeated Digit, then the number with repeated digits = N - res
```java
public int numDupDigitsAtMostN(int N) {
  ArrayList<Integer> L = new ArrayList<Integer>();
  for (int x = N + 1; x > 0; x /= 10)
      L.add(0, x % 10);
  int res = 0, n = L.size();
  for (int i = 1; i < n; ++i)
      res += 9 * A(9, i - 1);
  HashSet<Integer> seen = new HashSet<>();
  for (int i = 0; i < n; ++i) {
      for (int j = i > 0 ? 0 : 1; j < L.get(i); ++j)
          if (!seen.contains(j))
              res += A(9 - i, n - i - 1);
      if (seen.contains(L.get(i))) break;
      seen.add(L.get(i));
  }
  return N - res;
}
public int A(int m, int n) {
  return n == 0 ? 1 : A(m, n - 1) * (m - n + 1);
}
```


### DP - Digit
- count the number of integers ‘x‘ between two integers say ‘a‘ and ‘b‘ such that x satisfies a specific property
- G(a to b)=G(b)-G(a-1)
- dfs + cache
### states:
- idx
- tight(limit or restricted): 
  - If the current digit’s range is not restricted then it will span from 0 to 9 (inclusively) else it will span from 0 to digit[idx] (inclusively).
- boolean lead

### Implementation Detail
- how to get dp[i] from dp[i/10] dp[i%10]
- calculate for each digit
- less digits than N vs same digits
- from most significant bit

### Common Time Complexity
- O(N), O(Logn)

### Type
- [Given to integers a and b. Print the sum of all the digits appearing in the integers between a and b](https://www.geeksforgeeks.org/digit-dp-introduction/)
- [HDU 2089 -  No 62 or 4](https://111qqz.com/2016/03/hdu-2089/)
  - int dfs (int pos, bool preis6, bool limit); dp[pos][preis6]
- [HDU 4734 - F(x)](https://blog.csdn.net/wust_zzwh/article/details/52100392)
  - int dfs(int pos,int sum,bool limit); dp[pos][sum]
- [POJ 3252 - Round Numbers](https://blog.csdn.net/wust_zzwh/article/details/52100392)
  - int dfs(int pos,int sta,bool lead,bool limit); if(!limit && !lead ) dp[pos][sta]=ans;

### dp[i] from dp[i/10] dp[i%10]
- [HARD LeetCode 788 - Rotated Digits](https://leetcode.com/problems/rotated-digits/discuss/117975/Java-dp-solution-9ms)
  - how many numbers X from 1 to N are good?
  - [brute force](https://leetcode.com/problems/rotated-digits/discuss/116547/Easily-Understood-Java-Solution)
  - [log10(n)](https://leetcode.com/problems/rotated-digits/discuss/116674/O(log10(N))-Easy-to-understand-Java-solution)
```java
public int rotatedDigits(int N) {
    int count = 0;
    for (int i = 1; i <= N; i ++) {
        if (isValid(i)) count ++;
    }
    return count;
}
```
- [LeetCode 902 - Numbers At Most N Given Digit Set]
  - Return the number of integers that can be written (using the digits of D) that are less than or equal to N.
```Java
public int atMostNGivenDigitSet(String[] D, int N) {
  char[] s = String.valueOf(N).toCharArray();
  int n = s.length;
  int ans = 0;
  for (int i = 1; i < n; ++i)
    ans += (int)Math.pow(D.length, i);
  for (int i = 0; i < n; ++i) {
    boolean prefix = false;
    for (String d : D) {
      if (d.charAt(0) < s[i]) {
        ans += Math.pow(D.length, n - i - 1);
      } else if (d.charAt(0) == s[i]) {
        prefix = true;
        break;
      }
    }
    if (!prefix) return ans;
  }
  return ans + 1;
}
// Let dp[i] be the number of ways to write a valid number if N became N[i], N[i+1], .... 
// For example, if N = 2345, then dp[0] would be the number of valid numbers at most 2345, dp[1] would be the ones at most 345, dp[2] would be the ones at most 45, and dp[3] would be the ones at most 5.

public int atMostNGivenDigitSet(String[] D, int N) {
  String S = String.valueOf(N);
  int K = S.length();
  int[] dp = new int[K + 1];
  dp[K] = 1;
  for (int i = K - 1; i >= 0; --i) {
    int Si = S.charAt(i) - '0';
    for (String d : D) {
      if (Integer.valueOf(d) < Si)
        dp[i] += Math.pow(D.length, K - i - 1);
      else if (Integer.valueOf(d) == Si)
        dp[i] += dp[i + 1];
    }
  }
  for (int i = 1; i < K; ++i)
    dp[0] += Math.pow(D.length, i);
  return dp[0];
}
```
### calculate for each digit
- [LeetCode 233 - Number of Digit One](https://leetcode.com/problems/number-of-digit-one/discuss/64383/My-simple-and-understandable-Java-solution)
- [计算数字k在0到n中的出现的次数，k可能是0~9的一个值](https://blog.csdn.net/kkdd2013/article/details/51882774)
```java
public static int digitCounts(int k, int n) {
    int result = 0;
    int base = 1;
    if (k == 0 && n == 0) {
        return 1;
    }
    while (n / base > 0) {
        int cur = (n / base) % 10;
        int low = n - (n/base) * base;
        int hight = n / (base * 10);

        if (cur > k){
            if (hight != 0) {
                result += hight + 1;
            } else {
                result += hight;
            }
        } else if (cur == k){
            result += hight * base + low + 1;
        } else if (cur < k ){
            result += hight * base;
        } else {
            result += (hight + 1) * base;
        }
        base *= 10;
    }
    return result;
}
```

- [LeetCode 357 - Count Numbers with Unique Digits](https://leetcode.com/problems/count-numbers-with-unique-digits/discuss/83041/JAVA-DP-O(1)-solution.)
  - [backtrack](https://leetcode.com/problems/count-numbers-with-unique-digits/discuss/83054/Backtracking-solution)
```java
public int countNumbersWithUniqueDigits(int n) {
      if (n == 0)  return 1;
      int res = 10;
      int uniqueDigits = 9;
      int availableNumber = 9;
      while (n-- > 1 && availableNumber > 0) {
          uniqueDigits = uniqueDigits * availableNumber;
          res += uniqueDigits;
          availableNumber--;
      }
      return res;
  }
```

- [LeetCode 248 - Strobogrammatic Number III:the total strobogrammatic numbers that exist in the range of low <= num <= high.]()
  - A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
  - strobogrammaticInRangeFrom0(high, true) - strobogrammaticInRangeFrom0(low, false);
```java
private static char[][] pairs = new char[][]{{'0', '0'}, {'1', '1'}, {'6', '9'}, {'8', '8'}, {'9', '6'}};  69  6996
public int strobogrammaticInRange(String low, String high) {
    if(low.length()>high.length() || low.length()==high.length() && high.compareTo(low)<0) return 0;
    return strobogrammaticInRangeFrom0(high, true) - strobogrammaticInRangeFrom0(low, false);
}
private int strobogrammaticInRangeFrom0(String num, boolean inclusive){
    int len = num.length();
    if(len == 1){
        if(num.charAt(0) == '0')        return inclusive ? 1 : 0;       // 0?
        else if(num.charAt(0) == '1')   return inclusive ? 2 : 1;       // 0,1?
        else if(num.charAt(0) < '8')    return 2;                       // 0,1
        else if(num.charAt(0) == '8')   return inclusive ? 3 : 2;       // 0,1,8?
        else                            return 3;                       // 0,1,8
    }
    int sum = 0;
    for(int i = 1; i < len; i++)
        sum += strobogrammaticDigit(i, true);
    sum += strobogrammaticInRangeSameDigits(new char[len], 0, len - 1, num.toCharArray(),inclusive);
    return sum;
}
private int strobogrammaticInRangeSameDigits(char[] chs, int i, int j, char[] upper, boolean inclusive){
    int sum = 0;
    if(i > j){
        if( inclusive && compareCharArray(upper, chs, chs.length-1 ) >= 0 || !inclusive && compareCharArray(upper, chs, chs.length-1) > 0 )    return 1;
        else    return 0;
    }
    for(char[] pair: pairs){
        if(i == 0 && pair[0] == '0' || i==j && (pair[0] == '6' || pair[0] == '9') )     continue;
        chs[i] = pair[0];
        chs[j] = pair[1];
        if(compareCharArray(chs, upper, i) > 0)     break;
        sum += strobogrammaticInRangeSameDigits(chs, i+1, j-1, upper, inclusive);
    }
    return sum;
}
private int strobogrammaticDigit(int digit, boolean outside){
    if(digit == 0)      return 1;
    if(digit == 1)      return 3;
    return outside? strobogrammaticDigit(digit-2, false)*4: strobogrammaticDigit(digit-2, false)*5;
}

private static final char[][] pairs = {{'0', '0'}, {'1', '1'}, {'6', '9'}, {'9', '6'}, {'8', '8'}};
private int count = 0;
public int strobogrammaticInRange(String low, String high) {
    for(int len = low.length(); len<=high.length(); len++){
        char[] c = new char[len];
        dfs(low, high, c, 0, len-1);
    }
    return count;
}
public void dfs(String low, String high, char[] c, int left, int right){
    if(left>right){
        String s = new String(c);
        if((s.length() == low.length() && s.compareTo(low)<0)
           || (s.length() == high.length() && s.compareTo(high)>0)) return;
        count++;
        return;
    }
    for(char[] p:pairs){
        c[left] = p[0];
        c[right] = p[1];
        if(c.length != 1 && c[0] == '0') continue;
        if(left == right && p[0]!=p[1]) continue;
        dfs(low, high, c, left+1, right-1);
    }
}
```
