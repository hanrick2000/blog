### [How to Land Your Dream Job Series](https://lifelongprogrammer.blogspot.com/search/label/Google_Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Interview_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

### Why important to write bug-free code
- Writing solid and bug free code is important especially during interview. It doesn't have to be bug free at first, but the candidate should be able to quickly find the bug by him/herself and fix it correctly.
- Usually one round of interview would focus on solid code, the coding question would be not that complex, for example **LeetCode 2/445: Add Two Numbers**. For these kind questions, candidates should pay more attention to code detail, also depend on the exact question, it may be the start question, the interviewer expect you solve in around 15 minutes, and have one more complex question or follow up to ask.
- In this case the candidate has to solve the problem quickly and with solid and bug free code (as it's hard to know the intention of the interviewer: whether the interviewer cares about detail or not).
- It's a lot of pressure to write code during interview. It's better you have a check list or know what to check during the code interview, or at least can quickly find the bug before the interview does.
- We also need practice in our daily work: try to write less bugs at first and check the code to find the bug first before run the test.

<!-- This check list is also useful when we write code. -->

<!-- It can help us avoid common problems. -->
---

### Helper methods
- When we think some code we are likely to appear multiple times, and it's simple but a little bit long to write; or some code it's a little trick but not related with main logic;
- We can extract it as a separate method: give it a short and meaningful name, we just mention it to the interviewer, and don'y have to implement it now.
- This can make us focus on the main logic and save us time.

---

### The Checklist
#### Check the change of variables
- This is the most mistakes we made either during interview or everyday.
- Whether we change the pointer(next, current), list(result, temp list), sum correctly.

#### off-by-one

#### [<(<=) or >(>=)](http://www.gayle.com/blog/2016/3/coding-interviews-and-the-importance-of-perfection){target="blank"}
- To get the min/max, should we use <(<=) or >(>=)?
```java
if (max < array[i]) {
 max = array[i];
}
```

#### NPE

#### the ELSE case

#### Handle some cases after the loop or merge cases
<!-- Better: if we can merge tases cases and handle -->
Usually after the loop, we need handle the case when one list is a longer. If possible we should try to merge these different cased and handle all cases in the loop.

Like in the case [LeetCode 2 - Add Two Numbers](https://leetcode.com/problems/add-two-numbers/discuss/1059/my-accepted-java-solution){target="blank"}, we handle the case when list1 or list2 is longer and has more elements in the while loop, so after we don't have to handle the cases: list1 or list2 has more elements.

Check [here for more algorithm interview questions that we can merge cases.](https://lifelongprogrammer.blogspot.com/2019/01/merge-cases-code-detail.html){target="blank"}

#### Check precondition
- Validate parameters.

#### Don't Forget Comparator
We usually add items to some sorted data structure like: PriorityQueue, TreeSet etc or sort them by some conditions.

It's very easy to forget to add the comparator: we can use Lambada, or better: just use the not-exist comparator class in the code: as we may use the same comparator class later, and we maybe don't have to really implement it.

#### Choose API that is more descriptive, less error-prone
- Use add(remove/Peek)Last/First instead of push or poll (ArrayDeque)

### Others
- Overflow: it's good to mention this, and ask whether you need handle it.
- Good naming for method and variables

---

<!-- ### Convention
- [When compare, which one should be first](http://www.gayle.com/blog/2016/3/coding-interviews-and-the-importance-of-perfection){target="blank"}
```java
if (max < array[i]) {
 max = array[i];
}
``` -->

### Common Mistakes
#### [Binary search](https://hackernoon.com/binary-search-in-detail-914944a1434a){target="blank"}
Check [here about the different cases in binary search](https://hackernoon.com/binary-search-in-detail-914944a1434a){target="blank"}

<script src="https://gist.github.com/MithraTalluri/c1ed2aa0b16142836b99f03dc8359d7a.js"></script>

### Best Coding Challenge Websites
- [Leetcode](http://www.leetcode.com/)
- [GeeksforGeeks](https://www.geeksforgeeks.org/)
- [hackerrank](https://www.hackerrank.com/)
- [Big collection of interview preparation links](https://www.reddit.com/r/cscareerquestions/comments/2lzc4h/big_collection_of_interview_preparation_links/)
- [TopCoder](https://www.topcoder.com/challenges/?pageIndex=1)
- [CodeChef](https://www.codechef.com/)
- [Codeforces](http://codeforces.com/)

### Books for Algorithm Interview
- [Cracking the Coding Interview: 189 Programming Questions and Solutions](https://www.amazon.com/Cracking-Coding-Interview-Programming-Questions/dp/0984782850)
- [Elements of Programming Interviews in Java: The Insiders' Guide](https://www.amazon.com/Elements-Programming-Interviews-Java-Insiders/dp/1517671272)
- [The Algorithm Design Manual](https://www.amazon.com/Algorithm-Design-Manual-Steven-Skiena/dp/1849967202)
- [Grokking Algorithms: An illustrated guide for programmers and other curious people](https://www.amazon.com/Grokking-Algorithms-illustrated-programmers-curious/dp/1617292230)
- [Coderust: Hacking the Coding Interview](https://www.educative.io/collection/5642554087309312/5679846214598656){target="blank"}
- [Data Structures in Java/Python: : An Interview Refresher](https://www.educative.io/d/data_structures){target="blank"}

<script type="text/javascript">
amzn_assoc_placement = "adunit-algorithm";
amzn_assoc_search_bar = "false";
amzn_assoc_tracking_id = "jeffery06-20";
amzn_assoc_ad_mode = "manual";
amzn_assoc_ad_type = "smart";
amzn_assoc_marketplace = "amazon";
amzn_assoc_region = "US";
amzn_assoc_title = "Best books for algorithms interview";
amzn_assoc_linkid = "595ccbf639e3d3215212481e02dc6909";
amzn_assoc_asins = "0984782850,1517671272,1617292230,032157351X,1537713949,0262033844,111941847X,819324527X";
</script>
<script src="//z-na.amazon-adsystem.com/widgets/onejs?MarketPlace=US"></script>
