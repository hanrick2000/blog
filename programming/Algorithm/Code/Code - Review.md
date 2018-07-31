
- [LeetCode 504 - Base 7](https://leetcode.com/problems/base-7/discuss/98363/verbose-java-solution)
```java
public String convertTo7(int num) {
    if (num == 0) return "0";
    StringBuilder sb = new StringBuilder();
    boolean negative = false;
    if (num < 0) {
        negative = true;
    }
    while (num != 0) {
        sb.append(Math.abs(num % 7));
        num = num / 7;
    }
    if (negative) {
        sb.append("-");
    }
    return sb.reverse().toString();
}
```

- [LeetCode 1017 - Convert to Base -2](https://leetcode.com/problems/convert-to-base-2/discuss/266760/Java-simple-3-lines)
```java
public String baseNeg2(int N) {
    StringBuilder ans = new StringBuilder( N==0 ? "0" : "" );
    for( ; N!=0; N=-(N>>1) ) ans.append( (N&1)==0 ? '0' : '1' );
    return ans.reverse().toString();
}
```