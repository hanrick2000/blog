
- dfs + cache

- [LeetCode 425 - Word Squares: find all word squares you can build from them](https://zhuhan0.blogspot.com/2017/09/leetcode-425-word-squares.html)
  - A sequence of words forms a valid word square if the kth row and column read the exact same string, where 0 ≤ k < max(numRows, numColumns).
  - Trie + brute force: start with every world and try

- [LeetCode 638 - Shopping Offers](https://leetcode.com/articles/shopping-offers/)
```java
public int shopping(List<Integer> price, List<List<Integer>> special, List<Integer> needs,
    Map<List<Integer>, Integer> map) {
  if (map.containsKey(needs))
    return map.get(needs);
  int j = 0, res = dot(needs, price);
  for (List<Integer> s : special) {
    ArrayList<Integer> clone = new ArrayList<>(needs);
    for (j = 0; j < needs.size(); j++) {
      int diff = clone.get(j) - s.get(j);
      if (diff < 0)
        break;
      clone.set(j, diff);
    }
    if (j == needs.size())
      res = Math.min(res, s.get(j) + shopping(price, special, clone, map));
  }
  map.put(needs, res);
  return res;
}
```
- [LeetCode 425 - Word Squares](https://zhuhan0.blogspot.com/2017/09/leetcode-425-word-squares.html)
```java
public List<List<String>> wordSquares(String[] words) {
    TrieNode root = buildTrie(words);
    List<List<String>> squares = new ArrayList<>();
    
    for (String word : words) {
        List<String> square = new ArrayList<>();
        square.add(word);
        wordSquares(root, word.length(), square, squares);
    }
    return squares;
}
private void wordSquares(TrieNode root, int len, List<String> square, List<List<String>> squares) {
    if (square.size() == len) {
        squares.add(new ArrayList<>(square));
        return;
    }

    String prefix = getPrefix(square, square.size());
    TrieNode node = search(root, prefix);
    if (node == null) {
        return;
    }
    
    List<String> children = new ArrayList<>();
    getChildren(node, prefix, children);
    for (String child : children) {
        square.add(child);
        wordSquares(root, len, square, squares);
        square.remove(square.size() - 1);
    }
}
```