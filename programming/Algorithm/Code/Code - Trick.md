
### Extra row and column to avoid check 0
- [Leetcode 304 - Range Sum Query 2D - Immutable](https://leetcode.com/articles/range-sum-query-2d-immutable/)
  - extra row and col to avoid check i==0
```java
private int[][] dp;
public NumMatrix(int[][] matrix) {
    if (matrix.length == 0 || matrix[0].length == 0) return;
    dp = new int[matrix.length + 1][matrix[0].length + 1];
    for (int r = 0; r < matrix.length; r++) {
        for (int c = 0; c < matrix[0].length; c++) {
            dp[r + 1][c + 1] = dp[r + 1][c] + dp[r][c + 1] + matrix[r][c] - dp[r][c];
        }
    }
}
public int sumRegion(int row1, int col1, int row2, int col2) {
    return dp[row2 + 1][col2 + 1] - dp[row1][col2 + 1] - dp[row2 + 1][col1] + dp[row1][col1];
}
```

### Merge cases
- [print directly: using 2 stacks](https://www.geeksforgeeks.org/level-order-traversal-in-spiral-form/)
- [LeetCode 165 - Compare Version Numbers](https://leetcode.com/problems/compare-version-numbers/discuss/50788/My-JAVA-solution-without-split)
```java
public int compareVersion(String version1, String version2) {
    int temp1 = 0,temp2 = 0;
    int len1 = version1.length(),len2 = version2.length();
    int i = 0,j = 0;
    while(i<len1 || j<len2) {
        temp1 = 0;
        temp2 = 0;
        while(i<len1 && version1.charAt(i) != '.') {
            temp1 = temp1*10 + version1.charAt(i++)-'0';
        }
        while(j<len2 && version2.charAt(j) != '.') {
            temp2 = temp2*10 + version2.charAt(j++)-'0';
        }
        if(temp1>temp2) return 1;
        else if(temp1<temp2) return -1;
        else {
            i++;
            j++;
        }
    }
    return 0;
}
```
- [LeetCode 415 - Add Strings](https://leetcode.com/problems/add-strings/discuss/90436/straightforward-java-8-main-lines-25ms)
```java
public String addStrings(String num1, String num2) {
    StringBuilder sb = new StringBuilder();
    int carry = 0;
    for(int i = num1.length() - 1, j = num2.length() - 1; i >= 0 || j >= 0; i--, j--){
        int x = i < 0 ? 0 : num1.charAt(i) - '0';
        int y = j < 0 ? 0 : num2.charAt(j) - '0';
        sb.append((x + y + carry) % 10);
        carry = (x + y + carry) / 10;
    }
    if(carry != 0)
        sb.append(carry);
    return sb.reverse().toString();
}
```

### Change Direction
- check boundary every time
- [LeetCode 498 - Diagonal Traverse](http://www.cnblogs.com/grandyang/p/6414461.html)
  - [(x + y) %2 == 0: move up, otherwise move down](https://leetcode.com/problems/diagonal-traverse/discuss/97711/java-15-lines-without-using-boolean)
  - [dirs = {{-1, 1}, {1, -1}};](https://leetcode.com/problems/diagonal-traverse/discuss/97712/Concise-Java-Solution)
```java
public int[] findDiagonalOrder(int[][] matrix) {
    if (matrix == null || matrix.length == 0) return new int[0];
    int m = matrix.length, n = matrix[0].length;
    int[] result = new int[m * n];
    int row = 0, col = 0, d = 0;
    int[][] dirs = {{-1, 1}, {1, -1}};
    for (int i = 0; i < m * n; i++) {
        result[i] = matrix[row][col];
        row += dirs[d][0];
        col += dirs[d][1];
        if (row >= m) { row = m - 1; col += 2; d = 1 - d;}
        if (col >= n) { col = n - 1; row += 2; d = 1 - d;}
        if (row < 0)  { row = 0; d = 1 - d;}
        if (col < 0)  { col = 0; d = 1 - d;}
    }
    return result;
}
```

