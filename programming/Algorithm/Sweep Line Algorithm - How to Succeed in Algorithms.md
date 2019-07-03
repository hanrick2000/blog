#### [How to Succeed in Algorithms Interview Series](https://lifelongprogrammer.blogspot.com/search/label/Algorithm Series){target="blank"}
<script src="https://lifelongprogrammer.blogspot.com/feeds/posts/default/-/Algorithm Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

#### Applications of Sweep Line Algorithm
- pre-sort (by x), so we can easily scan them
- or use TreeMap/TreeSet to store them
- calculate when meet open/end events
- Greedy
- Maintain max-end
- Maintain active sets
  - using TreeMap, sort by y (different criteria)

#### Examples of Sweep Line Algorithm
- [LeetCode 759 - Employee Free Time](https://zxi.mytechroad.com/blog/geometry/leetcode-759-employee-free-time/)
- [LeetCode 253 - Meeting Rooms II: find the minimum number of conference rooms required](https://www.jiuzhang.com/solutions/meeting-rooms-ii/)
```java
public int minMeetingRooms(Interval[] intervals) {
    if (intervals == null || intervals.length == 0) {
        return 0;
    }
    TreeMap<Integer, Integer> times = new TreeMap<>();
    for (Interval i : intervals) {
        times.put(i.start, times.getOrDefault(i.start, 0) + 1);
        times.put(i.end, times.getOrDefault(i.end, 0) - 1);
    }
    int count = 0, res = 0;
    for (int c : times.values()) {
        count += c;
        res = Math.max(res, count);
    }
    return res;
}
```
- [LeetCode 218 - The Skyline Problem: output the skyline formed by these buildings](https://codesolutiony.wordpress.com/2015/06/01/leetcode-the-skyline-problem-lintcode-building-outline/)
```java
public List<int[]> getSkyline(int[][] buildings) {
    List<int[]> heights = new ArrayList<>();
    for (int[] b: buildings) {
        heights.add(new int[]{b[0], - b[2]});
        heights.add(new int[]{b[1], b[2]});
    }
    Collections.sort(heights, (a, b) -> (a[0] == b[0]) ? a[1] - b[1] : a[0] - b[0]);
    TreeMap<Integer, Integer> heightMap = new TreeMap<>(Collections.reverseOrder());
    heightMap.put(0,1);
    int prevHeight = 0;
    List<int[]> skyLine = new LinkedList<>();
    for (int[] h: heights) {
        if (h[1] < 0) {
            Integer cnt = heightMap.get(-h[1]);
            cnt = ( cnt == null ) ? 1 : cnt + 1;
            heightMap.put(-h[1], cnt);
        } else {
            Integer cnt = heightMap.get(h[1]);
            if (cnt == 1) {
                heightMap.remove(h[1]);
            } else {
                heightMap.put(h[1], cnt - 1);
            }
        }
        int currHeight = heightMap.firstKey();
        if (prevHeight != currHeight) {
            skyLine.add(new int[]{h[0], currHeight});
            prevHeight = currHeight;
        }
    }
    return skyLine;
}
```
- [LeetCode 452 - Minimum Number of Arrows to Burst Balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/discuss/93703/Share-my-explained-Greedy-solution)
- Closest Pair of Points
  1. [Sweep Line](https://baptiste-wicht.com/posts/2010/04/closest-pair-of-point-plane-sweep-algorithm.html)
  2. [Divide and conquer](https://www.geeksforgeeks.org/closest-pair-of-points-using-divide-and-conquer-algorithm/)
  - We sort the list of points from left to right in the x axis
  - And then for each point :
    - We remove from the candidates all the point that are further in x axis that the current min distance
    - We take all the candidates that are located more or less current min distance from the current point in y axis
    - We test for the min distance all the founded candidates with the current point
    - And finally we add the current point to the list of candidates
- [Given n line segments, find if any two segments intersect](https://www.geeksforgeeks.org/given-a-set-of-line-segments-find-if-any-two-segments-intersect/)
  - active line segments (line segments for which left end point is seen, but right end point is not seen yet)
  - presort and TreeMap
- [Find count of overlapping rectangles](https://algs4.cs.princeton.edu/93intersection/IntervalIntersection.java.html)
- [LeetCode 850 - Rectangle Area II (Union Of Rectangles)](https://leetcode.com/articles/rectangle-area-ii/)
  - the active set contains only the rectangles which intersect the sweep line (rectangles whose left edges are visited but right edges are not)
  - <https://leetcode.com/problems/rectangle-area-ii/discuss/188832/Java-Line-Sweep-With-Sub-Class-Interval>
<img src='https://4.bp.blogspot.com/-hOf0MXmfv3U/XEAe3jD7hXI/AAAAAAAAUIU/taI2jjI2x0YixHshtKfyS6-ayXp9bWnnACLcBGAs/s640/12153052-27995daa57e94349a42362435b3d975c.jpg' />
- Convex Hull
  - [sweep line](https://www.hackerearth.com/practice/math/geometry/line-sweep-technique/tutorial/)

#### Resources
- [Line Sweep Technique](https://www.hackerearth.com/practice/math/geometry/line-sweep-technique/tutorial/)
- [Line Intersection using Bentley Ottmann Algorithm](https://www.hackerearth.com/practice/math/geometry/line-intersection-using-bentley-ottmann-algorithm/tutorial/)
