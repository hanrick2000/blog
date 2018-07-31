
### Track info about result
- [Find maximum length Snake sequence](https://www.blogger.com/blogger.g?blogID=5621339971161142944#editor/target=post;postID=6256322574269557022)

### Track prev index for every elements and max
- [LeetCode 368 - Largest Divisible Subset](https://leetcode.com/problems/largest-divisible-subset/discuss/84006/classic-dp-solution-similar-to-lis-on2)
  - track prev index for every elements and max

#### Examples
- [Chain Matrix Multiplication](https://www.8bitavenue.com/dynamic-programming-matrix-chain-multiplication/)

### DP - Print all solutions
- use dp to save smaller results
- [LeetCode 95 - Unique Binary Search Trees II](https://zxi.mytechroad.com/blog/uncategorized/leetcode-95-unique-binary-search-trees-ii/)
  - [for loop: divide at every index and merge](https://leetcode.com/problems/unique-binary-search-trees-ii/discuss/31508/divide-and-conquer-fi-gi-1-gn-i)
  - [dp to save smaller results + clone right array(modify the node value)](https://leetcode.com/problems/unique-binary-search-trees-ii/discuss/31493/Java-Solution-with-DP)

- [LeetCode 131 - Palindrome Partitioning: Return all possible palindrome partitioning of s]https://leetcode.com/problems/palindrome-partitioning/discuss/41974/My-Java-DP-only-solution-without-recursion.-O(n2))
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

### Examples
- []

