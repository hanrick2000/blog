- [LeetCode 135 - Candy: Children with a higher rating get more candies than their neighbors](https://leetcode.com/articles/candy/)
  - [scan twice, forward then backward]
  - [left2right + right2left or just one array](https://leetcode.com/articles/candy/#approach-4-single-pass-approach-with-constant-space-accepted)
  - [local min/max + ](https://leetcode.com/articles/candy/#approach-4-single-pass-approach-with-constant-space-accepted)
```java
public static int candy(int[] ratings) {
    int pre = 1, countDown = 0, total = 1;
    for (int i = 1; i < ratings.length; i++) {
        if (ratings[i] >= ratings[i - 1]) {
            if (countDown > 0) {
                total += countDown * (countDown + 1) / 2;   // progression part
                if (countDown >= pre) { // check if pre is tall enough
                    total += countDown - pre + 1;
                }
                pre = 1;    // when ascending and there is countDown, prev should be 1
                countDown = 0;
            }
            pre = ratings[i] == ratings[i - 1] ? 1 : pre + 1;   // when equals to previous one, set to 1. Else set to prev + 1
            total += pre;
        }
        else {
            countDown++;
        }
    }
    if (countDown > 0) {    // check if there is countDown in the end
        total += countDown * (countDown + 1) / 2;
        if (countDown >= pre) {
            total += countDown - pre + 1;
        }
    }
    return total;
}
```