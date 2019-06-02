#### Symmetry
- [LeetCode 205 - Isomorphic Strings](https://blog.csdn.net/NoMasp/article/details/50611168)
  - [Symmetry](https://leetcode.com/problems/isomorphic-strings/discuss/57802/Java-solution-using-HashMap)
```java
public boolean isIsomorphic(String s, String t) {
    int[] stmap = new int[256];
    int[] tsmap = new int[256];
    for (int i = 0; i < s.length(); i++) {
        if (stmap[s.charAt(i)] != tsmap[t.charAt(i)]) return false;
        stmap[s.charAt(i)] = i;
        tsmap[t.charAt(i)] = i;
    }
    return true;
}

public boolean isIsomorphic(String s, String t) {
    if(s == null && t == null) return true;
    else if(s == null || t == null) return false;
    if(s.length() != t.length()) return false;
    return helper(s,t) && helper(t,s);
}
private boolean helper(String s, String t){
    Map<Character,Character> map = new HashMap<>();
    for(int i = 0;i<s.length();i++){
        if(!map.containsKey(s.charAt(i))){
            map.put(s.charAt(i),t.charAt(i));
        }else{
            if(map.get(s.charAt(i)) != t.charAt(i) ) return false;
        }
    }
    return true;
}
```
