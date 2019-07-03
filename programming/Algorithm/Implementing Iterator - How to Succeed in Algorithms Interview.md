#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### Iterator
- `public boolean hasNext()`{.java} `public E next()`{.java}
- Call hasNext() in next
- Corner case: whether element can be null

#### Read LinkedList.ListItr<E> and ArrayList.Itr<E>
```java
private class ListItr implements ListIterator<E> {
    private Node<E> lastReturned;
    private Node<E> next;
    private int nextIndex;
    private int expectedModCount = modCount;
    ListItr(int index) {
        next = (index == size) ? null : node(index);
        nextIndex = index;
    }
    public boolean hasNext() {
        return nextIndex < size;
    }
    public E next() {
        checkForComodification();
        if (!hasNext())
            throw new NoSuchElementException();
        lastReturned = next;
        next = next.next;
        nextIndex++;
        return lastReturned.item;
    }
    public boolean hasPrevious() {
        return nextIndex > 0;
    }
    public E previous() {
        checkForComodification();
        if (!hasPrevious())
            throw new NoSuchElementException();
        lastReturned = next = (next == null) ? last : next.prev;
        nextIndex--;
        return lastReturned.item;
    }
    public int nextIndex() {
        return nextIndex;
    }
    public int previousIndex() {
        return nextIndex - 1;
    }
}    
```

#### Examples of Iterator Implementation in Algorithm Interview
- Google – Non Null Iterator
- Google – Jump Iterator
  - next() returns iterator.next().next()
  - T current
- Positive Iterator: the iterator only returns positive values
- [LeetCode 284 - Peek Iterator](https://leetcode.com/problems/peeking-iterator/discuss/72558/concise-java-solution)
  - design and implement a PeekingIterator that support the peek() operation -- it essentially peek() at the element that will be returned by the next call to next()
- [RotatingIterator](https://github.com/kowshik/big-o/blob/master/java/src/collections/RotatingIterator.java)
  -  If the following iterators are passed: iterator_1 => [1] iterator_2 => [2, 3] iterator_3 => [4, 5], then the rotating iterator returns the following elements in sequential order: 1, 2, 4, 3, 5.
- [LeetCode 900 - RLE Iterator](https://leetcode.com/problems/rle-iterator/discuss/168286/Java-straightforward-code-with-comment-O(n)-time-and-O(1)-space)
  - Google – Run Length Encoding Iterator
  - Input: Run length encoding String 4a2b3c (aaaabbccc)
  - Implement an iterator
  - `Character curr; int cnt; int index;`{.java}
- [LeetCode 251 - Flatten 2D Vector](http://buttercola.blogspot.com/2015/08/leetcode-flatten-2d-vector.html)
  - Implement an iterator to flatten a 2d vector.
  - Input: List<List<Integer>> vec2d
  - Maintain two iterators: outer iterator for vec2d, inner iterator for current list
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

#### Iterators with Data Structures (Stack/Queue)
- [LeetCode 281 - Zigzag Iterator]
  - cur_iterator, it1, it2
  - For k lists: iterators with Queue
```java
LinkedList<Iterator> list;
public ZigzagIterator(List<Integer> v1, List<Integer> v2) {
    list = new LinkedList<Iterator>();
    if(!v1.isEmpty()) list.add(v1.iterator());
    if(!v2.isEmpty()) list.add(v2.iterator());
}

public int next() {
    Iterator poll = list.remove();
    int result = (Integer)poll.next();
    if(poll.hasNext()) list.add(poll);
    return result;
}

public boolean hasNext() {
    return !list.isEmpty();
}
```
- [LeetCode 341 - Flatten Nested List Iterator](https://leetcode.com/problems/flatten-nested-list-iterator/discuss/80175/share-my-java-neat-solution-8ms)
  - [Related: Design a deep iterator](https://github.com/kowshik/big-o/blob/master/java/src/collections/DeepIterator.java)
  - [Stack<Iterator<NestedInteger>> stack](https://leetcode.com/problems/flatten-nested-list-iterator/discuss/80175/share-my-java-neat-solution-8ms)
    - keep an additional field storing the next integer
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
- [LeetCode 173 - Binary Search Tree Iterator](https://leetcode.com/problems/binary-search-tree-iterator/discuss/52525/My-solutions-in-3-languages-with-Stack)
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

