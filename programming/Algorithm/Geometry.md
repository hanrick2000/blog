- left most point

- set(x + ":" + y)
- HashMap<Integer, HashSet<Integer>> xmap: all y for same x

- [check if two given line segments intersect](https://www.geeksforgeeks.org/check-if-two-given-line-segments-intersect/)
- 

- [LeetCode 391 - Perfect Rectangle](https://leetcode.com/problems/perfect-rectangle/discuss/87181/Really-Easy-Understanding-Solution(O(n)-Java))

- [@TODO LeetCode 812 - Largest Triangle Area](https://leetcode.com/problems/largest-triangle-area/discuss/122711/C%2B%2BJavaPython-Solution-with-Explanation-and-Prove)

- [LeetCode 223 - Rectangle Area](https://leetcode.com/problems/rectangle-area/discuss/62149/Just-another-short-way)
```java
int computeArea(int A, int B, int C, int D, int E, int F, int G, int H) {
    int left = max(A,E), right = max(min(C,G), left);
    int bottom = max(B,F), top = max(min(D,H), bottom);
    return (C-A)*(D-B) - (right-left)*(top-bottom) + (G-E)*(H-F);
}
```
- [LeetCode 939 - Minimum Area Rectangle](https://yeqiuquan.blogspot.com/2018/11/939-minimum-area-rectangle.html)
  - [O(N^4)](https://buptwc.com/2018/11/11/Leetcode-939-Minimum-Area-Rectangle/)
  - [O(N^2): try all 2 points as the diagonal](https://yeqiuquan.blogspot.com/2018/11/939-minimum-area-rectangle.html)
```java
public int minAreaRect(int[][] points) {
  int res = Integer.MAX_VALUE;
  HashMap<Integer, HashSet<Integer>> map = new HashMap<>();
  for (int[] point : points) {
    if (!map.containsKey(point[0])) {
      map.put(point[0], new HashSet<>());
    }
    map.get(point[0]).add(point[1]);
  }
  for (int[] pointA : points) {
    for (int[] pointB : points) {
      if (pointA[0] == pointB[0] || pointA[1] == pointB[1]) {
        continue;
      }
      if (!map.get(pointA[0]).contains(pointB[1]) || !map.get(pointB[0]).contains(pointA[1])) {
        continue;
      }
      res = Math.min(res, Math.abs((pointB[0] - pointA[0]) * (pointB[1] - pointA[1])));
    }
  }
  return res == Integer.MAX_VALUE ? 0 : res;
}
```

- [LeetCode 963 - Minimum Area Rectangle II](https://leetcode.com/articles/minimum-area-rectangle-ii/)
  - Given a set of points in the xy-plane, determine the minimum area of any rectangle formed from these points, with sides not necessarily parallel to the x and y axes.
  - [brute force: O(N^3)](http://www.programmersought.com/article/5527381097/)
  - [Iterate Diagonal Points](https://leetcode.com/articles/minimum-area-rectangle-ii/)
```java
public double minAreaFreeRect(int[][] points) {
  int N = points.length;
  Point[] A = new Point[N];
  for (int i = 0; i < N; ++i)
    A[i] = new Point(points[i][0], points[i][1]);
  Map<Integer, Map<Point, List<Point>>> seen = new HashMap<>();
  for (int i = 0; i < N; ++i)
    for (int j = i + 1; j < N; ++j) {
      // center is twice actual to keep integer precision
      Point center = new Point(A[i].x + A[j].x, A[i].y + A[j].y);

      int r2 = (A[i].x - A[j].x) * (A[i].x - A[j].x);
      r2 += (A[i].y - A[j].y) * (A[i].y - A[j].y);
      if (!seen.containsKey(r2))
        seen.put(r2, new HashMap<Point, List<Point>>());
      if (!seen.get(r2).containsKey(center))
        seen.get(r2).put(center, new ArrayList<Point>());
      seen.get(r2).get(center).add(A[i]);
    }
  double ans = Double.MAX_VALUE;
  for (Map<Point, List<Point>> info : seen.values()) {
    for (Point center : info.keySet()) { // center is twice actual
      List<Point> candidates = info.get(center);
      int clen = candidates.size();
      for (int i = 0; i < clen; ++i)
        for (int j = i + 1; j < clen; ++j) {
          Point P = candidates.get(i);
          Point Q = candidates.get(j);
          Point Q2 = new Point(center);
          Q2.translate(-Q.x, -Q.y);
          double area = P.distance(Q) * P.distance(Q2);
          if (area < ans)
            ans = area;
        }
    }
  }

  return ans < Double.MAX_VALUE ? ans : 0;
}
```