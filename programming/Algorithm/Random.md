- Reservoir Sampling
- Rejection Sampling
- Monto Carlo

### Reservoir Sampling
- [LeetCode 528 - Random Pick with Weight]
  - [presum + binary search](https://leetcode.com/problems/random-pick-with-weight/discuss/154432/Very-easy-solution-based-on-uniform-sampling-with-explanation)
  - [TreeMap](https://leetcode.com/problems/random-pick-with-weight/discuss/154024/JAVA-8-lines-TreeMap)
- LeetCode 382 - Linked List Random Node
- LeetCode 497 - Random Point in Non-overlapping Rectangles
- [Random Maximum](http://www.fgdsb.com/2015/01/15/random-maximum/)
- [Get Random node from Binary Tree](http://shibaili.blogspot.com/2015/07/google-interview-questions-4.html)

### Rejection Sampling
- [LeetCode 478 - Generate Random Point in a Circle]
  - [Polar Coordinates](https://leetcode.com/problems/generate-random-point-in-a-circle/discuss/154037/Polar-Coordinates-10-lines)
  - [Rejection Sampling](https://leetcode.com/problems/generate-random-point-in-a-circle/discuss/154037/Polar-Coordinates-10-lines)

- [LeetCode 470 - Implement Rand10() Using Rand7()](http://www.cnblogs.com/grandyang/p/9727206.html)
```java
int rand10() {
  while (true) {
      int num = (rand7() - 1) * 7 + rand7();
      if (num <= 40) return num % 10 + 1;
  }
}
```
- [Implement Rand6 by Rand2](https://reeestart.wordpress.com/2016/06/23/google-implement-rand6-by-rand2/)
- [Generate randN given rand1](https://hellosmallworld123.wordpress.com/2014/06/13/generate-randn-given-rand1/)
```java
while(true) {
    int r = 5*(rand5 - 1) + rand5; // uniformly generate number between 1 to 25
    if (r <= 21) 
        return r % 7 + 1; // if r falls in between 1 ~ 20, module 7 to get a number between 0 ~ 6. the distribution is also uniform.
}
```

### Shuffle
- [Perfect Shuffle Cards](https://github.com/deepak-malik/Cracking-The-Coding-Interview/blob/master/src/com/deepak/ctci/Ch17_Hard/Problem_02.java)
```java
public static int[] shuffleDeckOfCards(int[] cards) {
  Random random = new Random();
  for (int i = 1; i < cards.length; i++) {
    int k = random.nextInt(i);
    if (k != i) {
      int temp = cards[k];
      cards[k] = cards[i];
      cards[i] = temp;
    }
  }
  return cards;
}
```
- LeetCode 384 - Shuffle an Array
```java
public int[] shuffle(){
    for(int i=1;i<arr.length;i++) {
        int j=rand.nextInt(i+1);
        swap(arr,i,j);
    }
    return arr;
}
```

- [Shuffling a linked list](https://www.cnblogs.com/evasean/p/7232572.html)

### Examples
- [Make a fair coin from a biased coin](https://www.geeksforgeeks.org/print-0-and-1-with-50-probability/)
```cpp
int my_fun() 
{
    int val1 = foo();
    int val2 = foo();
    if (val1 == 0 && val2 == 1)
        return 0;   // Will reach here with 0.24 probability
    if (val1 == 1 && val2 == 0)
        return 1;   // // Will reach here with 0.24 probability
    return my_fun();  // will reach here with (1 - 0.24 - 0.24) probability
}
```





