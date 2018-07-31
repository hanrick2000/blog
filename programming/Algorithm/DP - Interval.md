### DP - Interval
- states: start, end pos
- sort by start or end time + greedy
- dp[i][j]=min(dp[i][j],dp[i][k],dp[k+1][j]+sum[i][j]);
- POJ 1141 - Brackets Sequence

- [POJ 3616 - Milking Time](http://www.hankcs.com/program/cpp/poj-3616-milking-time.html)
  - dp[i] = Math.max(dp[i],dp[j]+efficiency[i]) if j.endTime + R >= i.startTime


- [Coke Machine - Google](https://docs.google.com/document/d/1qxA2wps0IhVRWULulQ55W4SGPMu2AE5MkBB37h8Dr58/)
  - O(MNK)
```java
public static boolean coke(List<List<Integer>> buttons, List<Integer> target) {
  int m = target.get(0);
  int n = target.get(1);
  boolean[][] dp = new boolean[m + 1][n + 1];
  for (int i = 0; i <= m; ++i) {
    for (int j = 0; j <= n; ++j) {
      for (List<Integer> button: buttons) {
        if (i <= button.get(0) && j >= button.get(1)) {
          dp[i][j] = true;
          break;
        }
      }
    }
  }
  for (int i = 0; i <= m; ++i) {
    for (int j = 0; j <= n; ++j) {
      for (List<Integer> button: buttons) {
        int preL = i - button.get(0);
        int preR = j - button.get(1);
        if (preL >= 0 && preR >= 0 && dp[preL][preR]) {
          dp[i][j] = true;
         break;
        }
      }
    }
  }
  return dp[m][n];
}
public static boolean dfs(List<Soda> sodas, int volumeLower, int volumeUpper,
            int targetLower, int targetUpper, Map<String, Boolean> memo) {
  Boolean val = memo.get(volumeLower + "-" + volumeUpper);
  if (val != null) {
      return val;
  }
  if (volumeLower >= targetLower && volumeUpper <= targetUpper) {
      return true;
  }
  if (volumeUpper > targetUpper) {
      return false;
  }
   // if (volumeUpper - volumeLower > targetUpper - targetLower) return false;
  for (Soda soda : sodas) {
      if (dfs(sodas, volumeLower + soda.lower, volumeUpper + soda.upper, targetLower, targetUpper, memo)) {//false的子问题会重复计算
          memo.put(volumeLower + "-" + volumeUpper, true);
          return true;
      }
  }
  memo.put(volumeLower + "-" + volumeUpper, false);
  return false;
}
```