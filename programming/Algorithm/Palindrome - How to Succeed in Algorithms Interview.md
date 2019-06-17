#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Palindrome
- O(N^2) DP or DFS+cache
- DFS + cache: easier to write
- or DP: use len
  - `int[][] palindromeLen, boolean[][] isPalindrome; int j = i + len (- 1);`{.java}
- expand at center expansion
- freqMap
- build palindrome
- Case: odd or ven length
- reverse

#### DP
- [LeetCode 516 - Longest Palindromic Subsequence](https://leetcode.com/problems/longest-palindromic-subsequence/discuss/99101/straight-forward-java-dp-solution)
  - Input "bbbab" => Output len: 4
  - [Evolve from brute force to dp](https://leetcode.com/problems/longest-palindromic-subsequence/discuss/99111/evolve-from-brute-force-to-dp)
  - [dp[i][j] = dp[i+1][j-1] + 2 if s.charAt(i) == s.charAt(j) otherwise, dp[i][j] = Math.max(dp[i+1][j], dp[i][j-1])](https://leetcode.com/problems/longest-palindromic-subsequence/discuss/99101/straight-forward-java-dp-solution)
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
- [Find minimum number of insertion (or deletions) required to make it a palindrome](http://www.zrzahid.com/longest-palindrom-by-deletinginserting-elements/)
```text
minimum inserts:
I[i..j] = I[i+1..j-1], if S[i] = S[j]
I[i..j] = min{I[i..j-1], I[i+1..j]}+1, otherwise.

Base Case :  
I[i,i] = 0, as a single character itself is a palindrome.
L[k][j] = str.charAt(k) == str.charAt(j) ? L[k + 1][j - 1] : Math.min(L[k][j - 1], L[k + 1][j]) + 1;
Minimum deletes
d[i..j] = d[i+1..j-1], if d[i] = d[j] (i.e. no deletions required)
d[i..j] = min{d[i..j-1], d[i-1..j]}+1, otherwise. (i.e. one deletion required)

Base Case :  
d[i,i] = i
d[0,j] = j
```

#### Expand at Center
- [Find all possible palindromic substrings in a string](https://www.techiedelight.com/find-possible-palindromic-substrings-string/)
  - expand at center expansion
- [LeetCode 5 - Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/discuss/2928/very-simple-clean-java-solution)
  - [DP: time O(N^2), space O(N^2)](https://leetcode.com/problems/longest-palindromic-substring/discuss/2921/Share-my-Java-solution-using-dynamic-programming)

```text
  OPT(i,j) = 2 + OPT(i+1, j-1) if A[i] = A[j],
           = max (OPT(i,j-1), OPT(i+1,j), otherwise.
```
  - [Expand at center: time O(N^2), space O(1)](https://leetcode.com/problems/longest-palindromic-substring/discuss/2928/very-simple-clean-java-solution)

```java
private int lo, maxLen;
public String longestPalindrome(String s) {
	int len = s.length();
	if (len < 2)
		return s;
    for (int i = 0; i < len-1; i++) {
     	extendPalindrome(s, i, i);  //assume odd length, try to extend Palindrome as possible
     	extendPalindrome(s, i, i+1); //assume even length.
    }
    return s.substring(lo, lo + maxLen);
}
private void extendPalindrome(String s, int j, int k) {
	while (j >= 0 && k < s.length() && s.charAt(j) == s.charAt(k)) {
		j--;
		k++;
	}
	if (maxLen < k - j - 1) {
		lo = j + 1;
		maxLen = k - j - 1;
	}
}
```
  - [Manacher’s Algorithm]
  - [Suffix trie - TODO](https://www.geeksforgeeks.org/suffix-tree-application-6-longest-palindromic-substring/)
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

#### Build Palindrome
- [LeetCode 680 - Valid Palindrome II](https://leetcode.com/problems/valid-palindrome-ii/discuss/107714/Java-solution-isPalindrome)
  - head, tail pointers and 2 cases

#### freqMap
- [Anagram is A Palindrome](https://www.cnblogs.com/EdwardLiu/p/4323200.html)
```java
public int check(String str) {
 HashMap<Character, Integer> map = new HashMap<Character, Integer>();
 for (int i=0; i<str.length(); i++) {
     char c = str.charAt(i);
     if (map.containsKey(c)) {
         map.put(c, map.get(c)+1);
     }
     else {
         map.put(c, 1);
      }
  }

  int cntOdd = 0;
  for (int val : map.values()) {
      if (val % 2 == 1) {
          cntOdd++;
      }
  }
  return cntOdd>1? 0 : 1;
}
```
- [LeetCode 409 - Longest Palindrome](https://leetcode.com/problems/longest-palindrome/discuss/89604/Simple-HashSet-solution-Java)
  - Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.
- [Lexicographically first palindromic string](https://www.geeksforgeeks.org/lexicographically-first-palindromic-string/)
  - Rearrange the characters of the given string to form a lexicographically first palindromic string.
  - Input : malayalam, Output : aalmymlaa

#### Two Pointers
- [Find minimum number of merge operations (two adjacent elements) to make an array palindrome](http://www.geeksforgeeks.org/find-minimum-number-of-merge-operations-to-make-an-array-palindrome/)
  - O(N) two pointers
- [LeetCode 214 - Shortest Palindrome](https://discuss.leetcode.com/topic/25860/my-9-lines-three-pointers-java-solution-with-explanation)
  - Given a string S, you are allowed to convert it to a palindrome by adding characters in front of it. Find and return the shortest palindrome you can find by performing this transformation.
  - [TODO: KMP](https://discuss.leetcode.com/topic/27261/clean-kmp-solution-with-super-detailed-explanation)
```java
public String shortestPalindrome(String s) {
    int i = 0, end = s.length() - 1, j = end; char chs[] = s.toCharArray();
    while(i < j) {
         if (chs[i] == chs[j]) {
             i++; j--;
         } else {
             i = 0; end--; j = end;
         }
    }
    return new StringBuilder(s.substring(end+1)).reverse().toString() + s;
}
```
- [Google - Chucked Palindrome](https://www.cnblogs.com/EdwardLiu/p/5136947.html)
```java
public int countChunk(String str) {
 if (str==null || str.length()==0) return 0;
 int sum = 0;
 int l=0, r=str.length()-1;
 int preL = l, preR = r;
 while (l < r) {
   String left = str.substring(preL, l+1);
   String right = str.substring(r, preR+1);
   if (left.equals(right)) {
       preL = l+1;
       preR = r-1;
       sum += 2;
   }
   l++;
   r--;
}
 if (preL <= preR) sum+=1;
 return sum;
}
```

#### Reverse
- [Find if string is K-Palindrome or not](https://www.geeksforgeeks.org/find-if-string-is-k-palindrome-or-not/)
  - A k-palindrome string transforms into a palindrome on removing at most k characters from it
  - edit distance of s and reverse of s <= 2k deletions
- [longest palindromic subsequence](http://www.geeksforgeeks.org/find-if-string-is-k-palindrome-or-not-set-2/)
- [longest common string of s and reverse of s](https://www.geeksforgeeks.org/?p=12998)

#### Build Palindrome
- [LeetCode 267 - Palindrome Permutation II](http://likesky3.iteye.com/blog/2238818)
  - Given a string s, return all the palindromic permutations (without duplicates) of it. Return an empty list if no palindromic permutation could be form.
- [Given a number, find the next smallest palindrome larger than this number.](https://www.geeksforgeeks.org/given-a-number-find-next-smallest-palindrome-larger-than-this-number/)
  - if leftsmaller, then num[mid] += 1; and continue to add carry to previous element unitl it's 0

#### Examples
- [Check for Palindrome after every character replacement Query](https://www.cdn.geeksforgeeks.org/check-for-palindrome-after-every-character-replacement-query/)
  - Save state and update state during each query
- [Check if binary representation of a number is palindrome](https://www.geeksforgeeks.org/check-binary-representation-number-palindrome/)
  - if (isKthBitSet(x, l) != isKthBitSet(x, r)) return false