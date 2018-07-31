#### TreeMap/TreeSet
```java
//[From](https://leetcode.com/problems/falling-squares/discuss/112678/Treemap-solution-and-Segment-tree-(Java)-solution-with-lazy-propagation-and-coordinates-compression)
Integer from = treeMap.floorKey(start);
int height = treeMap.subMap(from, end).values().stream().max(Integer::compare).get();
// remove interval within [start, end)
int lastHeight = treeMap.floorEntry(end).getValue();
treeMap.put(start, height);
treeMap.put(end, lastHeight);
treeMap.keySet().removeAll(new HashSet<>(treeMap.subMap(start, false, end, false).keySet()));

//<=, >=
treeset.floor()/ceilling()
// <, >
treeset.lower()/higher()

treemap.floorEntry()/floorKey(), ceillingEntry()/ceillingKey()
// <, >
treemap.lowerEntry()/lowerKey(), higherEntry()/higherKey()
```

#### ArrayDeque
- As stack or queue:
```java
peekLast, addLast, removeLast, pollLast
peekFirst, addFirst, removeFirst, pollFirst
```
- its default iterator or stream is a queue: fifo
- Use iterator, for loop to access it, but not support random access like get(i)

#### Stream
```java
// convert map to map

map.forEach((s, integer) ->  map2.put(s, integer));
map.forEach(map2::put);

Map<String, Integer> map2 =
    map.entrySet().stream().collect(Collectors.toMap(
            e -> e.getKey(),e -> Integer.parseInt(e.getValue())
        ));

// Array to set
Arrays.stream(wrapperArray).collect(Collectors.toSet())
Arrays.stream(primitiveArray).boxed().collect(Collectors.toSet())
// to TreeSet
strStream.collect(Collectors.toCollection(TreeSet::new))

// Collectors
.collect(Collectors.joining( "," ))

count.put(word, count.getOrDefault(word, 0) + 1);
// computeIfAbsent returns latest value, prefer this over putIfAbsent
map.computeIfAbsent(key, k -> new PriorityQueue()).add(value);

// iterate
Stream.iterate(wordsSize - 1, li -> li - 1).limit(wordsSize);
Stream.iterate(1, i -> i <= 3, i -> i + 1)

Map<String, Long> counted = list.stream()
  .collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));

Map<Character, Long>  astring.chars().mapToObj(ch -> (char) ch)
  .collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));
```

```java
/* char[] to Stream */
Stream<Character> stream = CharBuffer.wrap(list).chars().mapToObj(ch -> (char)ch);

IntStream intStream = Arrays.stream(new int[] {});

/* int[] to Stream<Integer> */
Stream<Integer> i = Arrays.stream(new int[] {}).boxed();

/* IntStream to int[]*/
int[] array = intStream.mapToInt(i->i).toArray();

Stream.of(int1, int2, ...).min(Integer::compare).get();
```

#### Optional
```java
optional.ifPresentOrElse(action, emptyAction)
```
[Avoid null check](http://winterbe.com/posts/2015/03/15/avoid-null-checks-in-java/)
```java
Optional.of(new Outer())
    .map(Outer::getNested)
    .map(Nested::getInner)
    .map(Inner::getFoo)
    .ifPresent(System.out::println);
```
- [Reference](http://www.deadcoderising.com/2017-02-21-java-8-accumulate-your-streams-using-collectors/)
```java
// UnModifiable collection
List.of(1, 2)
List.copyOf(aList)
Set.of(1, 2)
Map.of("k1", "v1")
IntStream.range(1, 10)
IntStream.rangeClosed(1, 10)
IntStream.iterate(0, x -> x < 3, x -> x + 1)

IntStream
.max/min/average.getAsInt()
.sum

Stream<Integer>
.collect(Collectors.averagingInt(i -> i))

.averagingInt
.min(max)By(comparator)
.joining(delimiter,prefix,suffix)
.partitioningBy(predicate)

articles.collect(  
  Collectors.groupingBy(
    Article::getTag,
    Collectors.summingInt(Article::getWordCount)));

// Convert list of Character to String
listCharacter.stream().map(String::valueOf).collect(Collectors.joining());    
```
#### Collection
```java
list.removeIf(i -> i == 2); //Predicate
```

#### Misc
```java
String.join(delimiter, elements);
new StringBuilder(word).reverse().toString()
/* number to char array */
char[] array = String.valueOf(number).toCharArray();

/* char[] to number, work with prefix 0 like 01 */
Integer.parseInt(new String(charArray))

Arrays.fill(array, fromIndex, toIndex, val)

Comparator.naturalOrder()/reverseOrder()

Optional<Integer> max = list.stream().max(Comparator.naturalOrder());

Optional<Integer> max = list.stream().reduce(Integer::max);

/*remove multiple keys from Map*/
map.keySet().removeAll(set);

/* [][] to List<List<>> */
List<List<String>> r = Arrays.stream([][]).map(s -> Arrays.stream(s)
  .collect(Collectors.toList())).collect(Collectors.toList())

// Get max from Map<Integer, Map<Integer, Integer>>
map.values().stream().flatMap(tmp ->tmp.values().stream())
  .max(Comparator.naturalOrder()).get()

new random.ints(streamSize, randomNumberOrigin, randomNumberBound)

Collections.reverse(collection);
// array head, tail pointer
int j = s.length() - 1 - i;

javafx.util.pair pair = new new Pair<>(key, value);
Map.entry entry = Map.entry(key, value)


Character.isLetter/isWhitespace

// [deepToString() works for both single and multidimensional, but doesn’t work single dimensional array of primitives](https://www.geeksforgeeks.org/arrays-deeptostring-in-java-with-example/)
Arrays.deepToString(array)/toString(array)

String bits = Integer.toBinaryString(n);
Integer.bitCount(n)

ManagementFactory.getGarbageCollectorMXBeans()
```