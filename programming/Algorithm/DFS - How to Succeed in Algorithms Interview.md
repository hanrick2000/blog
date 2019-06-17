### DFS vs BFS
- DFS uses space O(h): the height of tree etc, bfs uses space O(n): the layer with max nodes
- dfs: recursion or stack implementation
  - prune, stop early
- in some cases, dfs may be natural and easier to implement, choose dfs

#### Break into Sub-problems
- [LeetCode 439 - Ternary Expression Parser](https://blog.csdn.net/zqh_1991/article/details/52901605)
- the initial items in the queue
  - boundary, boundary cell[LeetCode 130 - Surrounded Regions](https://leetcode.com/problems/surrounded-regions/discuss/41633/Java-DFS-%2B-boundary-cell-turning-solution-simple-and-clean-code-commented.)

### Variables/states
- level
- positions
- visited array or set
- in stack nodes: check cycle
- bit mask target: state=1<<n-1

### Implementation
- Usually nee reset states (backtrack)
- add cache: dimensions related with states

#### Loop in DFS
- index from 0 to len; from 0 to i; from i to len;

### Cache
- [cache.containsKey(encodeString=index + "->" + sum)](https://leetcode.com/problems/target-sum/discuss/97333/Java-simple-DFS-with-memorization)

### Backtrack (or not)
### Types
- for loop inside dfs (from current index to end)
- different cases
  - [LeetCode 320 - Generalized Abbreviation](https://massivealgorithms.blogspot.com/2015/12/leetcode-320-generalized-abbreviation.html)
  - choose to abbr word[pos] or not
- brute force, backtrack, try all solutions, states
  - Pebble Solitaire - UVa 10651
- DFS + cache when there is duplicate
- Flood Fill
- Coloring each component
- [Detect Cycle in a Directed Graph using colors](http://coddicted.com/detect-cycle-in-a-directed-graph/)
- [LeetCode 827 - Making A Large Island](https://leetcode.com/articles/making-a-large-island/)
  - paint all connected 1 with the next available color (2, 3, and so on).

### Trick
- Remove duplicates
  - use set

### Special DFS
- [LeetCode 489 - Robot Room Cleaner](http://www.programmersought.com/article/3123180170/)
```java
public void cleanRoom(Robot robot) {    Set<String> visited = new HashSet<>();
    backtracking(robot, visited, 0, 0, 0);
}
int[][] dir = {{1,0}, {-1,0}, {0,1}, {0, -1}};
private void backtracking(Robot robot, Set<String> visited, int x, int y, int arrow) {
    String path = x + "-" + y;
    if (visited.contains(path)) return;
    visited.add(path);
    robot.clean();
    for (int i = 0; i < 4; i++) {
        if (robot.move()) {
            //go all the way till cannot move, then back one step
            int nx = x + dir[arrow][0];
            int ny = y + dir[arrow][1];
            backtracking(robot, visited, nx, ny, arrow);
            //trace back
            robot.turnLeft();
            robot.turnLeft();
            robot.move();
            robot.turnLeft();
            robot.turnLeft();
        }
        robot.turnLeft();// or turnRight();
        arrow = (arrow + 1) % 4;
    }
}
```

### For loop in DFS


### Classical problems

### Permutations
- [LeetCode 78 - Subsets](https://leetcode.com/problems/subsets/discuss/27281/A-general-approach-to-backtracking-questions-in-Java-(Subsets-Permutations-Combination-Sum-Palindrome-Partitioning))
  - bfs or dfs, or bit mask
```java
private void backtrack(List<List<Integer>> list , List<Integer> tempList, int [] nums, int start){
  list.add(new ArrayList<>(tempList));
  for(int i = start; i < nums.length; i++){
      tempList.add(nums[i]);
      backtrack(list, tempList, nums, i + 1);
      tempList.remove(tempList.size() - 1);
  }
}   
```
- [LeetCode 90 - Subsets II: contains duplicates](https://leetcode.com/problems/subsets-ii/discuss/30137/Simple-iterative-solution)
  - [bfs](https://leetcode.com/problems/subsets-ii/discuss/30137/Simple-iterative-solution)

```java
private void backtrack(List<List<Integer>> list, List<Integer> tempList, int [] nums, int start){
  list.add(new ArrayList<>(tempList));
  for(int i = start; i < nums.length; i++){
      if(i > start && nums[i] == nums[i-1]) continue; // skip duplicates
      tempList.add(nums[i]);
      backtrack(list, tempList, nums, i + 1);
      tempList.remove(tempList.size() - 1);
  }
}
// BFS
public List<List<Integer>> subsetsWithDup(int[] num) {
  Arrays.sort(num);
  List<List<Integer>> ret = new ArrayList<>();
  ret.add(new ArrayList<Integer>());

  int size = 0, startIndex;
  for(int i = 0; i < num.length; i++) {
    startIndex = (i >= 1 && num[i] == num[i - 1]) ? size : 0;
    size = ret.size();
    for(int j = startIndex; j < size; j++) {
      List<Integer> temp = new ArrayList<>(ret.get(j));
      temp.add(num[i]);
      ret.add(temp);
    }
  }
  return ret;
}
```

- [LeetCode 46 - Permutations](https://blog.csdn.net/u010500263/article/details/18178243)
```java
public ArrayList<ArrayList<Integer>> permute(int[] num) {
 ArrayList<ArrayList<Integer>> result = new ArrayList<ArrayList<Integer>>();
 permute(num, 0, result);
 return result;
}
void permute(int[] num, int start, ArrayList<ArrayList<Integer>> result) {
 if (start >= num.length) {
  ArrayList<Integer> item = new ArrayList(num);
  result.add(item);
 }
 for (int j = start; j <= num.length - 1; j++) {
  swap(num, start, j);
  permute(num, start + 1, result);
  swap(num, start, j);
 }
}
public ArrayList<ArrayList<Integer>> permute(int[] num) {
  ArrayList<ArrayList<Integer>> result = new ArrayList<ArrayList<Integer>>();
  ArrayList<Integer> element = new ArrayList<Integer>();
  boolean[] visited = new boolean[num.length];
  helper(num, result, element, visited);
  return result;
}
public void helper(int[] num, ArrayList<ArrayList<Integer>> result, ArrayList<Integer> element, boolean[] visited) {
  if (element.size() == num.length) {
    result.add(new ArrayList<Integer>(element));
    return;
  }
  for (int i = 0; i < num.length; i++) {
    if (!visited[i]) {
      visited[i] = true;
      element.add(num[i]);
      helper(num, result, element, visited);
      element.remove(element.size() - 1);
      visited[i] = false;
    }
  }
}
```
- [LeetCode 47 - Permutations II + with duplicates](https://leetcode.com/problems/permutations-ii/discuss/18594/Really-easy-Java-solution-much-easier-than-the-solutions-with-very-high-vote)
  - Sort the array "int[] nums" to make sure we can skip the same value
    - when a number has the same value with its previous, we can use this number only if his previous is used
  - [use set to dedup](https://leetcode.com/problems/permutations-ii/discuss/18648/Share-my-Java-code-with-detailed-explanantion)

```java
public List<List<Integer>> permuteUnique(int[] nums) {
    List<List<Integer>> res = new ArrayList<List<Integer>>();
    if(nums==null || nums.length==0) return res;
    boolean[] used = new boolean[nums.length];
    List<Integer> list = new ArrayList<Integer>();
    Arrays.sort(nums);
    dfs(nums, used, list, res);
    return res;
}
public void dfs(int[] nums, boolean[] used, List<Integer> list, List<List<Integer>> res){
  if(list.size()==nums.length){
      res.add(new ArrayList<Integer>(list));
      return;
  }
  for(int i=0;i<nums.length;i++){
      if(used[i]) continue;
      if(i>0 &&nums[i-1]==nums[i] && !used[i-1]) continue;
      used[i]=true;
      list.add(nums[i]);
      dfs(nums,used,list,res);
      used[i]=false;
      list.remove(list.size()-1);
  }
}
// BFS
public List<List<Integer>> permuteUnique(int[] nums) {
    LinkedList<List<Integer>> r = new LinkedList<>();
    r.add(new ArrayList<Integer>());
    for(int i=0; i<nums.length; i++){
        int n = r.size();
        for(int j=0; j<n; j++){
            List<Integer> list = r.poll();
            for(int k=0; k<=list.size(); k++){
                if(k > 0 && list.get(k-1) == nums[i])
                    break;
                ArrayList<Integer> t = new ArrayList<>(list);
                t.add(k, nums[i]);//\\
                r.offer(t);
            }
        }
    }
    return r;
}
```




- [Detect Cycle in an undirected graph](https://algorithms.tutorialhorizon.com/graph-detect-cycle-in-undirected-graph-using-dfs/)
```java
boolean isCycleUtil(int currVertex, boolean[] visited, int parent) {
  // add this vertex to visited vertex
  visited[currVertex] = true;

  // visit neighbors except its direct parent
  for (int i = 0; i < adjList[currVertex].size(); i++) {
    int vertex = adjList[currVertex].get(i);
    // check the adjacent vertex from current vertex
    if (vertex != parent) {
      // if destination vertex is not its direct parent then
      if (visited[vertex]) {
        // if here means this destination vertex is already visited
        // means cycle has been detected
        return true;
      } else {
        // recursion from destination node
        if (isCycleUtil(vertex, visited, currVertex)) {
          return true;
        }
      }
    }
  }
  return false;
}
```
- [Detect Cycle in a Directed Graph using colors](http://coddicted.com/detect-cycle-in-a-directed-graph/)
  - public boolean helper(int vertex, boolean[] visited, Set<Integer> recStack)


### subsetSum
- [LeetCode 494 - Target Sum](https://leetcode.com/problems/target-sum/discuss/97334/Java-(15-ms)-C%2B%2B-(3-ms)-O(ns)-iterative-DP-solution-using-subset-sum-with-explanation)

### LeetCode 46 - Permutations
- swap with values with a larger index
```java
private void permute(List<List<Integer>> result, int[] array, int start) {
  if (start >= array.length) {
    List<Integer> current = new ArrayList<Integer>();
    for (int a : array) {
        current.add(a);
    }
    result.add(current);
  } else {
    for (int i=start; i<array.length; i++) {
      swap(array, start, i);
      permute(result, array, start+1);
      swap(array, start, i);
    }
  }
}
```
- <https://leetcode.com/discuss/29483/share-my-short-iterative-java-solution>
```java
private void backtrack(List<List<Integer>> result, int[] nums, List<Integer> currentList, int index) {
    if (currentList.size() == nums.length) {
        result.add(currentList);
        return;
    }
    int n = nums[index];
    for (int i = 0; i <= currentList.size(); i++) {
        List<Integer> copy = new ArrayList<Integer>(currentList);
        copy.add(i, n);
        backtrack(result, nums, copy, index + 1);
    }
}
```
- [LeetCode 78 - Subsets](https://leetcode.com/problems/subsets/discuss/27278/C%2B%2B-RecursiveIterativeBit-Manipulation)
  - Time complexity: O(N*2^N)
  - [Bit mask](https://leetcode.com/problems/subsets/discuss/27543/Simple-Java-Solution-Using-Bit-Operations)
  - [BFS](https://leetcode.com/problems/subsets/discuss/27294/simple-iteration-no-recursion-no-twiddling-explanation)
  - [DFS](https://leetcode.com/problems/subsets/discuss/27281/a-general-approach-to-backtracking-questions-in-java-subsets-permutations-combination-sum-palindrome-partitioning)
<img src='https://1.bp.blogspot.com/-T5YjOQ8Lf7o/XEjZLgZLygI/AAAAAAAAUJo/Wbw1hxNZm8cEfoy7FxDncOCMiWHShr2UACLcBGAs/s1600/13612449-0aa5ad2614b65ba6.png' />
- [Leetcode 90 - Subsets II](http://www.jiuzhang.com/solutions/subsets-ii/)
- [LeetCode 95 - Unique Binary Search Trees II](https://zxi.mytechroad.com/blog/uncategorized/leetcode-95-unique-binary-search-trees-ii/)
  - [for loop: divide at every index and merge](https://leetcode.com/problems/unique-binary-search-trees-ii/discuss/31508/divide-and-conquer-fi-gi-1-gn-i)
  - [dp to save smaller results + clone right array(modify the node value)](https://leetcode.com/problems/unique-binary-search-trees-ii/discuss/31493/Java-Solution-with-DP)


### Include current element in different sets
- [3-partition problem](https://www.techiedelight.com/3-partition-problem/)
  - include the current item in the first/second/third subset
  - dfs + cache
- [LeetCode 473 - Matchsticks to Square](https://leetcode.com/problems/matchsticks-to-square/discuss/95729/java-dfs-solution-with-explanation)
  - [put current into different group](https://leetcode.com/problems/matchsticks-to-square/discuss/95729/java-dfs-solution-with-explanation)
- [HARD LeetCode 698 - Partition to K Equal Sum Subsets](https://leetcode.com/articles/partition-to-k-equal-sum-subsets/)
  - [dfs: try put current element into every group](https://leetcode.com/problems/partition-to-k-equal-sum-subsets/discuss/108751/Easy-to-understand-java-solution)
  - [dfs: find one subset till size k](https://leetcode.com/problems/partition-to-k-equal-sum-subsets/discuss/180014/Thinking-Process-of-Recursion-in-Java)
```java
public boolean canPartitionKSubsets(int[] nums, int k) {
  int sum = 0;
  for (int n : nums) {
    sum += n;
  }
  if (sum % k != 0) {
    return false;
  }
  int target = sum / k;
  Arrays.sort(nums);
  if (nums[nums.length - 1] > target) {
    return false;
  }
  int row = nums.length - 1;
  while (row >= 0 && nums[row] == target) {
    --row;
    --k;
  }
  return search(new int[k], row, nums, target);
}
public boolean search(int[] groups, int row, int[] nums, int target) {
  if (row < 0) {
    return true;
  }
  int v = nums[row--];
  for (int i = 0; i < groups.length; ++i) {
    if (groups[i] + v <= target) {
      groups[i] += v;
      if (search(groups, row, nums, target)) {
        return true;
      }
      groups[i] -= v;
    }
    if (groups[i] == 0) {
      // fill groups[i] ahead of groups[i + 1]
      break;
    }
  }
  return false;
}
```

### Multiple DFS
- [LeetCode 756 - Pyramid Transition Matrix](https://leetcode.com/problems/pyramid-transition-matrix/discuss/113054/Java-solution-map-%2B-backtracking)
  - [multiple dfs](https://github.com/dqi2018/airbnb/blob/master/src/main/java/string_pyramids_transition_matrix/StringPyramidsTransitionMatrix.java)

```java
public boolean pyramidTransition(String bottom, List<String> allowed) {
    Map<String, List<String>> map = new HashMap<>();
    for (String s : allowed) {
        String key = s.substring(0,2);
        if (!map.containsKey(key)) map.put(key, new ArrayList<String>());
        map.get(key).add(s.substring(2));
    }
    return helper(bottom, map);
}
private boolean helper(String bottom, Map<String, List<String>> map) {
    if(bottom.length() == 1) return true;
    for (int i = 0; i<bottom.length()-1; i++) {
        if (!map.containsKey(bottom.substring(i,i+2))) return false;
    }
    List<String> ls = new ArrayList<>();
    getList(bottom, 0, new StringBuilder(), ls, map);
    for (String s : ls) {
        if (helper(s, map)) return true;
    }
    return false;
}
private void getList(String bottom, int idx, StringBuilder sb, List<String> ls, Map<String, List<String>> map) {
    if (idx == bottom.length() - 1) {
        ls.add(sb.toString());
        return;
    }
    for (String s : map.get(bottom.substring(idx, idx+2))) {
        sb.append(s);
        getList(bottom, idx + 1, sb, ls, map);
        sb.deleteCharAt(sb.length()-1);
    }
}

public boolean pyramidTransition(String bottom, List<String> allowed) {
    Map<String,List<String>> map = new HashMap<>();
    for (String str : allowed){
        String key = str.substring(0,2);
        if (! map.containsKey(key)){
            map.put(key,new ArrayList<>());
        }
        map.get(key).add(str.substring(2));
    }
    return dfs(map,bottom,new StringBuilder(),0);
}
public boolean dfs(Map<String,List<String>> map,String bottom,StringBuilder nextBottom,int p){
    if (p == bottom.length() - 1){
        bottom = nextBottom.toString();
        nextBottom = new StringBuilder();
        p = 0;
    }
    if (bottom.length() == 1) return true;
    String key = bottom.substring(p,p + 2);
    if (map.containsKey(key)){
        for (String val : map.get(key)){
            nextBottom.append(val);
            if (dfs(map,bottom,nextBottom,p + 1)) return true;
            nextBottom.setLength(nextBottom.length() - 1);
        }
    }
    return false;
}
```

### How remove duplicates
- [LeetCode 491 - Increasing Subsequences](https://leetcode.com/problems/increasing-subsequences/discuss/97147/Java-solution-beats-100)
  - [use set in dfs loop to remove duplicates](https://leetcode.com/problems/increasing-subsequences/discuss/97147/Java-solution-beats-100)
  - [use set result to remove duplicates](https://leetcode.com/problems/increasing-subsequences/discuss/97130/Java-20-lines-backtracking-solution-using-set-beats-100.)
  - [bfs: remove duplicates](http://www.cnblogs.com/grandyang/p/6388103.html)

### Hard Examples
- [LeetCode 394 - Decode String](https://discuss.leetcode.com/topic/71392/simple-java-dfs-solution)
  - [dfs](https://discuss.leetcode.com/topic/71392/simple-java-dfs-solution)
  - [Stack<Integer> countStack; Stack<String> resStack](https://leetcode.com/problems/decode-string/discuss/87534/Simple-Java-Solution-using-Stack)
```java
public String decodeString(String s) {
    StringBuilder builder = new StringBuilder();
    decodeStringRecur(s.toCharArray(),builder,0);
    return builder.toString();
}
public int decodeStringRecur(char[] sArr, StringBuilder builder, int start){
    if (start>=sArr.length){
        return start;
    }
    int p1 = start;
    while (p1<sArr.length && sArr[p1]!=']'){
        if (sArr[p1]<'0' || sArr[p1]>'9'){
            builder.append(sArr[p1++]);
        } else {
            int val = 0;
            while (p1<sArr.length && sArr[p1]!='['){
                val = val*10 + (int)(sArr[p1++]-'0');
            }
            StringBuilder subBuilder = new StringBuilder();
            p1 = decodeStringRecur(sArr,subBuilder,p1+1);
            for (int i=0;i<val;i++){
                builder.append(subBuilder);
            }
        }
    }    
    return (p1<sArr.length) ? p1+1 : p1;
}
```

### Hard
- [LeetCode 282 - Expression Add Operators](https://github.com/mintycc/OnlineJudge-Solutions/blob/master/Leetcode/282_Expression_Add_Operators.java)
  - key: prev(diff)

```java
public List<String> addOperators(String num, int target) {
    List<String> ans = new ArrayList<String>();
    search(0, 0, 0, target, new StringBuilder(), num, ans);
    return ans;
}

private void search(int index, long last, long sum, int target, StringBuilder prefix, String s, List<String> ans) {
    if (index == s.length()) {
        if (sum == target)
            ans.add(prefix.toString());
        return;
    }    
    int len = prefix.length();
    long num = 0;
    for (int i = index; i < s.length(); i ++) {
        num = num * 10 + s.charAt(i) - '0';
        if (index == 0) {
            search(i + 1, num, num, target, prefix.append(num), s, ans);
            prefix.setLength(len);
        } else {
            prefix.append('+'); prefix.append(num);
            search(i + 1,  num, sum + num, target, prefix, s, ans);
            prefix.setLength(len);
            prefix.append('-'); prefix.append(num);
            search(i + 1, -num, sum - num, target, prefix, s, ans);
            prefix.setLength(len);
            prefix.append('*'); prefix.append(num);
            search(i + 1, last * num, sum - last + last * num, target, prefix, s, ans);
            prefix.setLength(len);
        }
        if (num == 0) break;
    }
}
```

### Examples
- [Snapchat - ColorSum](https://warmland.gitbooks.io/algorithm/content/interview/snapchat_-_colorsum.html)
  - boolean helper(List<Color> colors, int index, Color target)
  - update target direct to reduce variables: instead of two variables: target and current

- [LeetCode 694 - Number of Distinct Islands](https://gist.github.com/BiruLyu/807f3960d6ea16f933a7de5bd4058a06)
  - ```set.add((i - baseX) + "_" + (j - baseY));```
  - [use dir](https://segmentfault.com/a/1190000017138588)
- [LeetCode 842 - Split Array into Fibonacci Sequence](https://leetcode.com/problems/split-array-into-fibonacci-sequence/discuss/133936/short-and-fast-backtracking-solution)
- [LeetCode 306 - Additive Number](https://leetcode.com/problems/additive-number/discuss/75567/Java-Recursive-and-Iterative-Solutions)
  - iterative + dfs

- [LeetCode 488 - Zuma Game](https://github.com/cherryljr/LeetCode/blob/master/Zuma%20Game.java)
