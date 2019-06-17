### lambda
- [no unique identity](http://www.lambdafaq.org/are-lambda-expressions-objects/)
- [Can only use effectively final in lambda] (http://www.lambdafaq.org/what-are-the-reasons-for-the-restriction-to-effective-immutability/)

###### No field reference

##### binarySearch
- If the range contains multiple elements with the specified value, there is no guarantee which one will be found.
- range of insertion point: [0, size]

#### TreeSet, TreeMap
- [subSet()/headSet()/tailSet() are O(1), but subSet().size is O(k)](https://stackoverflow.com/questions/34427758/treeset-number-of-elements-less-than-a-value-efficiently)

##### Comparable vs Comparator
- Comparable is used in domain class to implement natural order
- Comparator is used to create external different class to compare.
- Same for Iterator and Iterable
```java
// chained comparing
return Comparator.thenComparingInt(Pos::getRow).thenComparingInt(Pos::getCol).compare(this, other);
naturalOrder()/reverseOrder()/comparingInt()
Comparator.comparingInt(String::length).reversed()

// From [stackoverflow](ttps://stackoverflow.com/questions/43826619/arrays-sort-with-lambda-and-thencomparing)
Comparator.comparing(Person::getName).reversed()
          .thenComparingInt(Person::getAge)
          .thenComparing(Comparator.comparingInt(Person::getComputers).reversed())
          .thenComparingDouble(Person::getSalary)
```

##### [Order of ternary operator is very low, always use parentheses](https://stackoverflow.com/questions/11686398/conditional-operator-in-concatenated-string)

#### Misc
```java
// immutable pair
javafx.util.Pair
Map.entry(key, value) // in java 9
```
