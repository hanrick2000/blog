### Parentheses
- stack to store not matched (
- count++ or --

### Left/right count
- [LeetCode 22 – Generate Parentheses](https://leetcode.com/problems/generate-parentheses/discuss/10100/Easy-to-understand-Java-backtracking-solution)
  - [dfs](https://leetcode.com/problems/generate-parentheses/discuss/10100/Easy-to-understand-Java-backtracking-solution)
  -
```java
public List<String> generateParenthesis(int n) {
     List<String> res = new ArrayList<>();
     helper(res, new StringBuilder(), 0, 0, n);
     return res;
}
private void helper(List<String> res, StringBuilder sb, int open, int close, int n) {
    if(open == n && close == n) {
        res.add(sb.toString());
        return;
    }
    if(open < n) {
        sb.append("(");
        helper(res, sb, open+1, close, n);
        sb.setLength(sb.length()-1);
    }
    if(close < open) {
        sb.append(")");
        helper(res, sb, open, close+1, n);
        sb.setLength(sb.length()-1);
    }
}
```

### Count layers
- [LeetCode 856 - Score of Parentheses](https://leetcode.com/articles/score-of-parentheses/)
  - [count layers](https://leetcode.com/problems/score-of-parentheses/discuss/141777/C%2B%2BJavaPython-Concise-O(1)-Space)
  - [stack](https://www.acwing.com/solution/LeetCode/content/825/)
  - [Divide and Conquer: O(N^2)](https://leetcode.com/articles/score-of-parentheses/)
```java
public int scoreOfParentheses(String S) {
  Stack<Integer> stack = new Stack<>();
  // stack.push(0); // The score of the current frame
  for (char c : S.toCharArray()) {
    if (c == '(')
      stack.push(0);
    else {
      int top = stack.pop();
      int result = 0;
      if (!stack.isEmpty()) {
        result = stack.pop();
      }
      if (top == 0)
        result += 1;
      else
        result += 2 * top;
      stack.push(result);
    }
  }
  return stack.pop();
}
public int scoreOfParentheses(String S) {
  int res = 0, layers = 0;
  for (int i = 0; i < S.length(); ++i) {
      if (S.charAt(i) == '(') layers++; else layers--;
      if (S.charAt(i) == '(' && S.charAt(i + 1) == ')') res += 1 << (layers - 1);
  }
  return res;
}
```

### Examples
- LeetCode 22 – Generate Parentheses
- [LeetCode 339 - Nested List Weight Sum](https://www.programcreek.com/2014/05/leetcode-nested-list-weight-sum-java/)
  - recursion or bfs
- [LeetCode 20 - Valid Parentheses](https://leetcode.com/problems/valid-parentheses/discuss/9178/Short-java-solution)
  - [stack](https://leetcode.com/problems/valid-parentheses/discuss/9178/Short-java-solution)
- [LeetCode 678 - Valid Parenthesis String](https://leetcode.com/articles/valid-parenthesis-string/)
  - [lower + upper](https://leetcode.com/problems/valid-parenthesis-string/discuss/107611/Very-concise-C%2B%2B-solution-with-explaination.-No-DP)
  - [ 2 stacks for left and star](https://leetcode.com/problems/valid-parenthesis-string/discuss/107572/Java-using-2-stacks.-O(n)-space-and-time-complexity.)
  - [scan from left and right](https://leetcode.com/problems/valid-parenthesis-string/discuss/139759/Java-Very-easy-solution.-No-recursion-or-dp.)
  - [DP - O(N^3)](https://leetcode.com/articles/valid-parenthesis-string/)
  - [dfs+cache](https://zxi.mytechroad.com/blog/dynamic-programming/leetcode-678-valid-parenthesis-string/)
```java
public boolean checkValidString(String s) {
    int bal = 0;
    for (int i = 0; i < s.length(); i++) {
        if (s.charAt(i) == '(' || s.charAt(i) == '*') bal++;
        else if (bal-- == 0) return false;
    }
    if (bal == 0) return true;
    bal = 0;
    for (int i = s.length()-1; i >= 0; i--) {
        if (s.charAt(i) == ')' || s.charAt(i) == '*') bal++;
        else if (bal-- == 0) return false;
    }
    return true;
}

public boolean checkValidString(String s) {
    Stack<Integer> leftID = new Stack<>();
    Stack<Integer> starID = new Stack<>();
    for (int i = 0; i < s.length(); i++) {
        char ch = s.charAt(i);
        if (ch == '(')
            leftID.push(i);
        else if (ch == '*')
            starID.push(i);
        else {
            if (leftID.isEmpty() && starID.isEmpty())   return false;
            if (!leftID.isEmpty())
                leftID.pop();
            else
                starID.pop();
        }
    }
    while (!leftID.isEmpty() && !starID.isEmpty()) {
        if (leftID.pop() > starID.pop())
            return false;
    }
    return leftID.isEmpty();
}
```
- [LeetCode 921 - Minimum Add to Make Parentheses Valid](https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/discuss/181132/C%2B%2BJavaPython-Straight-Forward-One-Pass)
```java
public int minAddToMakeValid(String S) {
    Deque<Character> stk = new ArrayDeque<>();
    int count = 0;
    for (char c : S.toCharArray()) {
        if (c == '(') { stk.push(c); }
        else if (stk.isEmpty()) { ++count; }
        else { stk.pop(); }
    }
    return count + stk.size();
}

public int minAddToMakeValid(String S) {
    int count = 0, stk = 0;
    for (int i = 0; i < S.length(); ++i) {
        if (S.charAt(i) == '(') { ++stk; }
        else if (stk <= 0) { ++count; }
        else { --stk; }
    }
    return count + stk;
}
```

- [LeetCode 301 - Remove Invalid Parentheses](https://github.com/mintycc/OnlineJudge-Solutions/blob/master/Leetcode/301_Remove_Invalid_Parentheses.java)
  - Remove the minimum number of invalid parentheses in order to make the input string valid. Return all possible results.
  - dfs: O(2^n)
  - [bfs: n x 2^(n-1)](https://leetcode.com/problems/remove-invalid-parentheses/discuss/75032/Share-my-Java-BFS-solution)
  - [BFS: avoid generating duplicate strings](https://leetcode.com/problems/remove-invalid-parentheses/discuss/75041/Java-BFS-solution-16ms-avoid-generating-duplicate-strings)
```java
public List<String> removeInvalidParentheses(String s) {
    int l = 0, r = 0;
    for (char ch : s.toCharArray())
        if (ch == '(') l ++;
        else if (ch == ')') {
            if (l > 0) l --;
            else r ++;
        }
    Set<String> ans = new HashSet<String>();
    removeHelper(0, l, r, 0, s, new StringBuilder(), ans);
    List<String> rtn = new ArrayList<String>();
    rtn.addAll(ans);
    return rtn;
}
private void removeHelper(int index, int l, int r, int open, String s, StringBuilder prefix, Set<String> ans) {
    if (l < 0 || r < 0 || open < 0) return;
    if (index == s.length()) {
        if (l + r == 0)
            ans.add(prefix.toString());
        return;
    }
    char ch = s.charAt(index);
    if (ch == '(') {
        removeHelper(index + 1, l - 1, r, open, s, prefix, ans);
        removeHelper(index + 1, l, r, open + 1, s, prefix.append(ch), ans);
    } else if (ch == ')') {
        removeHelper(index + 1, l, r - 1, open, s, prefix, ans);
        removeHelper(index + 1, l, r, open - 1, s, prefix.append(ch), ans);
    } else removeHelper(index + 1, l, r, open, s, prefix.append(ch), ans);
    prefix.setLength(prefix.length() - 1);
}
```

### Basic
```java
boolean isValid(String s) {
  int count = 0;
  for (int i = 0; i < s.length(); i++) {
    char c = s.charAt(i);
    if (c == '(') count++;
    if (c == ')' && count-- == 0) return false;
  }
  return count == 0;
}
```
