- [LeetCode 299 - Bulls and Cows](https://leetcode.com/problems/bulls-and-cows/discuss/74621/One-pass-Java-solution)
```java
public String getHint(String secret, String guess) {
    int bulls = 0;
    int cows = 0;
    int[] numbers = new int[10];
    for (int i = 0; i<secret.length(); i++) {
        if (secret.charAt(i) == guess.charAt(i)) bulls++;
        else {
            if (numbers[secret.charAt(i)-'0']++ < 0) cows++;
            if (numbers[guess.charAt(i)-'0']-- > 0) cows++;
        }
    }
    return bulls + "A" + cows + "B";
}
String getHint(String secret, String guess) {
    int a = 0, b = 0, ns = secret.size(), ng = guess.size();
    if(ns!=ng || ns==0) return "0A0B";
    int s[10] = {0};
    int g[10] = {0};
    for(int i=0; i<ns; ++i){
        if(secret[i]==guess[i]){
            a++;
        }else{
            s[secret[i]-'0']++;
            g[guess[i]-'0']++;
        }
    }
    for(int i=0; i<10; ++i){
        b += min(s[i], g[i]);
    }
    return a+"A"+b+"B";
}
```
