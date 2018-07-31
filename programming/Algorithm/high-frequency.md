- [LeetCode 10 - Regular Expression Matching](https://leetcode.com/problems/regular-expression-matching/discuss/5651/easy-dp-java-solution-with-detailed-explanation)
- dp[0][0] = true;
```text
dp[s.length() + 1][p.length() + 1], where dp[i[j] means the first i characters in string s matches the first characters of string p. 
1, If p.charAt(j) == s.charAt(i) :  dp[i][j] = dp[i-1][j-1];
2, If p.charAt(j) == '.' : dp[i][j] = dp[i-1][j-1];
3, If p.charAt(j) == '*': 
   here are two sub conditions:
               1   if p.charAt(j-1) != s.charAt(i) : dp[i][j] = dp[i][j-2]  //in this case, a* only counts as empty
               2   if p.charAt(i-1) == s.charAt(i) or p.charAt(i-1) == '.':
                              dp[i][j] = dp[i-1][j]    //in this case, a* counts as multiple a 
                           or dp[i][j] = dp[i][j-1]   // in this case, a* counts as single a
                           or dp[i][j] = dp[i][j-2]   // in this case, a* counts as empty
```
```java
public boolean isMatch(String s, String p) {
 boolean[][] dp = new boolean[s.length()+1][p.length()+1];
 dp[0][0] = true;
 for (int i = 0; i < p.length(); i++) {
     if (p.charAt(i) == '*' && dp[0][i-1]) {
         dp[0][i+1] = true;
     }
 }
 for (int i = 0 ; i < s.length(); i++) {
     for (int j = 0; j < p.length(); j++) {
         if (p.charAt(j) == '.') {
             dp[i+1][j+1] = dp[i][j];
         }
         if (p.charAt(j) == s.charAt(i)) {
             dp[i+1][j+1] = dp[i][j];
         }
         if (p.charAt(j) == '*') {
             if (p.charAt(j-1) != s.charAt(i) && p.charAt(j-1) != '.') {
                 dp[i+1][j+1] = dp[i+1][j-1];
             } else {
                 dp[i+1][j+1] = (dp[i+1][j] || dp[i][j+1] || dp[i+1][j-1]);
             }
         }
     }
 }
 return dp[s.length()][p.length()];
}
```

- [LeetCode 44 - Wildcard Matching](https://leetcode.com/problems/wildcard-matching/discuss/17845/Python-DP-solution)
  - dp = new boolean[p.length() + 1][s.length() + 1];
  - dp[0][0] = true;
```text
dp[s.length() + 1][p.length() + 1], where dp[i[j] means the first i characters in string s matches the first characters of string p. 
-- If p.charAt(j - 1) != '*', then dp[i][j] = dp[i - 1][j - 1] IFF s.charAt(i) == p.charAt(j) || p.charAt(j) == '?'
-- If p.charAt(j - 1) == '*', then 
     -- dp[i][j] = dp[i - 1][j - 1] || // Match 1 character
                   = dp[i][j - 1] || // Match 0 character
                   = dp[i - 1][j] // Match any sequence of characters
```
```java
public boolean isMatch(String s, String p) {
    boolean[][] dp = new boolean[p.length() + 1][s.length() + 1];
    dp[0][0] = true;
    for (int j = 1; j <= p.length(); j++) {
        char pattern = p.charAt(j - 1);
        dp[j][0] = dp[j - 1][0] && pattern == '*';
        for (int i = 1; i <= s.length(); i++) {
            char letter = s.charAt(i - 1);
            if (pattern != '*') {
                dp[j][i] = dp[j - 1][i - 1] && (pattern == '?' || pattern == letter);
            } else
                dp[j][i] = dp[j][i - 1] || dp[j - 1][i];
        }
    }
    return dp[p.length()][s.length()];
}
// rolling array
public boolean isMatch(String s, String p) {
    int m = s.length(), n = p.length();
    boolean[][] match = new boolean[2][n + 1];
    match[0][0] = true;
    for (int i = 0; i <= m; i++) {
        for (int j = 0; j <= n; j++) {
            if (j == 0) { // initialized first column
                match[i % 2][j] = i == 0;
                continue;
            }
            if (p.charAt(j - 1) == '*') {
                match[i % 2][j] = (i > 0 && match[(i - 1) % 2][j]) || match[i % 2][j - 1];
            } else {
                match[i % 2][j] = i > 0 && (s.charAt(i - 1) == p.charAt(j - 1) || p.charAt(j - 1) == '?') && match[(i - 1) % 2][j - 1];
            }
            
        }
    }
    return match[m % 2][n];
}
```

- [LeetCode 224 - Basic Calculator](https://leetcode.com/problems/basic-calculator/discuss/62362/JAVA-Easy-Version-To-Understand!!!!!)
  - The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces
  - sign, result, reset them
```java
public static int calculate(String s) {
	int len = s.length(), sign = 1, result = 0;
	Stack<Integer> stack = new Stack<Integer>();
	for (int i = 0; i < len; i++) {
		if (Character.isDigit(s.charAt(i))) {
			int sum = s.charAt(i) - '0';
			while (i + 1 < len && Character.isDigit(s.charAt(i + 1))) {
				sum = sum * 10 + s.charAt(i + 1) - '0';
				i++;
			}
			result += sum * sign;
		} else if (s.charAt(i) == '+')
			sign = 1;
		else if (s.charAt(i) == '-')
			sign = -1;
		else if (s.charAt(i) == '(') {
			stack.push(result);
			stack.push(sign);
			result = 0;
			sign = 1;
		} else if (s.charAt(i) == ')') {
			result = result * stack.pop() + stack.pop();
		}
	}
	return result;
}
```

- [LeetCode 227 - Basic Calculator II](https://leetcode.com/problems/basic-calculator-ii/discuss/63003/share-my-java-solution)
  - The expression string contains only non-negative integers, +, -, \*, / operators and empty spaces
  - [stack: track prev sign](https://leetcode.com/problems/basic-calculator-ii/discuss/63003/Share-my-java-solution)
  - [O(1) space]
```java
int calculate(String s) {
    long res = 0, curRes = 0, num = 0, n = s.size();
    char op = '+';
    for (int i = 0; i < n; ++i) {
        char c = s[i];
        if (c >= '0' && c <= '9') {
            num = num * 10 + c - '0';
        }
        if (c == '+' || c == '-' || c == '*' || c == '/' || i == n - 1) {
            switch (op) {
                case '+': curRes += num; break;
                case '-': curRes -= num; break;
                case '*': curRes *= num; break;
                case '/': curRes /= num; break;
            }
            if (c == '+' || c == '-' || i == n - 1) {
                res += curRes;
                curRes = 0;
            }
            op = c;
            num = 0;
        } 
    }
    return res;
}
```
- [LeetCode 772 - Basic Calculator III](https://www.cnblogs.com/grandyang/p/8873471.html)
```java
int calculate(String s) {
    int n = s.size(), num = 0, curRes = 0, res = 0;
    char op = '+';
    for (int i = 0; i < n; ++i) {
        char c = s[i];
        if (c >= '0' && c <= '9') {
            num = num * 10 + c - '0';
        } else if (c == '(') {
            int j = i, cnt = 0;
            for (; i < n; ++i) {
                if (s[i] == '(') ++cnt;
                if (s[i] == ')') --cnt;
                if (cnt == 0) break;
            }
            num = calculate(s.substr(j + 1, i - j - 1));
        }
        if (c == '+' || c == '-' || c == '*' || c == '/' || i == n - 1) {
            switch (op) {
                case '+': curRes += num; break;
                case '-': curRes -= num; break;
                case '*': curRes *= num; break;
                case '/': curRes /= num; break;
            }
            if (c == '+' || c == '-' || i == n - 1) {
                res += curRes;
                curRes = 0;
            }
            op = c;
            num = 0;
        }
    }
    return res;
}
```

- [Leetcode 18 - 4 Sum]
  - O(N^3)
  - [Using HashMap O(N^2)]
```java

```

- [Lintcode: K Sum I](https://www.jiuzhang.com/solution/k-sum/)
  - Knapsack
```java
public int  kSum(int A[], int k, int target) {
    int n = A.length;
    int[][][] f = new int[n + 1][k + 1][target + 1];
    for (int i = 0; i < n + 1; i++) {
        f[i][0][0] = 1;
    }
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= k && j <= i; j++) {
            for (int t = 1; t <= target; t++) {
                f[i][j][t] = 0;
                if (t >= A[i - 1]) {
                    f[i][j][t] = f[i - 1][j - 1][t - A[i - 1]];
                }
                f[i][j][t] += f[i - 1][j][t];
            } // for t
        } // for j
    } // for i
    return f[n][k][target];
}
public int  kSum(int A[], int k, int target) {
    if (target < 0) {
        return 0;
    }
    int len = A.length;
    // D[i][j]: k = i, target j, the solution.
    int[][] D = new int[k + 1][target + 1];
    // only one solution for the empty set.
    D[0][0] = 1;
    for (int i = 1; i <= len; i++) {
            for (int j = 1; j <= k; j++) {
                for (int t = target; t > 0; t--) {
                if (t - A[i - 1] >= 0) {
                    D[j][t] += D[j - 1][t - A[i - 1]];
                }
            }
        }
    }
    return D[k][target];
}
void printAnswer(int i, int j, int k) {
    if (j == 0) {
        for (int h = 0; h < K; ++h) {
            System.out.print(res[h]);
            if (h == K - 1) {
                System.out.println("=" + tot);
            }
            else {
                System.out.print("+");
            }
        }
        return;
    }
    if (f[i - 1][j][k] > 0) {
        printAnswer(i - 1, j, k);
    }
    if (j > 0 && k >= A[i - 1] && f[i - 1][j - 1][k - A[i - 1]] > 0) {
        res[j - 1] = A[i - 1];
        printAnswer(i - 1, j - 1, k - A[i - 1]);
    }
}
```
- [LintCode 90 - K Sum II](https://leetcode.com/problems/4sum/discuss/8609/My-solution-generalized-for-kSums-in-JAVA)