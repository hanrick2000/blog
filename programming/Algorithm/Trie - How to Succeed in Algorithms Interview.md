#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Applications of Trie
- Trie for words, numbers(each digit), bit
- prefix: findByPrefix
- list of strings, dictionary
- Use trie to prune

#### Advantages
- Less space
- Avoid unnecessary computation with same prefixes

#### Complexity
- time/space complexity: sum of all word length

#### Operations on Trie
- insert + query

#### Augmented Trie
- left/rightCnt, dupCnt, subTreeCnt
- count of prefix nodes: curr.child[c].count++;
- store word at last node
- isEnd

#### Trie
- [LeetCode 720 - Longest Word in Dictionary](https://leetcode.com/problems/longest-word-in-dictionary/discuss/109113/Java-Solution-with-Trie-%2B-BFS)
  - [trie+bfs](https://leetcode.com/problems/longest-word-in-dictionary/discuss/109114/JavaC++-Clean-Code)
- [Find the shortest unique prefix](https://shawnlincoding.wordpress.com/2015/03/25/shortest-unique-prefix-to-represent-word-in-an-array/)
  - [alternative: sort](https://www.geeksforgeeks.org/find-shortest-unique-prefix-every-word-given-list-set-2-using-sorting/)
- [LeetCode 212 - Word Search II: find all words in the board](https://leetcode.com/problems/word-search-ii/discuss/59780/Java-15ms-Easiest-Solution-(100.00))
  ```text
  Given a 2D board and a list of words from the dictionary, find all words in the board.
  Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.
  ```
  - [Trie: O(rows * cols * m * 4^m) - m is the average len of word](https://leetcode.com/problems/word-search-ii/discuss/59780/Java-15ms-Easiest-Solution-(100.00))
    - Reuse input board[][] as visited
  - [Simple DFS: O(n * rows * cols  * 4^2n)](https://blog.csdn.net/xudli/article/details/45864915)
```java
public List findWords(char[][] board, String[] words) {
    List res = new ArrayList<>();
    TrieNode root = buildTrie(words);
    for(int i = 0; i < board.length; i++) {
        for(int j = 0; j < board[0].length; j++) {
            dfs(board, i, j, root, res);
        }
    }
    return res;
}
public void dfs(char[][] board, int i, int j, TrieNode p, List res) {
    char c = board[i][j];
    if(c == '#' || p.next[c - 'a'] == null) return;
    p = p.next[c - 'a'];
    if(p.word != null) {   // found one
        res.add(p.word);
        p.word = null;     // de-duplicate
    }
    board[i][j] = '#';
    if(i > 0) dfs(board, i - 1, j ,p, res);
    if(j > 0) dfs(board, i, j - 1, p, res);
    if(i < board.length - 1) dfs(board, i + 1, j, p, res);
    if(j < board[0].length - 1) dfs(board, i, j + 1, p, res);
    board[i][j] = c;
}
public TrieNode buildTrie(String[] words) {
    TrieNode root = new TrieNode();
    for(String w : words) {
        TrieNode p = root;
        for(char c : w.toCharArray()) {
            int i = c - 'a';
            if(p.next[i] == null) p.next[i] = new TrieNode();
            p = p.next[i];
       }
       p.word = w;
    }
    return root;
}
class TrieNode {
    TrieNode[] next = new TrieNode[26];
    String word;
}
```
- [LeetCode 211 - Add and Search Word](https://leetcode.com/problems/add-and-search-word-data-structure-design/discuss/59554/my-simple-and-clean-java-code)
  - [dfs on Trie](https://leetcode.com/problems/add-and-search-word-data-structure-design/discuss/59554/my-simple-and-clean-java-code)
- [Longest Compound Word](http://techinterviewsolutions.net/2015/06/15/longest-compound-word/)
- [LeetCode 379 - Design Phone Directory]
- [LeetCode 642 - Design Search Autocomplete System](https://github.com/awangdev/LintCode/blob/master/Java/Design%20Search%20Autocomplete%20System.java)
  - TrieNode: Map<String, Integer> freq;
- [LeetCode 820 - Short Encoding of Words](https://leetcode.com/problems/short-encoding-of-words/discuss/125784/Trie-Solution)
- [LeetCode 677 - Map Sum Pairs](https://leetcode.com/articles/map-sum-pairs/)
  - store value in end node and all TrieNode
- [Web Address](http://www.cnblogs.com/EdwardLiu/p/6364661.html)
  - Store string(part) in TrieNode, handle it reversely
- [LeetCode 425 - Word Squares: find all word squares you can build from them](https://zhuhan0.blogspot.com/2017/09/leetcode-425-word-squares.html)
  - A sequence of words forms a valid word square if the kth row and column read the exact same string, where 0 ≤ k < max(numRows, numColumns).
  - Trie + brute force: start with every world and try
- [LeetCode 676 - Implement Magic Dictionary](https://leetcode.com/problems/implement-magic-dictionary/discuss/177342/66ms-Prefix-Tree-(Trie)-Java-with-Explanation)
```java
private boolean dfs(int curId, String word, Node parentPtr, int cntMismatched) {
    if (cntMismatched > 1) {
        return false;
    }
    if (curId == word.length()) {       
        return parentPtr.isWordEnd && cntMismatched == 1;
    }
    for (int i = 0; i < 26; i++) {          
        int order = word.charAt(curId) - 'a';
        if (parentPtr.children[i] == null)
            continue;       
        if (order != i) {
            if (dfs(curId + 1, word, parentPtr.children[i], cntMismatched + 1))
                return true;
        } else {
            if (dfs(curId + 1, word, parentPtr.children[i], cntMismatched))
                return true;
        }
    }     
    return false;
}
```
- [LeetCode 472 - Concatenated Words](https://leetcode.com/problems/concatenated-words/discuss/95644/102ms-java-Trie-%2B-DFS-solution.-With-explanation-easy-to-understand.)
  - Given a list of words, please write a program that returns all concatenated words in the given list of words.
```java
public boolean testWord(char[] chars, int index, TrieNode root, int count) { // count means how many words during the search path
    TrieNode cur = root;
    int n = chars.length;
    for (int i = index; i < n; i++) {
        if (cur.sons[chars[i] - 'a'] == null) {
            return false;
        }
        if (cur.sons[chars[i] - 'a'].isEnd) {
            if (i == n - 1) { // no next word, so test count to get result.
                return count >= 1;
            }
            if (testWord(chars, i + 1, root, count + 1)) {
                return true;
            }
        }
        cur = cur.sons[chars[i] - 'a'];
    }
    return false;
}
```

#### Trie + BFS
- [LeetCode 720 - Longest Word in Dictionary: w -> wo ... -> world](https://leetcode.com/problems/longest-word-in-dictionary/discuss/109113/Java-Solution-with-Trie-%2B-BFS)
  - [pre-sort words alphabetically + dp: nlogn](https://leetcode.com/problems/longest-word-in-dictionary/discuss/109114/JavaC%2B%2B-Clean-Code)
  - [Trie + DFS, prune](https://zxi.mytechroad.com/blog/string/leetcode-720-longest-word-in-dictionary/)
    -  if (word.length() < best.length() || (word.length() == best.length() && word > best)) continue;
  - [Trie + BFS](https://leetcode.com/problems/longest-word-in-dictionary/discuss/109113/Java-Solution-with-Trie-%2B-BFS)
```java
public String findLongestWord() {
    String result = null;
    Queue<TrieNode> queue = new LinkedList<>();
    queue.offer(root);
    while (!queue.isEmpty()) {
        int size = queue.size();
        for (int i = 0; i < size; i++) {
            TrieNode node = queue.poll();
            for (int j = 25; j >= 0; j--) {
                if (node.children[j] != null && node.children[j].isWord) {
                    result = node.children[j].word;
                    queue.offer(node.children[j]);
                }
            }
        }
    }
    return result;
}
```
#### Trie + DP + DFS
- [HARD: LintCode 623 - K EDIT DISTANCE: find all the strings for each the edit distance with the target no greater than k](http://cyjump.com/2017/09/13/K-edit-distance/)


#### Bit Trie
- search each bit: trie.maxXOR(num)
- `Trie[] children = new Trie[2];`{.java}
- [LeetCode 421 - Maximum XOR of Two Numbers in an Array](https://www.geeksforgeeks.org/minimum-xor-value-pair/)
  - [bit trie](https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/discuss/91059/Java-O(n)-solution-using-Trie)
  - [32n + bit prefix](https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/discuss/91049/java-on-solution-using-bit-manipulation-and-hashmap)
    - O(32n) -> bit by bit
  - [divide and conquer - nlogn](http://bookshadow.com/weblog/2016/10/15/leetcode-maximum-xor-of-two-numbers-in-an-array/)
- [Minimum XOR Value Pair](https://www.geeksforgeeks.org/minimum-xor-value-pair/)
  -[bit + trie:O(n) or pre-sort: O(nlogn)](https://www.geeksforgeeks.org/minimum-xor-value-pair/)

#### Prefix Xors + Bit Trie
- [Find the maximum subarray XOR in a given array](https://github.com/cherryljr/NowCoder/blob/master/Find%20the%20Maximum%20Subarray%20XOR%20in%20an%20Array.java)
  - prefix xor, xor[i,j]=prefix-xor[i]^prefix-xor[j] + trie
- [Subarray with XOR less than k](https://www.geeksforgeeks.org/subarray-xor-less-k/)
  - [prefix + bit trie with left/rightCnt](https://github.com/fernandoBRS/SBC-Programming-Contests/blob/master/Algorithms/XOR/subarray_xor.cpp)
- [Codefoces 282E - Sausage Maximization](http://www.cnblogs.com/zhj5chengfeng/archive/2013/05/14/3077621.html)

#### Suffix Trie
- [Multiple Patterns Search - Suffix Tree](https://blog.csdn.net/navyifanr/article/details/24455275)
- [Longest Repeated Substring](https://blog.csdn.net/lin_tuer/article/details/82778962)
- [DISUBSTR - Count of distinct substrings of a string](https://www.geeksforgeeks.org/count-distinct-substrings-string-using-suffix-trie/)
- [Given a string band an array of smaller strings T](https://github.com/careercup/CtCI-6th-Edition/blob/master/Java/Ch%2017.%20Hard/Q17_17_Multi_Search/TrieNode.java), [design a method to search b](https://github.com/careercup/CtCI-6th-Edition/blob/master/Java/Ch%2017.%20Hard/Q17_17_Multi_Search/QuestionB.java) [for each small string in T.](https://github.com/careercup/CtCI-6th-Edition/blob/master/Java/Ch%2017.%20Hard/Q17_17_Multi_Search/QuestionC.java)

#### Generalized Suffix Tree
- Longest Common Substring
- [LeetCode 5 - Longest Palindromic Substring]
  - [DP: time O(N^2), space O(N^2)](https://leetcode.com/problems/longest-palindromic-substring/discuss/2921/Share-my-Java-solution-using-dynamic-programming)
  - [Expand at center: time O(N^2), space O(1)](https://leetcode.com/problems/longest-palindromic-substring/discuss/2928/very-simple-clean-java-solution)
  - [Manacher’s Algorithm]
  - [Suffix trie - TODO](https://www.geeksforgeeks.org/suffix-tree-application-6-longest-palindromic-substring/)

#### Examples
- [Uber Prepare: Web Address](http://www.cnblogs.com/EdwardLiu/p/6364661.html)
- [LeetCode 527 - Word Abbreviation: generate minimal possible abbreviations for every word in the list](https://jogchat.com/shuati/60%E5%A4%A9%E5%B8%A6%E4%BD%A0%E5%88%B7%E5%AE%8CLeetcode%E3%80%90%E7%AC%AC15%E5%A4%A9%E3%80%91530%20~%20521.php)
  - [Split/groups by len or prefix_1_abbreviation](https://jogchat.com/shuati/60天带你刷完Leetcode【第15天】530%20~%20521.php)
  - [dfs](http://www.cnblogs.com/dongling/p/6539600.html)
- [HARD: LeetCode 30 - Substring with Concatenation of All Words](https://leetcode.com/problems/substring-with-concatenation-of-all-words/discuss/13664/Simple-Java-Solution-with-Two-Pointers-and-Map)
```text
You are given a string, S, and a list of words, L, that are all of the same length. Find all starting indices of substring(s) in S that is a concatenation of each word in L exactly once and without any intervening characters.

For example, given:
S: "barfoothefoobarman"
L: ["foo", "bar"]

You should return the indices: [0,9]. (order does not matter).
```
  - [for (int i = 0; i < L[0].length(); i++) ](http://www.cnblogs.com/grandyang/p/4521224.html)
  - [Trie](https://leetcode.com/problems/substring-with-concatenation-of-all-words/discuss/13797/accepted-recursive-solution-using-trie-tree)

#### [Trie implementation](http://blog.csdn.net/ljiabin/article/details/45846527)
```java
class TrieNode {  
    public TrieNode[] children = new TrieNode[26];  
    public String item = "";        
    public TrieNode() {  
    }  
}  
class Trie {  
    private TrieNode root;  
    public Trie() {  
        root = new TrieNode();  
    }  
    // Inserts a word into the trie.  
    public void insert(String word) {  
        TrieNode node = root;  
        for (char c : word.toCharArray()) {  
            if (node.children[c - 'a'] == null) {  
                node.children[c - 'a'] = new TrieNode();  
            }  
            node = node.children[c - 'a'];  
        }  
        node.item = word;  
    }  
    // Returns if the word is in the trie.  
    public boolean search(String word) {  
        TrieNode node = root;  
        for (char c : word.toCharArray()) {  
            if (node.children[c - 'a'] == null) return false;  
            node = node.children[c - 'a'];  
        }  
        return node.item.equals(word);  
    }  
    // Returns if there is any word in the trie  
    // that starts with the given prefix.  
    public boolean startsWith(String prefix) {  
        TrieNode node = root;  
        for (char c : prefix.toCharArray()) {  
            if (node.children[c - 'a'] == null) return false;  
            node = node.children[c - 'a'];  
        }  
        return true;  
    }  
}  
```

#### Resources
- [LeetCode - Trie Hard: LC212, LC336, LC425, LC472](https://yijiajin.github.io/leetcode/2016/12/27/Leetcode-Trie-Hard/)