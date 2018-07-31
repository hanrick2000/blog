- kmp or Rabin-Karp hash: O(M+N)
- naive, brute force is: O(MN)

#### inverted index
- [LeetCode 392 - Is Subsequence]()
```java
public boolean isSubsequence(String s, String t) {
    int sLen = s.length(), tLen = t.length();
    if(sLen == 0) return true;
    if(sLen > tLen) return false;
    
    Map<Character, TreeSet<Integer>> map = new HashMap<>();
    for(int i = 0; i < tLen; i++) {
        char c = t.charAt(i);
        if(!map.containsKey(c)) map.put(c, new TreeSet<Integer>());
        map.get(c).add(i);
    }
    
    int lowerIndex = -1;
    for(int j = 0; j < sLen; j++) {
        char c = s.charAt(j);
        if(!map.containsKey(c)) return false;
        
        Integer index = map.get(c).higher(lowerIndex);
        if(index == null) return false;
        lowerIndex = index;
    }
    
    return true;
}
```

- [LeetCode 833 - Find And Replace in String]
```java
public String findReplaceString(String S, int[] indexes, String[] sources, String[] targets) {
 int N = S.length();
 int[] match = new int[N];
 Arrays.fill(match, -1);
 for (int i = 0; i < indexes.length; ++i) {
   int ix = indexes[i];
   if (S.substring(ix, ix + sources[i].length()).equals(sources[i]))
     match[ix] = i;
 }
 StringBuilder ans = new StringBuilder();
 int ix = 0;
 while (ix < N) {
   if (match[ix] >= 0) {
     ans.append(targets[match[ix]]);
     ix += sources[match[ix]].length();
   } else {
     ans.append(S.charAt(ix++));
   }
 }
 return ans.toString();
}
```