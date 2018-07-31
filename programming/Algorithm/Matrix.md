- each of the rows and columns are sorted in ascending order

- [LeetCode 240 - Search a 2D Matrix II](https://leetcode.com/problems/search-a-2d-matrix-ii/discuss/66140/My-concise-O(m%2Bn)-Java-solutionn)


#### row[], col[], etc
- [LeetCode 37 - Sudoku Solver](https://leetcode.com/problems/sudoku-solver/discuss/15752/Straight-Forward-Java-Solution-Using-Backtracking)
```java
private boolean isValid(char[][] board, int row, int col, char c){
    for(int i = 0; i < 9; i++) {
        if(board[i][col] != '.' && board[i][col] == c) return false; //check row
        if(board[row][i] != '.' && board[row][i] == c) return false; //check column
        if(board[3 * (row / 3) + i / 3][ 3 * (col / 3) + i % 3] != '.' && 
board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == c) return false; //check 3*3 block
    }
    return true;
}
```
- [LeetCode 36 - Valid Sudoku](https://leetcode.com/problems/valid-sudoku/discuss/15472/Short+Simple-Java-using-Strings)
  - [3 pass, O(max(m,n) space)](https://www.programcreek.com/2014/05/leetcode-valid-sudoku-java/)
  - [boolean[][] row, column, block](https://leetcode.com/problems/valid-sudoku/discuss/15643/Simple-clear-java-solution)
  - [Normalize: Set seen](https://leetcode.com/problems/valid-sudoku/discuss/15472/Short+Simple-Java-using-Strings)
```java
public boolean isValidSudoku(char[][] board) {
    Set seen = new HashSet();
    for (int i=0; i<9; ++i) {
        for (int j=0; j<9; ++j) {
            char number = board[i][j];
            if (number != '.')
                if (!seen.add(number + " in row " + i) ||
                    !seen.add(number + " in column " + j) ||
                    !seen.add(number + " in block " + i/3 + "-" + j/3))
                    return false;
        }
    }
    return true;
}
public boolean isValidSudoku(char[][] board) {
    // rowChecker[i][j]=true: j appears in row i
    boolean[][] rowChecker = new boolean[9][9];
    // columnChecker[i][j]=true: j appears in column i
    boolean[][] columnChecker = new boolean[9][9];
    // gridChecker[i][j]=true: j appears in grid i
    // numberring from left to right, then top to bottom
    boolean[][] gridChecker = new boolean[9][9];
    // One-pass scan in row-major manner
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            if (board[i][j] == '.')
                continue;
            int val = board[i][j] - '1';
            // Check for the corresponding row, column, and grid at the same time
            if (rowChecker[i][val] || columnChecker[j][val] || gridChecker[i/3*3+j/3][val])
                return false;
            rowChecker[i][val] = columnChecker[j][val] = gridChecker[i/3*3+j/3][val] = true;
        }
    }
    return true;
}

public boolean isValidSudoku(char[][] board) {
	if (board == null || board.length != 9 || board[0].length != 9)
		return false;
	// check each column
	for (int i = 0; i < 9; i++) {
		boolean[] m = new boolean[9];
		for (int j = 0; j < 9; j++) {
			if (board[i][j] != '.') {
				if (m[(int) (board[i][j] - '1')]) {
					return false;
				}
				m[(int) (board[i][j] - '1')] = true;
			}
		}
	}
	//check each row
	for (int j = 0; j < 9; j++) {
		boolean[] m = new boolean[9];
		for (int i = 0; i < 9; i++) {
			if (board[i][j] != '.') {
				if (m[(int) (board[i][j] - '1')]) {
					return false;
				}
				m[(int) (board[i][j] - '1')] = true;
			}
		}
	}
	//check each 3*3 matrix
	for (int block = 0; block < 9; block++) {
		boolean[] m = new boolean[9];
		for (int i = block / 3 * 3; i < block / 3 * 3 + 3; i++) {
			for (int j = block % 3 * 3; j < block % 3 * 3 + 3; j++) {
				if (board[i][j] != '.') {
					if (m[(int) (board[i][j] - '1')]) {
						return false;
					}
					m[(int) (board[i][j] - '1')] = true;
				}
			}
		}
	}
	return true;
}
```

#### Traverse

##### Spiral
- [LeetCode 54 - Spiral Matrix](https://leetcode.com/problems/spiral-matrix/discuss/20599/Super-Simple-and-Easy-to-Understand-Solution)
  - [rowBegin/End, colBegin/End, x, y](https://leetcode.com/problems/spiral-matrix-ii/discuss/22292/Share-my-java-solution)
```java
public List<Integer> spiralOrder(int[][] matrix) {
    List<Integer> res = new ArrayList<Integer>();
    if (matrix.length == 0) {
        return res;
    }
    int rowBegin = 0;
    int rowEnd = matrix.length-1;
    int colBegin = 0;
    int colEnd = matrix[0].length - 1;
    while (rowBegin <= rowEnd && colBegin <= colEnd) {
        // Traverse Right
        for (int j = colBegin; j <= colEnd; j ++) {
            res.add(matrix[rowBegin][j]);
        }
        rowBegin++;
        // Traverse Down
        for (int j = rowBegin; j <= rowEnd; j ++) {
            res.add(matrix[j][colEnd]);
        }
        colEnd--;
        if (rowBegin <= rowEnd) {
            // Traverse Left
            for (int j = colEnd; j >= colBegin; j --) {
                res.add(matrix[rowEnd][j]);
            }
        }
        rowEnd--;
        if (colBegin <= colEnd) {
            // Traver Up
            for (int j = rowEnd; j >= rowBegin; j --) {
                res.add(matrix[j][colBegin]);
            }
        }
        colBegin ++;
    }
    return res;
}
```
- [LeetCode 885 - Spiral Matrix III](https://leetcode.com/problems/spiral-matrix-iii/discuss/163370/Simple-East-to-Understand-Java-solution)

### Direction

### 4/8 Directions in Matrix
- usually only go need half of the directions
### Diagonal
- auxiliary array: rows, columns, diags, adiags
```java
int[] d = new int[m+n];
int[] ad = new int[m+n];
d[i+j]
ad[j-i+m]
```
- [LeetCode 939 - Minimum Area Rectangle](https://yeqiuquan.blogspot.com/2018/11/939-minimum-area-rectangle.html)
  - [O(N^4)](https://buptwc.com/2018/11/11/Leetcode-939-Minimum-Area-Rectangle/)
  - [O(N^2): try all 2 points as the diagonal](https://yeqiuquan.blogspot.com/2018/11/939-minimum-area-rectangle.html)

- [LeetCode 562 - Longest Line of Consecutive One in Matrix](https://segmentfault.com/a/1190000017237619)
  - [auxiliary array: rows, columns, diags, adiags](https://segmentfault.com/a/1190000017237619)
  - [3 dimensions arrays](https://www.jianshu.com/p/6bdf7b29b752?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation)
  - [O(1) space](https://blog.csdn.net/katrina95/article/details/79311355)
```java
public int longestLine(int[][] M) {
    int max = 0, m = M.length, n = M[0].length;
    int[] row = new int[m];
    int[] col = new int[n];
    int[] d = new int[m+n];
    int[] ad = new int[m+n];
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (M[i][j] == 1) {
                row[i]++;
                col[j]++;
                d[i+j]++;
                ad[j-i+m]++;
                max = Math.max(max, Math.max(row[i], col[j]));
                max = Math.max(max, Math.max(d[i+j], ad[j-i+m]));
            } else {
                row[i] = 0;
                col[j] = 0;
                d[i+j] = 0;
                ad[j-i+m] = 0;
            }
        }
    }
    return max;
}

public int longestLine(int[][] M) {
    int n = M.length, max = 0;
    if (n == 0) return max;
    int m = M[0].length;
    int[][][] dp = new int[n][m][4];
    for (int i=0;i<n;i++) 
        for (int j=0;j<m;j++) {
            if (M[i][j] == 0) continue;
            for (int k = 0;k < 4;k++) dp[i][j][k] = 1;
            if (j > 0) dp[i][j][0] += dp[i][j-1][0]; // horizontal line
            if (j > 0 && i > 0) dp[i][j][1] += dp[i-1][j-1][1]; // anti-diagonal line
            if (i > 0) dp[i][j][2] += dp[i-1][j][2]; // vertical line
            if (j < m-1 && i > 0) dp[i][j][3] += dp[i-1][j+1][3]; // diagonal line
            max = Math.max(max, Math.max(dp[i][j][0], dp[i][j][1]));
            max = Math.max(max, Math.max(dp[i][j][2], dp[i][j][3]));
        }
    return max;
}
private int getMaxOneLine(int [][] M, int x, int y){
    int res = 1;
    for(int [] dir:dirs){
        int i = x+dir[0];
        int j = y+dir[1];
        int count = 1;
        while(isValidPosition(M, i, j) && M[i][j] == 1){
            i+=dir[0];
            j+=dir[1];
            count++;
        }
        res = Math.max(count,res);
    }
    return res;
}
```
- [Print Matrix Diagonally](https://yuanhsh.iteye.com/blog/2217185)
  - row--, col++ then row--, col++
```java
public void printDiagonal(int[][] A) {  
    int m = A.length, n = A[0].length;  
    for (int i = 0; i < m+n-1; i++) {  
        int row = Math.min(i, m-1);  
        int col = Math.max(0, i-m+1);  
        while(row>=0 && col<n) {  
            System.out.print(A[row--][col++] + " ");  
        }  
        System.out.println();  
    }  
}  
```

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
- [Print K’th element in spiral form of matrix](https://www.geeksforgeeks.org/print-kth-element-spiral-form-matrix/)

#### Prefix sum

#### Adjacent elements
- [LeetCode 892 - Surface Area of 3D Shapes](https://leetcode.com/problems/surface-area-of-3d-shapes/discuss/163414/C%2B%2BJava1-line-Python-Minus-Hidden-Area)
```java
public int surfaceArea(int[][] grid) {
    int res = 0, n = grid.length;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            if (grid[i][j] > 0) res += grid[i][j] * 4 + 2;
            if (i > 0) res -= Math.min(grid[i][j], grid[i - 1][j]) * 2;
            if (j > 0) res -= Math.min(grid[i][j], grid[i][j - 1]) * 2;
        }
    }
    return res;
}
```

- [LeetCode 723 - Candy Crush](http://www.cnblogs.com/grandyang/p/7858414.html)
```cpp
vector<vector<int>> candyCrush(vector<vector<int>>& board) {
    int m = board.size(), n = board[0].size();
    while (true) {
        vector<pair<int, int>> del;
        for (int i = 0; i < m; ++i) {
            for (int j = 0; j < n; ++j) {
                if (board[i][j] == 0) continue;
                int x0 = i, x1 = i, y0 = j, y1 = j;
                while (x0 >= 0 && x0 > i - 3 && board[x0][j] == board[i][j]) --x0;
                while (x1 < m && x1 < i + 3 && board[x1][j] == board[i][j]) ++x1;
                while (y0 >= 0 && y0 > j - 3 && board[i][y0] == board[i][j]) --y0;
                while (y1 < n && y1 < j + 3 && board[i][y1] == board[i][j]) ++y1;
                if (x1 - x0 > 3 || y1 - y0 > 3) del.push_back({i, j});
            }
        }
        if (del.empty()) break;
        for (auto a : del) board[a.first][a.second] = 0;
        for (int j = 0; j < n; ++j) {
            int t = m - 1;
            for (int i = m - 1; i >= 0; --i) {
                if (board[i][j]) swap(board[t--][j], board[i][j]);   
            }
        }
    }
    return board;
}
```

### Optimize O(M^2N^2)
- [LeetCode 750 - Number Of Corner Rectangles](http://www.cnblogs.com/grandyang/p/8433813.html)
  - O(mn*min(m,n))
```java
public int countCornerRectangles(int[][] grid) {
    int m = grid.length, n = grid[0].length;
    int ans = 0;
    for (int x = 0; x < m; x++) {
        for (int y = x + 1; y < m; y++) {
            int cnt = 0;
            for (int z = 0; z < n; z++) {
                if (grid[x][z] == 1 && grid[y][z] == 1) {
                    cnt++;
                }
            }
            ans += cnt * (cnt - 1) / 2;
        }
    }
    return ans;
}
int countCornerRectangles(vector<vector<int>>& grid) {
    int m = grid.size(), n = grid[0].size(), res = 0;
    for (int i = 0; i < m - 1; i++) { 
        vector<int> ones;
        for (int k = 0; k < n; k++) if (grid[i][k]) ones.push_back(k);
        for (int j = i + 1; j < m; j++) {
            int cnt = 0;
            for (int l = 0; l < ones.size(); l++) {
                if (grid[j][ones[l]]) cnt++;
            }
            res += cnt * (cnt - 1) / 2;
        }           
    }
    return res;
}
```
