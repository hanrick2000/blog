
- [LeetCode 173 - Binary Search Tree Iterator]
```java
private Stack<TreeNode> stack = new Stack<TreeNode>();
public BSTIterator(TreeNode root) {
    pushAll(root);
}
public boolean hasNext() {
    return !stack.isEmpty();
}
public int next() {
    TreeNode tmpNode = stack.pop();
    pushAll(tmpNode.right);
    return tmpNode.val;
}
private void pushAll(TreeNode node) {
    for (; node != null; stack.push(node), node = node.left);
}
```

- [LeetCode 900 - RLE Iterator](https://leetcode.com/problems/rle-iterator/discuss/168286/Java-straightforward-code-with-comment-O(n)-time-and-O(1)-space)

- [LeetCode 251 - Flatten 2D Vector]()
```java
Iterator<List<Integer>> it;
Iterator<Integer> curr;
public Vector2D(List<List<Integer>> vec2d) {
    it = vec2d.iterator();
}
public int next() {
    hasNext(); // if false, throw NoSuchElementException
    return curr.next();
}
public boolean hasNext() {
    while((curr == null || !curr.hasNext()) && it.hasNext()){
        curr = it.next().iterator();
    }
    return curr != null && curr.hasNext();
}
```

- [LeetCode 341 - Flatten Nested List Iterator](https://leetcode.com/problems/flatten-nested-list-iterator/discuss/80175/share-my-java-neat-solution-8ms)
  - [Stack<Iterator<NestedInteger>> stack](https://leetcode.com/problems/flatten-nested-list-iterator/discuss/80175/share-my-java-neat-solution-8ms)
  - [Stack<NestedInteger>: need multiple iterators + data structures brainstorm](https://www.jiuzhang.com/solutions/flatten-nested-list-iterator/)
```java
public class NestedIterator implements Iterator<Integer> {
    Stack<Iterator<NestedInteger>> stack;
    Integer nextInteger;
    public NestedIterator(List<NestedInteger> nestedList) {
        stack = new Stack<Iterator<NestedInteger>>();
        stack.push(nestedList.iterator());
        nextInteger = null;
    }
    public Integer next() {
        Integer next = null;
        if(hasNext()) {
            next = nextInteger;
            nextInteger=null;
        }
        return next;
    }
    public boolean hasNext() {
        if(nextInteger==null) {
            while(!stack.isEmpty()) {
            Iterator<NestedInteger> cIterator = stack.peek();
            if(cIterator.hasNext()) {
                NestedInteger c = cIterator.next();
                if(c.isInteger()) {
                    nextInteger = c.getInteger();
                    return true;
                } else {
                    stack.push(c.getList().iterator());
                }
            }
            else stack.pop();
        }
          return false;
        } else return true;
    }   
}
```

