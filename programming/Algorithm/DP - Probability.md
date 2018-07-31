### DP - Probability
- dp[i]: probability of get points i
- dp[i] += dp[i-1]/W
- dp[i] += dp[i - w] * 1 / W
- all cases

- [LeetCode 688 - Knight Probability in Chessboard](https://leetcode.com/problems/knight-probability-in-chessboard/discuss/108214/My-easy-understand-dp-solution)
  - Return the probability that the knight remains on the board after it has stopped moving
  - [bfs: slow and MLE](https://github.com/cherryljr/LeetCode/blob/master/Knight%20Probability%20in%20Chessboard.java)
  - [dfs+cache: more naturally](https://leetcode.com/problems/knight-probability-in-chessboard/discuss/113955/Solution-with-DP-and-Memoization)
  - dp
```java
private int[][] dirs = new int[][]{{1, 2}, {2, 1}, {2, -1}, {1, -2}, {-1, -2}, {-2, -1}, {-2, 1}, {-1, 2}};
public double knightProbability(int N, int K, int r, int c) {
    double[][][] dp = new double[K + 1][N][N];
    dp[0][r][c] = 1;
    for (int step = 1; step <= K; step++) {
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                for (int[] dir : dirs) {
                    int x = dir[0] + i;
                    int y = dir[1] + j;
                    if (x < 0 || x >= N || y < 0 || y >= N) continue;
                    dp[step][i][j] += dp[step - 1][x][y] * 0.125;
                }
            }
        }
    }
    double res = 0;
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            res += dp[K][i][j];
        }
    }
    return res;
}

private int[][]dir = new int[][]{{-2,-1},{-1,-2},{1,-2},{2,-1},{2,1},{1,2},{-1,2},{-2,1}};
private double[][][] dp;
public double knightProbability(int N, int K, int r, int c) {
    dp = new double[N][N][K + 1];
    return find(N,K,r,c);
}
public double find(int N,int K,int r,int c){
    if(r < 0 || r > N - 1 || c < 0 || c > N - 1) return 0;
    if(K == 0)  return 1;
    if(dp[r][c][K] != 0) return dp[r][c][K];
    double rate = 0;
    for(int i = 0;i < dir.length;i++)   rate += 0.125 * find(N,K - 1,r + dir[i][0],c + dir[i][1]);
    dp[r][c][K] = rate;
    return rate;
}
```

- [LeetCode 837 - New 21 Game](https://leetcode.com/problems/new-21-game/discuss/132334/One-Pass-DP-O(N))
  - dp[i]: probability of get points i
  - dp + sliding window
```java
public double new21Game(int N, int K, int W) {
    if (K == 0 || N >= K + W) return 1;
    double dp[] = new double[N + 1],  Wsum = 1, res = 0;
    dp[0] = 1;
    for (int i = 1; i <= N; ++i) {
        dp[i] = Wsum / W;
        if (i < K) Wsum += dp[i]; else res += dp[i];
        if (i - W >= 0) Wsum -= dp[i - W];
    }
    return res;
}
```

### Examples
- [Probability Of Alive On Island](http://n00tc0d3r.blogspot.com/2013/03/probability-of-alive-on-island.html)
  - Prob(x, y, step) = 0.25*Prob(x-1, y, step-1) + 0.25*Prob(x, y-1, step-1)+etc