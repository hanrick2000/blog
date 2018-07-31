### Re-check
```java
if (x % 2 != 0) return false;
```
## Prune and Optimization
- Sort, but what order
- [LeetCode 473 - Matchsticks to Square](https://leetcode.com/problems/matchsticks-to-square/discuss/95744/cpp-6ms-solution-with-DFS)

### Pre-sort

- [LeetCode 322 - Coin Change]
  - 

### Prune in DFS
- [LeetCode 411 - Minimum Unique Word Abbreviation]
  - remove words with different length
```java
// pruning, no need to continue, already not min length
if(curLen >= minLen) return;
```

## Prune Data
### Only add valid and needed elements into (PQ, TreeMap)
### Prune bad candidates from PQ/TreeMap
- [TreeMap: prune bad candidates](https://ttzztt.gitbooks.io/lc/content/combination/shortest-subarray-with-sum-at-least-k.html)

## Limited result
- [LeetCode 982 - Triples with Bitwise AND Equal To Zero]


