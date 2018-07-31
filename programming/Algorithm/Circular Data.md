### Circle - Data

#### virtual double data
- i<2n; data=array[i%n]

- [LeetCode 503 - Next Greater Element II: Circular](https://leetcode.com/problems/next-greater-element-ii/discuss/98273/java-10-lines-and-c-12-lines-linear-time-complexity-on-with-explanation)
  - Circular data: virtual double data
```java
public int[] nextGreaterElements(int[] nums) {
    int n = nums.length, next[] = new int[n];
    Arrays.fill(next, -1);
    Stack<Integer> stack = new Stack<>(); // index stack
    for (int i = 0; i < n * 2; i++) {
        int num = nums[i % n]; 
        while (!stack.isEmpty() && nums[stack.peek()] < num)
            next[stack.pop()] = num;
        if (i < n) stack.push(i);
    }   
    return next;
}
```

#### Call Non-Circle Data twice with different range
- [LeetCode 213 - House Robber II](https://leetcode.com/problems/house-robber-ii/discuss/59921/9-lines-0ms-O(1)-Space-C%2B%2B-solution)



