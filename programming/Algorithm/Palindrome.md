## Palindrome
- boolean isPalindrom[][]
- Expand from center
- build palindrome
- Case: odd or ven length
- reverse

### DP
- [Minimum insertions to form a palindrome](https://www.geeksforgeeks.org/minimum-insertions-to-form-a-palindrome-dp-28/)
  - minInsertions(str[l+1…..h-1]) if str[l] is equal to str[h] otherwise min(minInsertions(str[l…..h-1]), minInsertions(str[l+1…..h])) + 1

- [LeetCode 131 - Palindrome Partitioning: Return all possible palindrome partitioning of s](https://leetcode.com/problems/palindrome-partitioning/discuss/41974/My-Java-DP-only-solution-without-recursion.-O(n2))
  - O(2^N)(Xn)
  - [dfs + for loop from startIndex to end](https://www.jiuzhang.com/solutions/palindrome-partitioning/)
    - helper(String s, int startIndex, List<Integer> partition); partition: the indexes of different partitions
    - [time complexity: H(n) = H(n-1) + H(n-2) + ... + H(1) + O(n^2) = 2 H(n-1) + O(n) = O(n * 2^n)](https://stackoverflow.com/questions/24591616/whats-the-time-complexity-of-this-algorithm-for-palindrome-partitioning)
  - [DP + cache/use previous results](https://leetcode.com/problems/palindrome-partitioning/discuss/41974/My-Java-DP-only-solution-without-recursion.-O(n2))
    - [No need to store all previous layers](https://leetcode.com/problems/palindrome-partitioning/discuss/41974/My-Java-DP-only-solution-without-recursion.-O(n2))
```Java
public static List<List<String>> partition(String s) {
    int len = s.length();
    List<List<String>>[] result = new List[len + 1];
    result[0] = new ArrayList<List<String>>();
    result[0].add(new ArrayList<String>());

    boolean[][] pair = new boolean[len][len];
    for (int i = 0; i < s.length(); i++) {
        result[i + 1] = new ArrayList<List<String>>();
        for (int left = 0; left <= i; left++) {
            if (s.charAt(left) == s.charAt(i) && (i - left <= 1 || pair[left + 1][i - 1])) {
                pair[left][i] = true;
                String str = s.substring(left, i + 1);
                for (List<String> r : result[left]) {
                    List<String> ri = new ArrayList<String>(r);
                    ri.add(str);
                    result[i + 1].add(ri);
                }
            }
        }
    }
    return result[len];
}
public List<List<String>> partition(String s) {
    List<List<String>> res = new ArrayList<>();
    if (s == null || s.isEmpty()) return res;
    List<String> first = new ArrayList<>();
    first.add(s.charAt(0) + "");
    res.add(first);
    for (int i = 1; i < s.length(); i++) {
        String ch = s.charAt(i) + "";
        int count = res.size();
        for (int j = 0; j < count; j++) {
            List<String> l = res.get(j);
            int last = l.size() - 1;
            if (l.get(last).equals(ch)) {
                List<String> l2 = new ArrayList<>(l);
                l2.add(l2.remove(last) + ch);
                res.add(l2);
            }
            if (last > 0 && l.get(last - 1).equals(ch)) {
                List<String> l2 = new ArrayList<>(l);
                l2.add(l2.remove(last - 1) + l2.remove(last - 1) + ch);
                res.add(l2);
            }
            l.add(ch);
        }
    }
    return res;
}
```

- [LeetCode 132 - Palindrome Partitioning II: the minimum cuts needed for a palindrome partitioning of s](https://leetcode.com/problems/palindrome-partitioning-ii/discuss/42213/easiest-java-dp-solution-9736)
  - [Compute isPalindrom[][] and cuts[] at same time](https://leetcode.com/problems/palindrome-partitioning-ii/discuss/42213/easiest-java-dp-solution-9736)
  - [Push DP + Expand from center](https://leetcode.com/problems/palindrome-partitioning-ii/discuss/42198/My-solution-does-not-need-a-table-for-palindrome-is-it-right-It-uses-only-O(n)-space.)
```Java
public int minCut(String s) {
    char[] c = s.toCharArray();
    int n = c.length;
    int[] cut = new int[n];
    boolean[][] pal = new boolean[n][n];
    for(int i = 0; i < n; i++) {
        int min = i;
        for(int j = 0; j <= i; j++) {
            if(c[j] == c[i] && (j + 1 > i - 1 || pal[j + 1][i - 1])) {
                pal[j][i] = true;  
                min = j == 0 ? 0 : Math.min(min, cut[j - 1] + 1);
            }
        }
        cut[i] = min;
    }
    return cut[n - 1];
}

public int minCut(String s) {
    if(s==null || s.length()<2){
        return 0;
    }
    int n = s.length();
    char[] t = s.toCharArray();
    int[] dp = new int[n+1];
    Arrays.fill(dp,Integer.MAX_VALUE);
    dp[0] = -1;
    int i = 0;
    while(i<n){
        expand(t,dp,i,i);
        expand(t,dp,i,i+1);
        i++;
    }
    return dp[n];
}
private void expand(char[] t,int[] dp,int i,int j){
    while(i>=0 && j<t.length && t[i] == t[j]){
        dp[j+1] = Math.min(dp[j+1],dp[i] + 1);
        i--;j++;
    }
}
```

### Build Palindrome

- [LeetCode 680 - Valid Palindrome II](https://leetcode.com/problems/valid-palindrome-ii/discuss/107714/Java-solution-isPalindrome)
  - head, tail pointers and 2 cases
