
- [LeetCode 846 - Hand of Straights](https://leetcode.com/problems/hand-of-straights/discuss/135598/C%2B%2BJavaPython-O(MlogM)-Complexity)
  - TreeMap
  - Remainder
```java
public boolean isNStraightHand(int[] hand, int W) {
    int length = hand.length;
    if (length % W != 0) {
        return false;
    }
    if (W == 1) {
        return true;
    }
    int[] counts = new int[W];
    for (int num: hand) {
        counts[num % W]++;
    }
    for (int i = 0; i < W - 1; i++) {
        if (counts[i] != counts[i+1]) {
            return false;
        }
    }
    return true;
}
```

