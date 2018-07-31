
### HyperLogLog
- an approximation of the number of unique elements in a set


### Counter-based algorithms: Frequent, LossyCounting, SpaceSaving

### MAJORITY algorithm (>1/2 or 1/k)
- Keep k different candidates in hand. For each item in stream: 
  – If item is monitored, increase its counter 
  – Else, if < k items monitored, add new item with count 1 
  – Else, decrease all counts by 1

Sketch algorithms: Count-Min Sketch, Count Sketch














