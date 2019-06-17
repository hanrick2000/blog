#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Scan from right to left
- From end to start instead from start to end
- when element's value/state is related with afterwards elements
  - use stack
  - or maybe traverse from end
- [LeetCode 844 - Backspace String Compare](https://leetcode.com/problems/backspace-string-compare/discuss/162827/Java-Two-Pointer-With-Explanation-beat-98)
```java
public boolean backspaceCompare(String S, String T) {
    for (int i = S.length() - 1, j = T.length() - 1;; i--, j--) {
        for (int b = 0; i >= 0 && (b > 0 || S.charAt(i) == '#'); --i) b += S.charAt(i) == '#' ? 1 : -1;
        for (int b = 0; j >= 0 && (b > 0 || T.charAt(j) == '#'); --j) b += T.charAt(j) == '#' ? 1 : -1;
        if (i < 0 || j < 0 || S.charAt(i) != T.charAt(j)) return i == -1 && j == -1;
    }
}
```

- [LeetCode 174 - Dungeon Game: minimum initial health so that he is able to rescue the princess](https://leetcode.com/problems/dungeon-game/discuss/52790/My-AC-Java-Version-Suggestions-are-welcome)
  - reverse thing: from princess to knight
  - `dp[i][j] = max(1, min(dp[i][j+1] - mat[i][j], dp[i+1][j] - mat[i][j]))`{.java}
- [LeetCode 55 - Jump Game](https://leetcode.com/articles/jump-game/)
  - track maxReach: we don't care what positions a[i] can reach, only the maxReach
  - [LeetCode 769 - Max Chunks To Make Sorted](https://leetcode.com/articles/max-chunks-to-make-sorted-i/)
    - [merge interval](https://www.programcreek.com/2016/01/leetcode-max-chunks-to-make-sorted-java/)
    - [maxSoFar: jump game](https://leetcode.com/articles/max-chunks-to-make-sorted-i/)
- [LeetCode 45 - Jump Game II: find the minimum number of jumps](https://www.jiuzhang.com/solution/jump-game-ii/)
  - [two pointers to maintain a cover range](https://www.jiuzhang.com/solution/jump-game-ii/)


- [LeetCode 482 - License Key Formatting](https://leetcode.com/problems/license-key-formatting/discuss/96512/java-5-lines-clean-solution)
- [HackerRank: Stock Maximize](https://krzychusan.wordpress.com/2014/03/29/hackerrank-stock-maximize/)
- [Leaders in an array](https://www.geeksforgeeks.org/leaders-in-an-array/)
- [LeetCode 439 - Ternary Expression Parser](https://yeqiuquan.blogspot.com/2017/07/439-ternary-expression-parser.html)
```java
public String parseTernary(String expression) {
    if (expression == null || expression.length() == 0) return "";
    Deque<Character> stack = new LinkedList<>();

    for (int i = expression.length() - 1; i >= 0; i--) {
        char c = expression.charAt(i);
        if (!stack.isEmpty() && stack.peek() == '?') {

            stack.pop(); //pop '?'
            char first = stack.pop();
            stack.pop(); //pop ':'
            char second = stack.pop();

            if (c == 'T') stack.push(first);
            else stack.push(second);
        } else {
            stack.push(c);
        }
    }
    return String.valueOf(stack.peek());
}
```
- [LeetCode 880 - Decoded String at Index](https://leetcode.com/articles/decoded-string-at-index/)
```java
public String decodeAtIndex(String S, int K) {
  long size = 0;
  int N = S.length();
  for (int i = 0; i < N; ++i) {
    char c = S.charAt(i);
    if (Character.isDigit(c))
      size *= c - '0';
    else
      size++;
  }
  for (int i = N - 1; i >= 0; --i) {
    char c = S.charAt(i);
    K %= size;
    if (K == 0 && Character.isLetter(c))
      return Character.toString(c);
    if (Character.isDigit(c))
      size /= c - '0';
    else
      size--;
  }
  throw null;
}
```
- [LeetCode 880 - Decoded String at Index](https://leetcode.com/articles/decoded-string-at-index/)
```java
public String decodeAtIndex(String S, int K) {
  long size = 0;
  int N = S.length();
  // Find size = length of decoded string
  for (int i = 0; i < N; ++i) {
    char c = S.charAt(i);
    if (Character.isDigit(c))
      size *= c - '0';
    else
      size++;
  }
  for (int i = N - 1; i >= 0; --i) {
    char c = S.charAt(i);
    K %= size;
    if (K == 0 && Character.isLetter(c))
      return Character.toString(c);
    if (Character.isDigit(c))
      size /= c - '0';
    else
      size--;
  }
  throw null;
}
```

- [LeetCode 853 - Car Fleet](https://leetcode.com/problems/car-fleet/discuss/139999/Easy-understanding-JAVA-TreeMap-Solution-with-explanation-and-comment)
  - from closet to furthest
```java
public int carFleet(int target, int[] position, int[] speed) {
    TreeMap<Integer, Integer> map = new TreeMap<>();
    int n = position.length;
    for(int i=0; i<n; ++i){
        map.put(target - position[i], speed[i]);
    }
    int count = 0;
    double r = -1.0;
    for(Map.Entry<Integer, Integer> entry: map.entrySet()){
        int d = entry.getKey(); // distance
        int s = entry.getValue(); // speed
        double t = 1.0*d/s; // time to target
        if(t>r){ // this car is unable to catch up previous one, form a new group and update the value
            ++count;
            r = t;
        }
    }
    return count;
}
```

#### From (potential) target to source
- [LeetCode 780 - Reaching Points](https://leetcode.com/problems/reaching-points/discuss/230588/Easy-to-understand-diagram-and-recursive-solution)
  - if we start from sx and sy, there is two possibility, but if we start from target, there is only one possibility
  - use modulo to speed minus

```java
bool reachingPoints(int sx, int sy, int tx, int ty) {
    while(tx >= sx && ty >= sy){
        if(tx > ty){
            if(sy == ty) return (tx - sx) % ty == 0;
            tx %= ty;
        }else{
            if(sx == tx) return (ty - sy) % tx == 0;
            ty %= tx;
        }
    }
    return false;
}

public boolean reachingPoints(int sx, int sy, int tx, int ty) {
    if (sx > tx || sy > ty) return false;
    if (sx == tx && (ty - sy) % sx == 0) return true;
    if (sy == ty && (tx - sx) % sy == 0) return true;
    return reachingPoints(sx, sy, tx % ty, ty % tx);
}
```
- [LeetCode 174 - Dungeon Game](https://leetcode.com/problems/dungeon-game/discuss/52785/DFS%2BCache-beat-98.8.-Including-transfer-to-DP-and-space-optimize)
- [LeetCode 55 - Jump Game](https://leetcode.com/articles/jump-game/)
  - track maxReach
  - [from target to source](https://leetcode.com/articles/jump-game/)
```java
public boolean canJump(int[] nums) {
  int lastPos = nums.length - 1;
  for (int i = nums.length - 1; i >= 0; i--) {
    if (i + nums[i] >= lastPos) {
      lastPos = i;
    }
  }
  return lastPos == 0;
}
```
- [LeetCode 477 - Largest Palindrome Product](https://leetcode.com/problems/largest-palindrome-product/discuss/96306/Java-solutions-with-two-different-approaches)
  - from potential target palindrome

- [HARD LeetCode 991 - Broken Calculator: Double or ++](https://leetcode.com/problems/broken-calculator/discuss/234484/JavaC%2B%2BPython-Change-Y-to-X-in-1-Line)
  - guess, assume and prove/anti-example
  - from target to source
```java
public int brokenCalc(int X, int Y) {
  int ans = 0;
  while (Y > X) {
    ans++;
    if (Y % 2 == 1)
      Y++;
    else
      Y /= 2;
  }
  return ans + X - Y;
}
```

- [LeetCode 803 - Bricks Falling When Hit](https://leetcode.com/problems/bricks-falling-when-hit/discuss/193781/UnionFind)
  - [reverse thinking: from end state + union find](https://leetcode.com/problems/bricks-falling-when-hit/discuss/193781/UnionFind)
    - `res[i] = (newSize - count > 0) ? newSize - count - 1 : 0;`{.java}

#### Reverse
- [LeetCode 186 Reverse Words in a String II: in-place](https://www.cnblogs.com/EdwardLiu/p/4306561.html)
- [LeetCode 189 - Rotate an array right by k element](https://leetcode.com/articles/rotate-array/)
- [Sort the sequence using pancake sorting as few reversals as possible](https://www.geeksforgeeks.org/pancake-sorting/)
- [LeetCode 969 - Pancake Sorting](https://leetcode.com/problems/pancake-sorting/discuss/214213/JavaC%2B%2BPython-Straight-Forward)
  - swap max to top
  - swap max to bottom
  - reduce size then repeat

#### Reverse - call same function again
- [Find maximum difference between nearest left and right smaller elements](https://www.geeksforgeeks.org/find-maximum-difference-between-nearest-left-and-right-smaller-elements/)
  - reverse and call same function again

### Guess
- [LeetCode 843 - Guess the Word]
  - [minimum our worst outcome]
    - worse case: only 0 match,
    - we guess the word with minimum words of 0 matches

```java
// random
public void findSecretWord(String[] wordlist, Master master) {
  for (int i = 0, x = 0; i < 10 && x < 6; ++i) {
      String guess = wordlist[new Random().nextInt(wordlist.length)];
      x = master.guess(guess);
      List<String> wordlist2 = new ArrayList<>();
      for (String w : wordlist)
          if (match(guess, w) == x)
              wordlist2.add(w);
      wordlist = wordlist2.toArray(new String[wordlist2.size()]);
  }
}

public void findSecretWord(String[] wordlist, Master master) {
  for (int i = 0, x = 0; i < 10 && x < 6; ++i) {
      HashMap<String, Integer> count = new HashMap<>();
      for (String w1 : wordlist)
          for (String w2 : wordlist)
              if (match(w1, w2) == 0)
                  count.put(w1, count.getOrDefault(w1 , 0) + 1);
      Pair<String, Integer> minimax = new Pair<>("", 1000);
      for (String w : wordlist)
          if (count.getOrDefault(w, 0) < minimax.getValue())
              minimax = new Pair<>(w, count.getOrDefault(w, 0));
      x = master.guess(minimax.getKey());
      List<String> wordlist2 = new ArrayList<String>();
      for (String w : wordlist)
          if (match(minimax.getKey(), w) == x)
              wordlist2.add(w);
      wordlist = wordlist2.toArray(new String[0]);
  }
}
```