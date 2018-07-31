
### Data structures
- Trie
- HashMap/Set
  - case insensitive map
  - normalized key map

- [LeetCode 966 - Vowel Spellchecker](https://leetcode.com/problems/vowel-spellchecker/discuss/211189/JavaC%2B%2BPython-Two-HashMap)
  - case insensitive map
  - normalized key map
```java
public String[] spellchecker(String[] wordlist, String[] queries) {
    Set<String> words = new HashSet<>(Arrays.asList(wordlist));
    HashMap<String, String> cap = new HashMap<>();
    HashMap<String, String> vowel = new HashMap<>();
    for (String w : wordlist) {
        String lower = w.toLowerCase(), devowel = lower.replaceAll("[aeiou]", "#");
        cap.putIfAbsent(lower, w);
        vowel.putIfAbsent(devowel, w);
    }
    for (int i = 0; i < queries.length; ++i) {
        if (words.contains(queries[i])) continue;
        String lower = queries[i].toLowerCase(), devowel = lower.replaceAll("[aeiou]", "#");
        if (cap.containsKey(lower)) {
            queries[i] = cap.get(lower);
        } else if (vowel.containsKey(devowel)) {
            queries[i] = vowel.get(devowel);
        } else {
            queries[i] = "";
        }
    }
    return queries;
}
```

