- dp[i] for [0..i] or dp[i][j]
- include/use it or not
- [include current element in different sets](https://www.techiedelight.com/3-partition-problem/)

### meaning of the DP cache
- the answer we are looking for
- 
### dp[i]: the result when ith is included -> local dp
- [Find minimum sum such that one of every three consecutive elements is taken](https://www.geeksforgeeks.org/find-minimum-sum-one-every-three-consecutive-elements-taken/)

### DP + TreeMap/Binary Search
- [LeetCode 975 - Odd Even Jump](https://leetcode.com/problems/odd-even-jump/discuss/217981/JavaC%2B%2BPython-DP-idea-Using-TreeMap-or-Stack)
  - scan backward + use TreeMap to find floor, ceiling
```java
public int oddEvenJumps(int[] A) {
    int n  = A.length, res = 1;
    boolean[] higher = new boolean[n], lower = new boolean[n];
    higher[n - 1] = lower[n - 1] = true;
    TreeMap<Integer, Integer> map = new TreeMap<>();
    map.put(A[n - 1], n - 1);
    for (int i = n - 2; i >= 0; --i) {
        Map.Entry hi = map.ceilingEntry(A[i]), lo = map.floorEntry(A[i]);
        if (hi != null) higher[i] = lower[(int)hi.getValue()];
        if (lo != null) lower[i] = higher[(int)lo.getValue()];
        if (higher[i]) res++;
        map.put(A[i], i);
    }
    return res;
}
```
### Another Process
- [LeetCode 471 - Encode String with Shortest Length](http://www.cnblogs.com/grandyang/p/6194403.html)
  - [dp - divide and try every position]
  - [dp[i][j] = string from index i to index j in encoded form](https://www.jianshu.com/p/31f7207c3c24)
  - dp[i][j] = min(dp[i][j], dp[i][k] + dp[k+1][j]) or if we can find some pattern in string from i to j which will result in more less length.
```cpp
string encode(string s) {
    int n = s.size();
    vector<vector<string>> dp(n, vector<string>(n, ""));
    for (int step = 1; step <= n; ++step) {
        for (int i = 0; i + step - 1 < n; ++i) {
            int j = i + step - 1;
            dp[i][j] = s.substr(i, step);
            string t = s.substr(i, j - i + 1), replace = "";
            auto pos = (t + t).find(t, 1);
            if (pos < t.size()) {
                replace = to_string(t.size() / pos) + "[" + dp[i][i + pos - 1] + "]";
                if (replace.size() < dp[i][j].size()) dp[i][j] = replace;
                continue;
            }
            for (int k = i; k < j; ++k) {
                string left = dp[i][k], right = dp[k + 1][j];
                if (left.size() + right.size() < dp[i][j].size()) {
                    dp[i][j] = left + right;
                }
            }
        }
    }
    return dp[0][n - 1];
}
```
- [Card Game: if there are three consecutive cards a, b and c conforms that a + K = b and b + K = c, we can drop the three cards off](https://shanzi.gitbooks.io/algorithm-notes/content/problem_solutions/card_game.html)
  - DP[i][j]=mini≤k<j{DP[i][k]+DP[k+1][j]}
  - Besides, when cards[i] + K = cards[k] and cards[k] + K = cards[j] as well as DP[i+1][k−1]=DP[k+1][j−1]=0 we have DP[i][j]=0
```Java
private static int solve(int[] array, int N, int K) {
    int[][] DP = new int[N][N];
    for (int i = 0; i < N; i++) {
        for (int j = i; j < N; j++) {
            DP[i][j] = j - i + 1;
        }
    }
    for (int r = 2; r < N; r++) {
        for (int l = r - 2; l >= 0; l--) {
            int min = DP[l][r];
            for (int m = l; m < r; m++) {
                min = Math.min(min, DP[l][m] + DP[m + 1][r]);
            }
            for (int m = l + 1; m < r; m++) {
                if (array[l] + K != array[m] || array[m] + K != array[r]) continue;
                int lmin = DP[l + 1][m - 1];
                int rmin = DP[m + 1][r - 1];
                if (lmin == 0 && rmin == 0) {
                    min = 0;
                } 
            }
            DP[l][r] = min;
        }
    }
    return DP[0][N - 1];
}
```

- [Count Distinct Subsequences](https://www.geeksforgeeks.org/count-distinct-subsequences/)
  - countSub(n) = 2*Count(n-1) - **Repetition**
  - Repetition  =  Count(m): m is index of previous occurrence of current character

### DP - constant size
- DP and calculate for unique character or string, not for each position
- dp[26]
- [LeetCode 467 - Unique Substrings in Wraparound String](https://leetcode.com/problems/unique-substrings-in-wraparound-string/discuss/95439/Concise-Java-solution-using-DP)
  - dp = new int[26];
  - improve/evolve from simple approaches: o(n^3) -> o(n^2) -> o(n)
```java
public int findSubstringInWraproundString(String p) {
    // count[i] is the maximum unique substring end with ith letter.
    // 0 - 'a', 1 - 'b', ..., 25 - 'z'.
    int[] count = new int[26];
    // store longest contiguous substring ends at current position.
    int maxLengthCur = 0; 
    for (int i = 0; i < p.length(); i++) {
        if (i > 0 && (p.charAt(i) - p.charAt(i - 1) == 1 || (p.charAt(i - 1) - p.charAt(i) == 25))) {
            maxLengthCur++;
        }
        else {
            maxLengthCur = 1;
        }
        int index = p.charAt(i) - 'a';
        count[index] = Math.max(count[index], maxLengthCur);
    }
    int sum = 0;
    for (int i = 0; i < 26; i++) {
        sum += count[i];
    }
    return sum;
}
```
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
public int distinctSubseqII(String S) {
    int n = S.length(), M = (int)1e9 + 7, result = 0;
    int[] dp = new int[n];
    Arrays.fill(dp, 1);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (S.charAt(j) != S.charAt(i)) {
                dp[i] += dp[j];
                dp[i] %= M;
            }
        }
        result += dp[i];
        result %= M;
    }
    return result;
}
public int countSub(String str) 
{ 
    int[] last = new int[MAX_CHAR]; 
    Arrays.fill(last, -1); 
    int n = str.length(); 
    int[] dp = new int[n+1]; 
    dp[0] = 1; 
    for (int i=1; i<=n; i++) 
    { 
        dp[i] = 2*dp[i-1]; 
        if (last[(int)str.charAt(i-1)] != -1) 
            dp[i] = dp[i] - dp[last[(int)str.charAt(i-1)]]; 
        last[(int)str.charAt(i-1)] = (i-1); 
    } 
    return dp[n]; 
}
```


### Enumerate every prev indexes
- [LeetCode 139 - Word Break](https://leetcode.com/problems/word-break/discuss/43790/Java-implementation-using-DP-in-two-ways)
  - [dp on trie to avoid substring or stringbuilder to string](https://leetcode.com/problems/word-break/discuss/43790/java-implementation-using-dp-in-two-ways/43002)
  - [O(n^2) or O(n*dictSize)](https://www.cnblogs.com/lightwindy/p/8509053.html)
  - [bfs](https://leetcode.com/problems/word-break/discuss/43797/A-solution-using-BFS)
```java
public boolean wordBreak(String s, Set<String> wordDict) {
    //base case
    if(s == null || s.length() == 0) return false;
    //use dp and scan from right to left to avoid using substring
    boolean[] M = new boolean[s.length() + 1];
    M[s.length()] = true;
    for(int i = s.length() - 1; i >= 0; --i) {
        StringBuilder sb = new StringBuilder();
        for(int j = i; j < s.length(); ++j) {
            sb.append(s.charAt(j));
            if(wordDict.contains(sb.toString()) && M[j + 1]) {
                M[i] = true;
                break;
            }
        }
    }
    return M[0];
}
```
### DP - relation with previous element, and previous's prev(dp[i-1-dp[i-1]])
- [LeetCode 32 - Longest Valid Parentheses SubString](https://leetcode.com/articles/longest-valid-parentheses/)
  - [stack](https://www.jianshu.com/p/392b9058f503)
  - [dp](https://www.jianshu.com/p/72a4cecbf8c7)
  ```Java
  if s[i] is ')':
     If s[i-1] is '(', longest[i] = longest[i-2] + 2
     Else if s[i-1] is ')' and s[i-longest[i-1]-1] == '(', longest[i] = longest[i-1] + 2 + longest[i-longest[i-1]-2]
     
    int longestValidParentheses(string s) {
       if(s.length() <= 1) return 0;
       int curMax = 0;
       vector<int> longest(s.size(),0);
       for(int i=1; i < s.length(); i++){
           if(s[i] == ')'){
               if(s[i-1] == '('){
                   longest[i] = (i-2) >= 0 ? (longest[i-2] + 2) : 2;
                   curMax = max(longest[i],curMax);
               }
               else{ // if s[i-1] == ')', combine the previous length.
                   if(i-longest[i-1]-1 >= 0 && s[i-longest[i-1]-1] == '('){
                       longest[i] = longest[i-1] + 2 + ((i-longest[i-1]-2 >= 0)?longest[i-longest[i-1]-2]:0);
                       curMax = max(longest[i],curMax);
                   }
               }
           }
           //else if s[i] == '(', skip it, because longest[i] must be 0
       }
       return curMax;
    }
  ```

- [LeetCode 790 - Domino and Tromino Tiling](http://zxi.mytechroad.com/blog/dynamic-programming/leetcode-790-domino-and-tromino-tiling/)
  - dp[i][0]: ways to cover i cols, both rows of i-th col are covered
    - dp[i][1]:  ways to cover i cols, only top row of i-th col is covered
    - dp[i][2]:  ways to cover i cols, only bottom row of i-th col is covered
    - [dp[i][1] always equals to dp[i][2]](https://github.com/cherryljr/LeetCode/blob/master/Domino%20and%20Tromino%20Tiling.java)
  - dp[n] = dp[n-1] + dp[n-2] + 2*(dp[n-3] + ... + dp[0]) => 2*dp[n-1] + dp[n-3]
```java
public int numTilings(int N) {
    long[][] dp = new long[N + 1][2];
    dp[0][0] = 1;
    dp[1][0] = 1;
    for (int i = 2; i <= N; i++) {
        dp[i][0] = (dp[i - 2][0] + dp[i - 1][0] + 2 * dp[i - 1][1]) % MOD;
        dp[i][1] = (dp[i - 2][0] + dp[i - 1][1]) % MOD;
    }
    return (int)dp[N][0];
}
```

- [LeetCode 1000 - Minimum Cost to Merge Stones](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-1000-minimum-cost-to-merge-stones/)
  - dp[i][j][k] := min cost to merge subarray i ~ j into k piles
  - dp[i][j][k] = min{dp[i][m][1] + dp[m+1][j][k-1]} for all i <= m < j
  - dp[i][j][1] = dp[i][j][K] + sum(A[i]~A[j])
```java
public int mergeStones(int[] stones, int K) {
  int len = stones.length;
  if ((len - 1) % (K - 1) != 0) {
      return -1;
  }
  // dp[i][j][k] = max
  for (i = 1; i <= len; i++) {
      dp[i][i][1] = 0;
  }
  for (l = 2; l <= len; l++) {
    for (i = 1; i <= len - l + 1; i++) {
        j = i + l - 1;
        for (k = 2; k <= K; k++) {
            for (t = i; t < j; t++) {
                if (dp[i][t][k - 1] == max || dp[t + 1][j][1] == max) {
                    continue;
                }
                dp[i][j][k] = Math.min(dp[i][j][k], dp[i][t][k - 1] + dp[t + 1][j][1]);
            }
        }
        if (dp[i][j][K] == max) {
            continue;
        }
        dp[i][j][1] = dp[i][j][K] + prefixSum[j] - prefixSum[i - 1];   
    }
  }
  return dp[1][len][1];
}
```
- [LeetCode 956 - Tallest Billboard](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-1000-minimum-cost-to-merge-stones/)
  - dp[n][i]: max common height we can get when use first n elements with height difference i
  - dp[i][j] = max(dp[i][j], dp[i – 1][j])
  - dp[i][j+h] = max(dp[i][j + h], dp[i – 1][j])
  - dp[i][|j-h|] = max(dp[i][|j-h|], dp[i – 1][j] + min(j, h))
```java
public int tallestBillboard(int[] rods) {
  Map<Integer, Integer> dp = new HashMap<>(), cur;
  dp.put(0, 0);
  for (int x : rods) {
    cur = new HashMap<>(dp);
    for (int d : cur.keySet()) {
      dp.put(d + x, Math.max(cur.get(d), dp.getOrDefault(x + d, 0)));
      dp.put(Math.abs(d - x), Math.max(cur.get(d) + Math.min(d, x), dp.getOrDefault(Math.abs(d - x), 0)));
    }
  }
  return dp.get(0);
}
```

- [LeetCode 741- Cherry Pickup](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-741-cherry-pickup/)
  - dp(x1, y1, x2) computes the max cherries if start from {(x1, y1), (x2, y2)} to (0, 0)
  - dp(x1, y1, x2)= g[y1][x1] + g[y2][x2] + max{dp(x1-1,y1,x2-1), dp(x1,y1-1,x2-1), dp(x1-1,y1,x2), dp(x1,y1-1,x2)}
  - [T(k, i, p) = grid[i][k-i] + grid[p][k-p] + max{T(k-1, i-1, p-1), T(k-1, i-1, p), T(k-1, i, p-1), T(k-1, i, p)}](https://leetcode.com/problems/cherry-pickup/discuss/109903/step-by-step-guidance-of-the-on3-time-and-on2-space-solution)
```java
public int cherryPickup(int[][] grid) {
  int n = grid.length;
  int[][][] dp = new int[n+1][n+1][n+1];
  for (int i = 0; i <= n; i++) {
    for (int j = 0; j <= n; j++) {
        Arrays.fill(dp[i][j], Integer.MIN_VALUE);
    }
  }
  dp[1][1][1] = grid[0][0];
  for (int x1 = 1; x1 <= n; x1++) {
    for (int y1 = 1; y1 <= n; y1++) {
      for (int x2 = 1; x2 <= n; x2++) {
          int y2 = x1+y1-x2;
          if (dp[x1][y1][x2] > 0 || 
              y2 < 1 || y2 > n || 
              grid[x1-1][y1-1] == -1 || grid[x2-1][y2-1] == -1) continue;
          int preMax = Math.max(
              Math.max(dp[x1-1][y1][x2], dp[x1-1][y1][x2-1]), 
              Math.max(dp[x1][y1-1][x2], dp[x1][y1-1][x2-1]) 
          );
          if (preMax < 0) continue;
          dp[x1][y1][x2] = preMax + grid[x1-1][y1-1];
          if (x1 != x2) dp[x1][y1][x2] += grid[x2-1][y2-1];
      }
    }
  }
  return dp[n][n][n] < 0 ? 0 : dp[n][n][n];
}

public int cherryPickup(int[][] grid) {
    int N = grid.length, M = (N << 1) - 1;
    int[][] dp = new int[N][N];
    dp[0][0] = grid[0][0];    for (int n = 1; n < M; n++) {
		for (int i = N - 1; i >= 0; i--) {
			for (int p = N - 1; p >= 0; p--) {
				int j = n - i, q = n - p;
				if (j < 0 || j >= N || q < 0 || q >= N || grid[i][j] < 0 || grid[p][q] < 0) {
                    dp[i][p] = -1;
                    continue;
                 }
				 if (i > 0) dp[i][p] = Math.max(dp[i][p], dp[i - 1][p]);
				 if (p > 0) dp[i][p] = Math.max(dp[i][p], dp[i][p - 1]);
				 if (i > 0 && p > 0) dp[i][p] = Math.max(dp[i][p], dp[i - 1][p - 1]);
				 if (dp[i][p] >= 0) dp[i][p] += grid[i][j] + (i != p ? grid[p][q] : 0)
             }
		 }
    }
    return Math.max(dp[N - 1][N - 1], 0);
}
```
- [LeetCode 818 - Race Car](https://leetcode.com/problems/race-car/discuss/124326/Summary-of-the-BFS-and-DP-solutions-with-intuitive-explanation)
  - [dp: O(nlogn)]
  - [bfs]
  - Dijkstra
```java
public int racecar(int target) {
    int[] dp = new int[target + 1];
    for (int i = 1; i <= target; i++) {
        dp[i] = Integer.MAX_VALUE;
        int m = 1, j = 1;
        for (; j < i; j = (1 << ++m) - 1) {
            for (int q = 0, p = 0; p < j; p = (1 << ++q) - 1) {
                dp[i] = Math.min(dp[i], m + 1 + q + 1 + dp[i - (j - p)]);
            }
        }
        dp[i] = Math.min(dp[i], m + (i == j ? 0 : 1 + dp[j - i]));
    }
    return dp[target];
}
```

