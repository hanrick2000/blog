- Reverse
- 反面答案

#### Simplify
##### Propose assumption and verify it
- [LeetCode 838 - Push Dominoes](https://leetcode.com/problems/shortest-distance-to-a-character/discuss/125788/)
  - the state of current element, only depend on the shortest distance to 'L' and 'R'.

- [LeetCode 542 - 01 Matrix](https://leetcode.com/articles/01-matrix/)
  - In one iteration from top to bottom, we can check left and top directions, and we need another iteration from bottom to top to check for right and bottom direction

- row based -> col based
  - [LeetCode 861 - Score After Flipping Matrix](https://leetcode.com/articles/score-after-flipping-matrix/)

#### Choose which to start
- [LeetCode 616 - Add Bold Tag in String]

#### Remap
- [LeetCode 710	- Random Pick with Blacklist](https://leetcode.com/problems/random-pick-with-blacklist/discuss/144624/Java-O(B)-O(1)-HashMap)

#### Detect Cycle in list
- LeetCode 287 - Find the Duplicate Number
  - Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive),
  - [O(n) find cycle in LinkedList](https://leetcode.com/articles/find-the-duplicate-number/)
    - index to number linked list

- [LeetCode 300 - Longest Increasing Subsequence](https://leetcode.com/articles/longest-increasing-subsequence/)
  - o(nlogn)

####
- [LeetCode 828 - Unique Letter String](https://leetcode.com/problems/unique-letter-string/discuss/172041/Very-simple-O(N)-with-Prev-and-Next)
  - [prevIndex, nextIndex for same element:  ans += (i - left[i]) * (right[i] - i);](https://leetcode.com/problems/unique-letter-string/discuss/172041/Very-simple-O(N)-with-Prev-and-Next)
  - [dp: dp[i] = dp[i-1] + (i-f) - (f-s), first/secondIndex[]](https://leetcode.com/problems/unique-letter-string/discuss/158378/Concise-DP-O(n)-solution)
  - [Split by Character](https://leetcode.com/articles/unique-letter-string/)
  <!-- 换个角度，求每个字符的有效substring个数 -->
```java
int uniqueLetterString(string S) {
    const int mod = 1000000007;
    vector<int> last(26, -1);
    int n = S.length();
    vector<int> left(n, -1), right(n, n);
    for (int i = 0; i < n; i++) {
        left[i] = last[S[i] - 'A'];
        last[S[i] - 'A'] = i;
    }
    last = vector<int>(26, n);
    for (int i = n - 1; i >= 0; i--) {
        right[i] = last[S[i] - 'A'];
        last[S[i] - 'A'] = i;
    }
    int ans = 0;
    for (int i = 0; i < n; i++)
        ans = (ans + (LL)(i - left[i]) * (right[i] - i)) % mod;
    return ans;
}
public int uniqueLetterString(String S) {
    Map<Character, List<Integer>> index = new HashMap();
    for (int i = 0; i < S.length(); ++i) {
        char c = S.charAt(i);
        index.computeIfAbsent(c, x-> new ArrayList<Integer>()).add(i);
    }
    long ans = 0;
    for (List<Integer> A: index.values()) {
        for (int i = 0; i < A.size(); ++i) {
            long prev = i > 0 ? A.get(i-1) : -1;
            long next = i < A.size() - 1 ? A.get(i+1) : S.length();
            ans += (A.get(i) - prev) * (next - A.get(i));
        }
    }
    return (int) ans % 1_000_000_007;
}

public int uniqueLetterString(String s) {
    final int MOD = 1000000007;
    int res = 0, dp = 0;
    int[] first = new int[26], second = new int[26];

    for (int i = 0; i < s.length(); i++) {
        int ci = s.charAt(i) - 'A';
        dp = dp + 1 + i - first[ci] * 2 + second[ci];
        res = (res + dp) % MOD;

        second[ci] = first[ci];
        first[ci] = i + 1;
    }
    return res;
}
```

- [LeetCode 891 - Sum of Subsequence Widths](https://leetcode.com/problems/sum-of-subsequence-widths/discuss/161267/C++Java1-line-Python-Sort-and-One-Pass?page=2)
  - presort

#### Idea -> Code
- simplify

- [LeetCode 120 - Triangle](https://leetcode.com/problems/triangle/discuss/38918/C%2B%2B-top-down-and-bottom-up-solutions.)
  - bottom to up, answer: dp[0]
  - top -> down, answer: min(dp[0]..dp[n])


- [Find Celebrity](http://massivealgorithms.blogspot.com/2014/08/the-celebrity-problem-geeksforgeeks.html)

### Add dummy data
- add 1 at front and end
- [LeetCode 312 - Burst Balloons: If the you burst balloon i you will get nums[left] * nums[i] * nums[right] coins](https://leetcode.com/problems/burst-balloons/discuss/76228/Share-some-analysis-and-explanations)
  - add 1 at front and end, which doesn't change the final result
  - dp[i][j] = max(dp[i][j], dp[i][k – 1] + nums[i – 1] * nums[k] * nums[j + 1] + dp[k + 1][j] for k in (i,j)
```java
public int maxCoins(int[] iNums) {
    int[] nums = new int[iNums.length + 2];
    int n = 1;
    for (int x : iNums) if (x > 0) nums[n++] = x;
    nums[0] = nums[n++] = 1;
    int[][] dp = new int[n][n];
    for (int k = 1; k < n; ++k)
        for (int left = 0; left < n - k; ++left) {
            int right = left + k;
            for (int i = left + 1; i < right; ++i)
                dp[left][right] = Math.max(dp[left][right],
                nums[left] * nums[i] * nums[right] + dp[left][i] + dp[i][right]);
        }
    return dp[0][n - 1];
}
```


- [LeetCode 109 - Convert Sorted List to Balanced Binary Search Tree (BST)](https://leetcode.com/articles/convert-sorted-list-to-binary-search-tree/)
  - [inorder: insert nodes in BST in the same order as the appear in Linked List](https://www.geeksforgeeks.org/sorted-linked-list-to-balanced-bst)
```JAVA
private ListNode node;
inorderHelper(0, size - 1);
public TreeNode inorderHelper(int start, int end){
	if(start > end){
		return null;
	}
	int mid = start + (end - start) / 2;
	TreeNode left = inorderHelper(start, mid - 1);
	TreeNode treenode = new TreeNode(node.val);
	treenode.left = left;
	node = node.next;
	TreeNode right = inorderHelper(mid + 1, end);
	treenode.right = right;
	return treenode;
}
```
#### Data range 1 to n

#### Put Ai to i and keep swapping or change Ai index to negative
- keep swapping swap(num[i],num[num[i]]) until they are same
- result may be num[i] or index+1
- LeetCode 41 - First Missing Positive
- [LeetCode 442 - Find All Duplicates in an Array]
- [LeetCode 448 - Find All Numbers Disappeared in an Array](https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/discuss/93007/Simple-Java-In-place-sort-solution)
```java
public List<Integer> findDisappearedNumbers(int[] nums) {
    for (int i = 0; i < nums.length; i++) {
        while (nums[i] != nums[nums[i] - 1]) {
            int tmp = nums[i];
            nums[i] = nums[tmp - 1];
            nums[tmp - 1] = tmp;
        }
    }
    List<Integer> res = new ArrayList<Integer>();
    for (int i = 0; i < nums.length; i++) {
        if (nums[i] != i + 1) {
            res.add(i + 1);
        }
    }
    return res;
}
```
- [LeetCode 41 - First Missing Positive: O(1) space](https://leetcode.windliang.cc/leetCode-41-First-Missing-Positive.html)
  - [Put Ai to i and keep swapping](https://leetcode.com/problems/first-missing-positive/discuss/17071/My-short-c%2B%2B-solution-O(1)-space-and-O(n)-time)
  - [Change Ai index to negative](https://leetcode.com/problems/first-missing-positive/discuss/17073/Share-my-O(n)-time-O(1)-space-solution)
```java
int firstMissingPositive(int A[], int n)
{
  for(int i = 0; i < n; ++ i)
      while(A[i] > 0 && A[i] <= n && A[A[i] - 1] != A[i])
          swap(A[i], A[A[i] - 1]);

  for(int i = 0; i < n; ++ i)
      if(A[i] != i + 1)
          return i + 1;

  return n + 1;
}
public int firstMissingPositive(int[] nums) {
  int n = nums.length;
  int k = positiveNumber(nums);
  for (int i = 0; i < k; i++) {
      int index = Math.abs(nums[i]) - 1;
      if (index < k) {
          int temp = Math.abs(nums[index]);
          nums[index] = temp < 0 ? temp : -temp;
      }
  }
  for (int i = 0; i < k; i++) {
      if (nums[i] > 0) {
          return i + 1;
      }
  }
  return k + 1;
}
private int positiveNumber(int[] nums) {
    //解法二 用一个指针 p ，保证 p 之前的都是正数。遍历 nums，每遇到一个正数就把它交换到 p 指针的位置，并且 p 指针后移
    int n = nums.length;
    int p = 0;
    for (int i = 0; i < n; i++) {
        if (nums[i] > 0) {
            swap(nums, i, p);
            p++;
        }
    }
    return p;
}
```
- [LintCode 196 - Find the Missing Number I](https://www.kancloud.cn/kancloud/data-structure-and-algorithm-notes/73113)
```text
Given an array contains N numbers of 0 .. N, find which number doesn't exist in the array.
Example
Given N = 3 and the array [0, 1, 3], return 2.
```
  - [XOR](https://www.kancloud.cn/kancloud/data-structure-and-algorithm-notes/73113)
  - [Put Ai to i and keep swapping](https://zhengyang2015.gitbooks.io/lintcode/find_the_missing_number_196.html)

- [LeetCode 581 - Shortest Unsorted Continuous Subarray](https://leetcode.com/problems/shortest-unsorted-continuous-subarray/discuss/103066/Ideas-behind-the-O(n)-two-pass-and-one-pass-solutions)
  - sort or O(n)

- [LeetCode 330 - Patching Array](https://leetcode.com/problems/patching-array/discuss/78490/Share-my-greedy-solution-by-Java-with-simple-explanation-(time%3A-1-ms))
```java
public int minPatches(int[] nums, int n) {
    long max = 0;
    int cnt = 0, i = 0;
    while (max < n) {
        if (i >= nums.length || max < nums[i] - 1) {
            max += max + 1;
            cnt ++;
        } else {
            max += nums[i];
            i ++;
        }
    }        
    return cnt;
}
```

### substring of double string
- [LeetCode 459 - Repeated Substring Pattern](https://leetcode.com/problems/repeated-substring-pattern/discuss/94334/Easy-python-solution-with-explaination)
  - [kmp](https://www.jiuzhang.com/solutions/repeated-substring-pattern/)
```java
public boolean repeatedSubstringPattern(String str) {
  String s = str + str;
  return s.substring(1, s.length() - 1).contains(str);
}
```

### [Josephus problem](https://www.geeksforgeeks.org/josephus-problem-set-1-a-on-solution/)
- josephus(n, k) = (josephus(n - 1, k) + k-1) % n + 1 when starts with 1
- [LeetCode 390 - Elimination Game](https://leetcode.com/problems/elimination-game/discuss/87119/JAVA%3A-Easiest-solution-O(logN)-with-explanation)
```java
public int lastRemaining(int n) {
    boolean left = true;
    int remaining = n;
    int step = 1;
    int head = 1;
    while (remaining > 1) {
        if (left || remaining % 2 ==1) {
            head = head + step;
        }
        remaining = remaining / 2;
        step = step * 2;
        left = !left;
    }
    return head;
}
```

- [LeetCode 418 - Sentence Screen Fitting](http://www.cnblogs.com/grandyang/p/5975426.html)
```java
public int wordsTyping(String[] sentence, int rows, int cols) {
    String s = String.join(" ", sentence) + " ";
    int start = 0, l = s.length();
    for (int i = 0; i < rows; i++) {
        start += cols;
        if (s.charAt(start % l) == ' ') {
            start++;
        } else {
            while (start > 0 && s.charAt((start-1) % l) != ' ') {
                start--;
            }
        }
    }

    return start / s.length();
}
```
- [LeetCode 484 - Find Permutation](https://leetcode.com/articles/find-permutation/)
```java
public int[] findPermutation(String s) {
  int[] res = new int[s.length() + 1];
  for (int i = 0; i < res.length; i++)
    res[i] = i + 1;
  int i = 1;
  while (i <= s.length()) {
    int j = i;
    while (i <= s.length() && s.charAt(i - 1) == 'D')
      i++;
    reverse(res, j - 1, i);
    i++;
  }
  return res;
}
```
- [LeetCode 961 - N-Repeated Element in Size 2N Array](https://leetcode.com/problems/n-repeated-element-in-size-2n-array/discuss/208563/JavaC++Python-O(1)-Solution)
```java
public int repeatedNTimes(int[] A) {
    for (int i = 2; i < A.length; ++i)
        if (A[i] == A[i - 1] || A[i] == A[i - 2])
            return A[i];
    return A[0];
}
```