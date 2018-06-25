#### PriorityQueue
- Its iterator or stream method doesn't return the elements in any particular order.
    - because the way it stores data, have to change the data to get next element and iterator is not supposed to change the data

### hashCode and equals
- Arrays inherit equals(Object) and hashCode() implementations from java.lang.Object, and they are based on object identity, not array contents
- StringBuilder is mutable and does not override the equals, hashcode
- **So don't use them as the map's key**

### Varargs only works with reference types (https://stackoverflow.com/questions/2925153/can-i-pass-an-array-as-arguments-to-a-method-with-variable-arguments-in-java/2926653)

#### Primitive Arrays
- doesn't work with Varargs
    - Arrays.asList
- is not an object array
```java
// Primitive Arrays is not an object array
int[] ints = new int[] { 0, 1 };
// this will not work
Object[] o = (Object[])ints;

// Primitive Arrays doesn't work with Varargs,
// return 1 not 2
Arrays.asList(ints).size()

// not work: java.lang.ArrayIndexOutOfBoundsException: 1, colleciton size is
// only 1
Collections.swap(Arrays.asList(ints), 0, 1)
```

#### Stream
- Can only use effective final variables inside stream

#### Misc
```java
// Cannot cast from Long to int, auto (un)box and cast don't work together
Long al =1l; int i =(int)al;

// The method add(Long) in the type PriorityQueue<Long> is not applicable for the arguments
PriorityQueue<Long> pq = new PriorityQueue<>(); pq.add(1);
```