
- [LeetCode 48 - Rotate Image](https://zhuhan0.blogspot.com/2017/04/leetcode-48-rotate-image.html)
```java
public void rotate(int[][] matrix) {
    for (int i = 0; i < matrix.length / 2; i++) {//
        for (int j = i; j < matrix.length - i - 1; j++) {//
            rotate(matrix, i, j);
        }
    }
}
private void rotate(int[][] matrix, int i, int j) {
    int n = matrix.length;
    int temp = matrix[i][j];
    matrix[i][j] = matrix[n - 1 - j][i];
    matrix[n - 1 - j][i] = matrix[n - 1 - i][n - 1 - j];
    matrix[n - 1 - i][n - 1 - j] = matrix[j][n - 1 - i];
    matrix[j][n - 1 - i] = temp;
}
```





