- [LeetCode 394 - Decode String](https://leetcode.com/problems/decode-string/discuss/87534/Simple-Java-Solution-using-Stack)
  - [Recursion: int decodeStringRecur(char[] sArr, StringBuilder builder, int start)](http://www.cnblogs.com/lishiblog/p/5874147.html)
    - return end position
  - [stack](https://leetcode.com/problems/decode-string/discuss/87534/Simple-Java-Solution-using-Stack)
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
            // get the following encoded string.
            // get the number first.
            int val = 0;
            while (p1<sArr.length && sArr[p1]!='['){
                val = val*10 + (int)(sArr[p1++]-'0');
            }
            // get the string.
            StringBuilder subBuilder = new StringBuilder();
            p1 = decodeStringRecur(sArr,subBuilder,p1+1);
            // add into decoded string.
            for (int i=0;i<val;i++){
                builder.append(subBuilder);
            }
        }
    }
    return (p1<sArr.length) ? p1+1 : p1;
}
```

- [LeetCode 1006 - Clumsy Factorial](https://leetcode.com/problems/clumsy-factorial/discuss/252247/C%2B%2BJava-Brute-Force)
  - [Find the loop](https://leetcode.com/problems/clumsy-factorial/discuss/252247/C%2B%2BJava-Brute-Force)
```java
public int clumsy(int N) {
    if (N == 0) return 0;
    if (N == 1) return 1;
    if (N == 2) return 2;
    if (N == 3) return 6;
    return N * (N - 1) / (N - 2) + helper(N - 3);
}
public int helper(int N) {
    if (N == 0) return 0;
    if (N == 1) return 1;
    if (N == 2) return 1;
    if (N == 3) return 1;
    return N - (N - 1) * (N - 2) / (N - 3) + helper(N - 4);
}
```

### Use recursion to handle last element first
- [LeetCode 369 - Plus One Linked List](http://www.cnblogs.com/grandyang/p/5626389.html)
  - [lastnot9](https://leetcode.com/problems/add-two-numbers-ii/discuss/92788/Java-iterative-O(1)-space-lastNot9-solution-Changed-from-Plus-One-Linked-List)
```java
public ListNode plusOne(ListNode head) {
    if (plusOneHelper(head) == 0) {
        return head;
    }
    ListNode newHead = new ListNode(1);
    newHead.next = head;
    return newHead;
}
// plus one for the rest of the list starting from node and return carry
//because last node.next is null, let null return 1 and it is equivalent to  "plus one" to the least significant digit
private int plusOneHelper(ListNode node) {
    if (node == null) {
        return 1;
    }
    int sum = node.val + plusOneHelper(node.next);
    node.val = sum % 10;
    return sum / 10;
}
```
- [Implement k stacks in a single array](https://www.geeksforgeeks.org/efficiently-implement-k-stacks-single-array/)
  - [topOfStack, stackData, nextIndex, nextAvailable](https://www.byte-by-byte.com/nstacks/)
  - [maintain a free list](https://martinm2w.wordpress.com/2012/05/28/3-1-stack-implement-3-stacks-using-a-single-array/)
- [Stack Reversal](http://codingrecipies.blogspot.com/2014/01/stack-reversal.html)
```Java
public void reverseStack(Stack<Integer> stack){
 if(stack.isEmpty())
  return ;
 int val= stack.pop();
 reverseStack(stack);
 pushToBottom(stack,val);
 return ;
}
private void pushToBottom(Stack<Integer> stack,int item){
 if(stack.isEmpty()){
  stack.push(item);
  return ;
 }
 int val= stack.pop();
 pushToBottom(stack,item);
 stack.push(val);
}
```

- [LeetCode 430 - Flatten a multilevel linked list](http://www.cnblogs.com/grandyang/p/9688522.html)
  - [while loop in recursion](https://leetcode.com/problems/flatten-a-multilevel-doubly-linked-list/discuss/159746/Java-1ms-Recursion-beats-100-with-explaination)
  - [recursion without loop](https://leetcode.com/problems/flatten-a-multilevel-doubly-linked-list/discuss/157606/Java-Recursive-Solution)
  - [iterative: stack](https://leetcode.com/problems/flatten-a-multilevel-doubly-linked-list/discuss/252772/Easily-understable-Java-Solution-Runtime-1ms-beat-100-Recursive)
  - [iterative version: O(N^2)](https://www.cnblogs.com/Dylan-Java-NYC/p/9596026.html)
```java
public Node flatten(Node head) {
    if( head == null) return head;
    Node p = head; 
    while( p!= null) {
        /* CASE 1: if no child, proceed */
        if( p.child == null ) {
            p = p.next;
            continue;
        }
        /* CASE 2: got child, find the tail of the child and link it to p.next */
        Node temp = p.child;
        // Find the tail of the child
        while( temp.next != null ) 
            temp = temp.next;
        // Connect tail with p.next, if it is not null
        temp.next = p.next;  
        if( p.next != null )  p.next.prev = temp;
        // Connect p with p.child, and remove p.child
        p.next = p.child; 
        p.child.prev = p;
        p.child = null;
    }
    return head;
}

public Node flatten(Node head) {
    helper(head);
    return head;
}
private Node helper(Node head) {
    Node cur = head, pre = head;
    while(cur != null) {
        if(cur.child == null) {
            pre = cur;
            cur = cur.next;
        } else {
            Node tmp = cur.next;
            Node child = helper(cur.child);
            cur.next = cur.child;
            cur.child.prev = cur;
            cur.child = null;
            child.next = tmp;
            if(tmp != null) tmp.prev = child;
            pre = child;
            cur = tmp;
        }
    }
    return pre;
}
```
- [LeetCode 679 - 24 Game](https://leetcode.com/problems/24-game/discuss/107673/JAVA-Easy-to-understand.-Backtracking.)
```java
boolean res = false;
final double eps = 0.001;
public boolean judgePoint24(int[] nums) {
    List<Double> arr = new ArrayList<>();
    for(int n: nums) arr.add((double) n);
    helper(arr);
    return res;
}
private void helper(List<Double> arr){
    if(res) return;
    if(arr.size() == 1){
        if(Math.abs(arr.get(0) - 24.0) < eps)
            res = true;
        return;
    }
    for (int i = 0; i < arr.size(); i++) {
        for (int j = 0; j < i; j++) {
            List<Double> next = new ArrayList<>();
            Double p1 = arr.get(i), p2 = arr.get(j);
            next.addAll(Arrays.asList(p1+p2, p1-p2, p2-p1, p1*p2));
            if(Math.abs(p2) > eps)  next.add(p1/p2);
            if(Math.abs(p1) > eps)  next.add(p2/p1);
            
            arr.remove(i);
            arr.remove(j);
            for (Double n: next){
                arr.add(n);
                helper(arr);
                arr.remove(arr.size()-1);
            }
            arr.add(j, p2);
            arr.add(i, p1);
        }
    }
}
```
