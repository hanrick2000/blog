#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Applications of Union Find(Disjoint Set)
- Connected components/groups, connections
- [Find cycle](https://algorithms.tutorialhorizon.com/graph-find-cycle-in-undirected-graph-using-disjoint-set-union-find/)
- useful when give edges of graph

#### Time complexity
- without anything: O(N)
- with Union by Rank: O(logN)
- with Path Compression: O(α(N)) which is inverse Ackermann function.

#### Info we can get
- find root, union
- count of components, size of each component
  - [when count==1](https://www.cnblogs.com/evasean/p/7204525.html)
- whether two nodes are connected or in same group

#### Implementation Detail
- UnionFind(int size)
- int[] parent; int[] rank;
- Map<String, String> parents or parent[];
- find, union, isConnected, findCount
- highestRank, maxUnion
- find grouped ids

#### Summary
- dummy root node

#### Dummy node/parent
- [LeetCode 130 - Surrounded Regions](https://segmentfault.com/a/1190000007010346)
```text
Given a 2D board containing 'X' and 'O', capture all regions surrounded by 'X'. A region is captured by flipping all 'O's into 'X's in that surrounded region.
For example,
X X X X  
X O O X  
X X O X  
X O X X  
After running your function, the board should be:
X X X X  
X X X X  
X X X X  
X O X X
```
  - we connect all the 'O' nodes on the boundary to a dummy node, and then connect each 'O' node to its neighbour 'O' nodes

```java
int row, col;
public void solve(char[][] board) {
    if (board == null || board.length == 0) return;
    row = board.length;
    col = board[0].length;
    UnionFind uf = new UnionFind(row*col+1);
    int dummy = row*col;
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            if (board[i][j] == 'O') {
                if (i == 0 || i == row-1 || j == 0 || j == col-1) uf.union(node(i, j), dummy);
                else {
                    if (i > 0 && board[i-1][j] == 'O') uf.union(node(i, j), node(i-1, j));
                    if (i > 0 && board[i+1][j] == 'O') uf.union(node(i, j), node(i+1, j));
                    if (j > 0 && board[i][j-1] == 'O') uf.union(node(i, j), node(i, j-1));
                    if (j > 0 && board[i][j+1] == 'O') uf.union(node(i, j), node(i, j+1));
                }
            }
        }
    }
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            if (uf.isConnected(node(i, j), dummy)) board[i][j] = 'O';
            else board[i][j] = 'X';
        }
    }
}
public int node(int i, int j) {
    return i*col+j;
}
```
- [LeetCode 721 - Accounts Merge](https://leetcode.com/problems/accounts-merge/discuss/109157/JavaC++-Union-Find)

#### What to Group/Union
- [LeetCode 947 -  Most Stones Removed with Same Row or Column](https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/discuss/197668/Count-the-Number-of-Islands-O(N))
  - union the row and col vs union the stones in same row, col
- Connect two points of an edge
- connect boundaries (all connected nodes) into a dummy node
- [LeetCode 128 - Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/discuss/41062/My-Java-Solution-using-UnionFound)
  - connect value with v+1, v-1

```java
Map<Integer, Integer> map = new HashMap<>(); // parent
Map<Integer, Integer> c = new HashMap<>(); // count
int res=1;
public int longestConsecutive(int[] a) {
    if(a.length==0) return 0;
    for(int i=0;i<a.length;i++){
        int cur = a[i];
        if(map.containsKey(cur)) continue;
        map.put(cur,cur);
        c.put(cur, 1);
        if(map.containsKey(cur-1)) union(cur-1, cur);
        if(map.containsKey(cur+1)) union(cur+1, cur);
    }
    return res;
}
int find(int x){
    if(map.get(x)==x) return x;
    int par = find(map.get(x));
    map.put(x, par); // path compression
    return par;
}
void union(int x, int y){
    int px = find(x);
    int py = find(y);
    int newCount = c.get(py)+c.get(px);
    if(c.get(px)<c.get(py)){
        map.put(px, py);    
        c.put(py, newCount);
    }else{
        map.put(py, px);    
        c.put(px, newCount);
    }
    res=Math.max(res, newCount);
}
```
- [HARD LeetCode 952 - Largest Component Size by Common Factor](https://leetcode.com/articles/largest-component-size-by-common-factor/)
  - [union find](https://leetcode.com/problems/largest-component-size-by-common-factor/discuss/200959/Simplest-Solution-(Union-Find-only)-No-Prime-Calculation)
  - connect/union value with same factors
  - No need to store all index with same factor, only need one, others are union-ed together

```java
public int largestComponentSize(int[] A) {
    int N = A.length;
    Map<Integer, Integer> map = new HashMap<>();// key is the factor, val is the node index
    UF uf = new UF(N);
    for (int i = 0; i < N; i++){
        int a = A[i];
        for (int j = 2; j * j <= a; j++){
            if (a % j == 0){
                if (!map.containsKey(j)){//this means that no index has claimed the factor yet
                    map.put(j, i);
                }else{//this means that one index already claimed, so union that one with current
                    uf.union(i, map.get(j));
                }
                if (!map.containsKey(a/j)){
                    map.put(a/j, i);
                }else{
                    uf.union(i, map.get(a/j));
                }
            }
        }
        if (!map.containsKey(a)){//a could be factor too. Don't miss this
            map.put(a, i);
        }else{
            uf.union(i, map.get(a));
        }
    }
    return uf.max;
}
```

#### Union-Find - Weight
- Parent node contains extra info
- [HARD LeetCode 399 - Evaluate Division](https://zxi.mytechroad.com/blog/graph/leetcode-399-evaluate-division/)
  - create edge for a to b and b to a
  - [dfs+cache: O(e+q*e)](https://leetcode.com/problems/evaluate-division/discuss/88228/java-ac-solution-with-explanation)
  - [bfs](http://edlinlink.github.io/Leetcode_Evaluate_Division.html)
  - [Floyd–Warshall](https://leetcode.com/problems/evaluate-division/discuss/88207/java-solution-using-floydu2013warshall-algorithm)
  - [best: union-find - store ration in parent node: O(e+q)](https://zxi.mytechroad.com/blog/graph/leetcode-399-evaluate-division/)
```java
class Node {
  public String parent;
  public double ratio;
}
class UnionFindSet {
  private Map<String, Node> parents = new HashMap<>();
  public Node find(String s) {
    if (!parents.containsKey(s)) return null;
    Node n = parents.get(s);
    if (!n.parent.equals(s)) {
      Node p = find(n.parent);
      n.parent = p.parent;
      n.ratio *= p.ratio;
    }
    return n;
  }
  public void union(String s, String p, double ratio) {
    boolean hasS = parents.containsKey(s);
    boolean hasP = parents.containsKey(p);
    if (!hasS && !hasP) {
      parents.put(s, new Node(p, ratio));
      parents.put(p, new Node(p, 1.0));
    } else if (!hasP) {
      parents.put(p, new Node(s, 1.0 / ratio));
    } else if (!hasS) {
      parents.put(s, new Node(p, ratio));
    } else {
      Node rS = find(s);
      Node rP = find(p);
      rS.parent = rP.parent;
      rS.ratio = ratio / rS.ratio * rP.ratio;
    }
  }
}
public double[] calcEquation(String[][] equations, double[] values, String[][] queries) {
  UnionFindSet u = new UnionFindSet();
  for (int i = 0; i < equations.length; ++i)
    u.union(equations[i][0], equations[i][1], values[i]);
  double[] ans = new double[queries.length];
  for (int i = 0; i < queries.length; ++i) {      
    Node rx = u.find(queries[i][0]);
    Node ry = u.find(queries[i][1]);
    if (rx == null || ry == null || !rx.parent.equals(ry.parent))
      ans[i] = -1.0;        
    else
      ans[i] = rx.ratio / ry.ratio;
  }
  return ans;
}
```

#### Info we can get
- group count, max group,
```java
// https://leetcode.com/articles/minimize-malware-spread/
for (int node: initial)
    count[dsu.find(node)]++;
```

#### [Time complexity](https://en.wikipedia.org/wiki/Disjoint-set_data_structure#Time_complexity)
- without anything: O(N)
- with Union by Rank: O(logN)
- with union by rank + Path Compression: O(α(N)) which is inverse Ackermann function.
  - This function has a value {\displaystyle \alpha (n)<5} for any value of n that can be written in this physical universe.

#### Classic Problems
- [Detect Cycle in Undirected Graph](https://algorithms.tutorialhorizon.com/graph-find-cycle-in-undirected-graph-using-disjoint-set-union-find/)
```java
int x_set = find(parent, edge.source);
int y_set = find(parent, edge.destination);
//check if source vertex and destination vertex belongs to the same set
// if in same set then cycle has been detected else combine them into one set
if(x_set==y_set)
    return true;
else
    union(parent, x_set, y_set);
```
- [LeetCode 947 - Most Stones Removed with Same Row or Column](https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/discuss/199168/standard-union-find-solution)
- [LeetCode 924 - Minimize Malware Spread](https://leetcode.com/articles/minimize-malware-spread/)
  - union find or dfs to count the size of component
- [LeetCode 803 - Bricks Falling When Hit](https://leetcode.com/problems/bricks-falling-when-hit/discuss/193781/UnionFind)
  - [reverse thinking: from end state + union find](https://leetcode.com/problems/bricks-falling-when-hit/discuss/193781/UnionFind)
    - res[i] = (newSize - count > 0) ? newSize - count - 1 : 0;
- [LeetCode 465 - Optimal Account Balancing](https://www.cnblogs.com/EdwardLiu/p/6209752.html)
```java
int res = Integer.MAX_VALUE;
public int minTransfers(int[][] transactions) {
   HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
   for (int[] transaction : transactions) {
       map.put(transaction[0], map.getOrDefault(transaction[0], 0)-transaction[2]);
       map.put(transaction[1], map.getOrDefault(transaction[1], 0)+transaction[2]);
   }
   ArrayList<Integer> depts = new ArrayList<Integer>();
    for (int dept : map.values()) {
        if (dept != 0) depts.add(dept);
    }
    helper(depts, 0, 0);
    return res;
}

public void helper(ArrayList<Integer> depts, int start, int count) {
  while (start<depts.size() && depts.get(start)==0) start++;
  if (start == depts.size()) {
      res = Math.min(res, count);
      return;
  }
  for (int i=start+1; i<depts.size(); i++) {
      if (depts.get(start)<0&&depts.get(i)>0 || depts.get(start)>0&&depts.get(i)<0) {
          depts.set(i, depts.get(i)+depts.get(start));
          helper(depts, start+1, count+1);
          depts.set(i, depts.get(i)-depts.get(start));
      }
  }
}
```
- [Successor with delete](https://www.cnblogs.com/evasean/p/7204566.html)
- [Number of Intersected Rectangles - Airbnb](https://github.com/allaboutjst/airbnb/blob/master/src/main/java/number_of_intersected_rectangles/NumberofIntersectedRectangles.java)
  - [union find to get number of groups](https://github.com/allaboutjst/airbnb/blob/master/src/main/java/number_of_intersected_rectangles/NumberofIntersectedRectangles.java)

### Examples
- [LintCode 432 - Find the Weak Connected Component in the Directed Graph](http://www.cnblogs.com/Dylan-Java-NYC/p/6364620.html)
  - [union find](http://www.cnblogs.com/Dylan-Java-NYC/p/6364620.html)
- [LeetCode 305 - Number of Islands II](http://www.cnblogs.com/yrbbest/p/5050749.html)
  - Given a list of positions to operate, count the number of islands after each addLand operation
- [[LintCode 629: Minimum Spanning Tree](https://shmilyaw-hotmail-com.iteye.com/blog/2010747)
  1. Union Find: Find min edge that is not connected to existing edges
- [LeetCode 990 - Satisfiability of Equality Equations](https://leetcode.com/problems/satisfiability-of-equality-equations/discuss/234486/JavaC%2B%2BPython-Easy-Union-Find)
  - [union find](https://leetcode.com/problems/satisfiability-of-equality-equations/discuss/234486/JavaC%2B%2BPython-Easy-Union-Find)
  - [color connected components](https://leetcode.com/articles/satisfiability-of-equality-equations/)
- [Google – Manager Peer Problem]
```text
Design a data structure to support following functions:
1. setManager(A, B) sets A as a direct manager of B
2. setPeer(A, B) sets A as a colleague of B. After that, A and B will have the same direct Manager.
3. query(A, B) returns if A is in the management chain of B.
Every person only has 1 direct manager.
```
  - union-find but don't do path compression
  - Tree + Hash Table
- [LeetCode 547 - Friend Circles](https://leetcode.com/problems/friend-circles/discuss/101336/java-solution-union-find)
- [LeetCode 261 - Graph Valid Tree](https://segmentfault.com/a/1190000003791051)
  - [BFS or DFS](http://buttercola.blogspot.com/2015/08/leetcode-graph-valid-tree.html)
  - [union find](https://segmentfault.com/a/1190000003791051)

#### Union Find Implementation
- rank is only used in union

##### Using Array
```java
class UnionFind {
    int[] parent;
    int[] rank;
    int count;
    public UnionFind(int n) {
        parent = new int[n];
        rank = new int[n];
        count = n;
        for (int i = 0; i < n; ++i) {
            parent[i] = i;
            rank[i] = 0;
        }
    }
    public int find(int x) { // path compression
        // only the rank of the root matters, used in union op.
        if (parent[x] != x)
            parent[x] = find(parent[x]);
        return parent[x];
    }
    public void union(int x, int y) { // union with rank
        int rootx = find(x);
        int rooty = find(y);
        if (rootx != rooty) {
            if (rank[rootx] > rank[rooty]) {
                parent[rooty] = rootx;
            } else {
                parent[rootx] = rooty;
                if (rank[rootx] == rank[rooty])
                    rank[rooty] += 1;
            }
            count--;
        }
    }
    public int getCount() {
        return count;
    }
}
```

##### Using HashMap
```java
class UnionFind{
    //HashMap maintaining key - > value (child -> parent) relationship
    HashMap parent;
    public UnionFind(HashSet hs){
        parent = new HashMap();
        for(int i : hs){
            parent.put(i, i);
        }
    }
    public int root(int i){
        while(i != parent.get(i)){
            parent.put(i, parent.get(parent.get(i)));
            i = parent.get(i);
        }
        return i;
    }
    public void union(int i, int j){
        int p = root(i);
        int q = root(j);
        if(p != q){
            parent.put(p, q);
        }
    }
}
```