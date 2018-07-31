#### MySQL
- Regular Lock
- Share Locks
- eXclusive Locks

- [Auto-inc Locks](http://www.10tiao.com/html/249/201808/2651961455/1.html)
  - An AUTO-INC lock is a special table-level lock taken by transactions inserting into tables with AUTO_INCREMENT columns. In the simplest case, if one transaction is inserting values into the table, any other transactions must wait to do their own inserts into that table, so that rows inserted by the first transaction receive consecutive primary key values. 
- [Intention Locks](http://www.10tiao.com/html/249/201808/2651961461/1.html)
  - intention shared lock, IS
  - intention exclusive lock, IX
  - Insert Intention Locks
    - Insert Intention Lock signals the intent to insert in such a way that multiple transactions inserting into the same index gap need not wait for each other if they are not inserting at the same position within the gap.a
- Record Locks
  - select for for update
- Gap Locks

- Multi Versioning

- Redo log
- Undo log

- Multi Version Concurrency Control, MVCC

- Clustered Index
  - Primary key -> the first unique key -> hidden row-id
- Secondary Index


