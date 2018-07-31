### Identifier
- normalize
- use identifier to reduce size

### Normalize: Convert it to *
- [LeetCode 966 - Vowel Spellchecker](https://leetcode.com/problems/vowel-spellchecker/discuss/211189/JavaC%2B%2BPython-Two-HashMap)

- [LeetCode 694 - Number of Distinct Islands](https://gist.github.com/BiruLyu/807f3960d6ea16f933a7de5bd4058a06)
  - ```set.add((i - baseX) + "_" + (j - baseY));```
  - [use dir](https://segmentfault.com/a/1190000017138588)

- [LeetCode 869 - Reordered Power of 2](https://leetcode.com/problems/reordered-power-of-2/discuss/151949/Simple-Java-Solution-Based-on-String-Sorting)
  - Return true if and only if we can do this in a way such that the resulting number is a power of 2.
  - limited set: power of 2
  - normalized: when order doesn't matter: sort or count array/map

### Normalize: Convert it to id/numbers
- [LeetCode 205 - Isomorphic Strings](https://blog.csdn.net/NoMasp/article/details/50611168)
  - [Symmetry](https://leetcode.com/problems/isomorphic-strings/discuss/57802/Java-solution-using-HashMap)
```java
private ArrayList getArrayOrder(String str) {
  HashMap<Character, Integer> strM = new HashMap<>();
  int index = 0;
  ArrayList order = new ArrayList(str.length());
  for (int i = 0; i < str.length(); i++) {
    char c = str.charAt(i);
    if (strM.containsKey(c)) {
      order.add(strM.get(c));
    } else {
      strM.put(c, index);
      order.add(index);
      index += 1;
    }
  }
  return order;
}
public boolean isIsomorphic(String s, String t) {
  if (s.length() != t.length())
    return false;
  ArrayList s0 = getArrayOrder(s), t0 = getArrayOrder(t);
  for (int i = 0; i < s0.size(); i++)
    if (s0.get(i) != t0.get(i))
      return false;
  return true;
}
```
- [LeetCode 890 - Find and Replace Pattern](https://leetcode.com/problems/find-and-replace-pattern/discuss/161288/C++JavaPython-Normalise-Word)
```java
public List<String> findAndReplacePattern(String[] words, String pattern) {
    int[] p = F(pattern);
    List<String> res = new ArrayList<String>();
    for (String w : words)
        if (Arrays.equals(F(w), p)) res.add(w);
    return res;
}
public int[] F(String w) {
    HashMap<Character, Integer> m = new HashMap<>();
    int n = w.length();
    int[] res = new int[n];
    for (int i = 0; i < n; i++) {
        m.putIfAbsent(w.charAt(i), m.size());
        res[i] = m.get(w.charAt(i));
    }
    return res;
}
```

- [LeetCode 652 - Find Duplicate Subtrees](https://leetcode.com/articles/find-duplicate-subtrees/)
  - [Use unique identifier to reduce time complexity](https://leetcode.com/articles/find-duplicate-subtrees/)
  - [long key = ((long)root.val) << 32 | getId(root.left) << 16 | getId(root.right);](https://zxi.mytechroad.com/blog/tree/leetcode-652-find-duplicate-subtrees/)
```java
int t;
Map<String, Integer> trees;
Map<Integer, Integer> count;
List<TreeNode> ans;
public List<TreeNode> findDuplicateSubtrees(TreeNode root) {
  t = 1;
  trees = new HashMap();
  count = new HashMap();
  ans = new ArrayList();
  lookup(root);
  return ans;
}
public int lookup(TreeNode node) {
  if (node == null)
    return 0;
  String serial = node.val + "," + lookup(node.left) + "," + lookup(node.right);
  int uid = trees.computeIfAbsent(serial, x -> t++);
  count.put(uid, count.getOrDefault(uid, 0) + 1);
  if (count.get(uid) == 2)
    ans.add(node);
  return uid;
}
Map<String, Integer> count;
List<TreeNode> ans;
public List<TreeNode> findDuplicateSubtrees(TreeNode root) {
    count = new HashMap();
    ans = new ArrayList();
    collect(root);
    return ans;
}
public String collect(TreeNode node) {
    if (node == null) return "#";
    String serial = node.val + "," + collect(node.left) + "," + collect(node.right);
    count.put(serial, count.getOrDefault(serial, 0) + 1);
    if (count.get(serial) == 2)
        ans.add(node);
    return serial;
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
```