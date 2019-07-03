#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### Implementation Detail
- DoubleLinkedList + Map/TreeMap
- Use DoubleLinkedList class to wrap the logic of maintain head tail nodes.
- use version to track valid element in map

### DoubleLinkedList + Map/TreeMap
- [LeetCode 716 - Max Stack](https://leetcode.com/articles/max-stack/)
  - [Two Stacks, O(n) for popMax]
  - [DoubleLinkedList + TreeMap<Integer, List<DoubleLinkedNode>>()]

- [LeetCode 380 - Insert Delete GetRandom O(1)](https://leetcode.com/problems/insert-delete-getrandom-o1/discuss/85401/Java-solution-using-a-HashMap-and-an-ArrayList-along-with-a-follow-up.-(131-ms))
- [LeetCode 381 - Insert Delete GetRandom O(1) - Duplicates allowed]
  - ArrayList<Integer> nums; Map<Integer, Set<Integer>> locs;

- [Logger:started, finished, print - Google](https://docs.google.com/document/d/1qxA2wps0IhVRWULulQ55W4SGPMu2AE5MkBB37h8Dr58)

### Freq Buckets
- freq increases from 1 to n continuously
- [LeetCode 895 - Maximum Frequency Stack: popMax](https://leetcode.com/problems/maximum-frequency-stack/discuss/163453/JAVA-O(1)-solution-easy-understand-using-bucket-sort)
  - [freqMap, List<Stack<Integer>> bucket](https://leetcode.com/problems/maximum-frequency-stack/discuss/163453/JAVA-O(1)-solution-easy-understand-using-bucket-sort)
  - [PriorityQueue: Pair{value,count,time}](https://leetcode.com/problems/maximum-frequency-stack/discuss/163416/Java-Priority-Queue-easy-understand)
```java
class FreqStack {
    List<Stack<Integer>> bucket;
    HashMap<Integer, Integer> map;
    public FreqStack() {
        bucket = new ArrayList<>();
        map = new HashMap<>();
    }
    public void push(int x) {
        map.put(x, map.getOrDefault(x, 0) + 1);
        int freq = map.get(x);
        if (freq - 1 >= bucket.size()) {
            bucket.add(new Stack<Integer>());
        }
        bucket.get(freq - 1).add(x);
    }
    public int pop() {
        int freq = bucket.size();
        int x = bucket.get(freq - 1).pop();
        if (bucket.get(freq - 1).isEmpty()) bucket.remove(bucket.size() - 1);
        map.put(x, map.get(x) - 1);
        if (map.get(x) == 0) map.remove(x);
        return x;
    }
}
class FreqStack {
    class Pair{
        int num;
        int count;
        int time;
        Pair(int num, int count, int time){
            this.num = num;
            this.count = count;
            this.time = time;
        }
    }
    private PriorityQueue<Pair> queue;
    private HashMap<Integer,Integer> map;
    private int clock = 0;
    public FreqStack() {
        queue = new PriorityQueue<Pair>((a,b) -> (a.count == b.count?b.time-a.time:b.count-a.count));
        map = new HashMap();
    }
    public void push(int x) {
        Pair pair = new Pair(x,map.getOrDefault(x,0)+1,clock++);
        map.put(x,map.getOrDefault(x,0)+1);
        queue.offer(pair);
    }
    public int pop() {
        Pair cur = queue.poll();
        // update
        map.put(cur.num,map.getOrDefault(cur.num,0)-1);
        return cur.num;
    }   
}
```

- [Design a Data Structure with Insert & Delete & GetMostFrequent of O(1) － LRU](https://www.programcreek.com/2016/08/design-a-data-structure-with-insert-delete-getmostfrequent-of-o1/)
  - HashMap<Integer, Node> map: Node contains all values with same frequency
- [LeetCode 432 - All O`one Data Structure](https://leetcode.com/problems/all-oone-data-structure/discuss/91416/java-ac-all-strict-o1-not-average-o1-easy-to-read)
  - [sorted Buckets + Map<Integer, Bucket> countBucketMap](https://leetcode.com/problems/all-oone-data-structure/discuss/91416/java-ac-all-strict-o1-not-average-o1-easy-to-read)
  - [TreeMap<Integer,HashSet<String>> reversedIndex](https://blog.csdn.net/MebiuW/article/details/53436455)
```java
// maintain a doubly linked list of Buckets
private Bucket head;
private Bucket tail;
// for accessing a specific Bucket among the Bucket list in O(1) time
private Map<Integer, Bucket> countBucketMap;
// keep track of count of keys
private Map<String, Integer> keyCountMap;
// each Bucket contains all the keys with the same count
// sorted linked
private class Bucket {
    int count;
    Set<String> keySet;
    Bucket next;
    Bucket pre;
    public Bucket(int cnt) {
        count = cnt;
        keySet = new HashSet<>();
    }
}
```

### Custom LinkedList + HashMap
- [LeetCode 146 - Least Recently Used (LRU) Cache](http://www.learn4master.com/data-structures/hashtable/leetcode-lru-cache-solution-in-java)
  - Linkedlist + HashMap
- [LeetCode 460 - LFU Cache][keyValueMap, freqMap, Map<Integer, LinkedHashSet<Integer>> sameFreqMap, minFreq](https://leetcode.com/problems/lfu-cache/discuss/94521/java-o1-very-easy-solution-using-3-hashmaps-and-linkedhashset)
  - When the cache reaches its capacity, it should invalidate the least frequently used item before inserting a new item. For the purpose of this problem, when there is a tie (i.e., two or more keys that have the same frequency), the least recently used key would be evicted.
  - [keyValueMap, freqMap, Map<Integer, LinkedHashSet<Integer>> sameFreqMap, minFreq](https://leetcode.com/problems/lfu-cache/discuss/94521/java-o1-very-easy-solution-using-3-hashmaps-and-linkedhashset)
    - use another map: Map<Integer, LinkedHashSet<Integer>> sameFreqMap to simulate doubly linked list
  - [keyValueMap, Map<Integer, Node> nodeHash, had, Node{freq, sameFreqKyes}](https://leetcode.com/problems/lfu-cache/discuss/94515/Java-O(1)-Accept-Solution-Using-HashMap-DoubleLinkedList-and-LinkedHashSet)
  - [TreeSet](https://leetcode.com/problems/lfu-cache/discuss/94536/java-solution-using-priorityqueue-with-detailed-explanation)
```java
private Node head = null;
private int cap = 0;
private HashMap<Integer, Integer> valueHash = null;
private HashMap<Integer, Node> nodeHash = null;
public LFUCache(int capacity) {
    this.cap = capacity;
    valueHash = new HashMap<Integer, Integer>();
    nodeHash = new HashMap<Integer, Node>();
}
public int get(int key) {
    if (valueHash.containsKey(key)) {
        increaseCount(key);
        return valueHash.get(key);
    }
    return -1;
}
public void set(int key, int value) {
    if ( cap == 0 ) return;
    if (valueHash.containsKey(key)) {
        valueHash.put(key, value);
    } else {
        if (valueHash.size() < cap) {
            valueHash.put(key, value);
        } else {
            removeOld();
            valueHash.put(key, value);
        }
        addToHead(key);
    }
    increaseCount(key);
}
private void addToHead(int key) {
    if (head == null) {
        head = new Node(0);
        head.keys.add(key);
    } else if (head.count > 0) {
        Node node = new Node(0);
        node.keys.add(key);
        node.next = head;
        head.prev = node;
        head = node;
    } else {
        head.keys.add(key);
    }
    nodeHash.put(key, head);      
}
private void increaseCount(int key) {
    Node node = nodeHash.get(key);
    node.keys.remove(key);
    if (node.next == null) {
        node.next = new Node(node.count+1);
        node.next.prev = node;
        node.next.keys.add(key);
    } else if (node.next.count == node.count+1) {
        node.next.keys.add(key);
    } else {
        Node tmp = new Node(node.count+1);
        tmp.keys.add(key);
        tmp.prev = node;
        tmp.next = node.next;
        node.next.prev = tmp;
        node.next = tmp;
    }
    nodeHash.put(key, node.next);
    if (node.keys.size() == 0) remove(node);
}
private void removeOld() {
    if (head == null) return;
    int old = 0;
    for (int n: head.keys) {
        old = n;
        break;
    }
    head.keys.remove(old);
    if (head.keys.size() == 0) remove(head);
    nodeHash.remove(old);
    valueHash.remove(old);
}
private void remove(Node node) {
    if (node.prev == null) {
        head = node.next;
    } else {
        node.prev.next = node.next;
    }
    if (node.next != null) {
        node.next.prev = node.prev;
    }
}
class Node {
    public int count = 0;
    public LinkedHashSet<Integer> keys = null;
    public Node prev = null, next = null;
}
```

### N Queens
- [LeetCode 51 - N-Queens](https://leetcode.com/problems/n-queens/discuss/19804/Share-my-JAVA-DFS-solution-very-easy-to-understand)
- [LeetCode 1001 - Grid Illumination](https://leetcode.com/problems/grid-illumination/discuss/243076/Java-Clean-Code-O(N)-Time-and-O(N)-Space-Beats-100)
```java
Map<Integer, Integer> row = new HashMap();       // row number to count of lamps
Map<Integer, Integer> col = new HashMap();       // col number to count of lamps
Map<Integer, Integer> diag = new HashMap();       // diagonal x-y to count of lamps
Map<Integer, Integer> diag2 = new HashMap();       // diagonal x+y to count of lamps
Map<Integer, Boolean> lamps = new HashMap();       // whether lamp is  ON|OFF
```


### Examples
- [LeetCode 353 - Design Snake Game]
  - Set<Integer> body, Deque<Integer> snake
- [LeetCode 155 - Min Stack](https://aaronice.gitbooks.io/lintcode/content/data_structure/min_stack.html)
- [Constant Clear Map](https://github.com/xieqilu/Qilu-leetcode/blob/master/B230.ConstantClearMap.cs)
- [History Query on Stack](https://shanzi.gitbooks.io/algorithm-notes/content/problem_solutions/history_query_on_stack.html)

### Binary Tree
- [Google – Manager Peer Problem]
1. setManager(A, B) sets A as a direct manager of B
2. setPeer(A, B) sets A as a colleague of B. After that, A and B will have the same direct Manager.
3. query(A, B) returns if A is in the management chain of B.
  - Map<Integer, TNode> nodeMap
  - union find: int[] parent

