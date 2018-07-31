- Consistent Hashing
  - Virtual nodes for each server
- Vector Clock
  - [node,counter]
<img src='http://www.raychase.net/wp-content/uploads/2014/04/image_thumb2.png' />

- W+R>N
- Sloppy Quorum
- Hinted Handoff

<!-- Dynamo最后的实现，让用户来解决冲突的做法（有时候用户也没法确定该用哪个版本），确实有些别扭；而采用绝对时间来解决冲突的方法，则是在机制上有天生的缺陷（时间无法做到绝对同步 -->