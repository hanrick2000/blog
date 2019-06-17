#### What's Autoboxing
- Autoboxing is just syntactic sugar to convert a primitive value into an object of the corresponding wrapper class.
- Example: `Integer i = 2;`{.java} is actually equivalent to `Integer i = Integer.valueOf(2);`

#### What's Unboxing
- Unboxing is also just syntactic sugar to convert an object of a wrapper type to its corresponding primitive value
- Example: `int i = new Integer(1);`{.java} is actually equivalent to `int i = new Integer(1).intValue();`{.java}

#### When Autoboxing/unboxing Happens
- Passed as a primitive type into a method that accepts a wrapper type or vice versa.
- Assigned a primitive type to a variable of wrapper type or vice versa.
- To use them in generics
  - Java generic types only accepts objects, so when we add primitive types into the collection, autoboxing happens, when `int i=list.get(0);`{.java}, unboxing happens.
- `++ or --` on a wrapper instance.
- Mix primitive and wrapper relational or equality operator
```java
Map<String, Boolean> map = new HashMap<>();
// unboxing: map.get(key).booleanValue();
if(map.get(key)) {}

Integer i;
// unbox
if(i < 0) {}
```

#### Always use Objects.equals instead of == to compare wrapper class
- From [javadoc](https://docs.oracle.com/javase/8/docs/api/?java/lang/Integer.html)
  > This method will always cache values in the range -128 to 127, inclusive, and may cache other values outside of this range
<!-- - `Integer.valueOf("127")==Integer.valueOf("127"))`{.java} returns true.
- `Integer.valueOf("128")==Integer.valueOf("128"))`{.java} returns false. -->
```java
Integer a = 127, b = 127;
// true
System.out.println(a==b);


a = 128; b = 128;
// false
System.out.println(a==b);
```

#### [Unboxing and NullPointerException](https://lifelongprogrammer.blogspot.com/2019/06/how-to-avoid-null-pointer-exception-in-java.html){target="blank"}
- Read more about [how to avoid NullPointerException in java](https://lifelongprogrammer.blogspot.com/2019/06/how-to-avoid-null-pointer-exception-in-java.html){target="blank"}

When mix wrapper class and primitive type, Java will auto unbox the wrapper class to primitive type(**boolean**, int, long, etc), if the wrapper class is Null, then it would throw NullPointerException.

```java
Map<String, Boolean> map = new HashMap<>();
if (map.get(key)) {}
```

In the above code, when map doesn't contain the key, or its value is null, it would throw NullPointerException. One fix is to use `Objects.equals`{.java}

#### Widening or Boxing, but not both
- `Long l = 0;` will not compile: `Type mismatch: cannot convert from int to Long`{.red}
- s 0 is an int, java **doesn't** first widen it to long, then autobox it to Long.

#### Some Puzzles
```java
Long l = 0L;
System.out.println(l.equals(0L)); // true
// false
// Eclipse warning: Unlikely argument type for equals(): int seems to be
// unrelated to Long
System.out.println(l.equals(0)); // false
System.out.println(l == 0); // true

l = 128L;
System.out.println(128 == 128); // true
```
- in `l.equals(0)`{.java}, 0 is autoboxed to Integer then compared with Long l.
> The result is true if and only if the argument is not null and is a Long object that contains the same long value as this object

```java
public boolean java.lang.Long.equals(Object obj) {
    if (obj instanceof Long) {
        return value == ((Long)obj).longValue();
    }
    return false;
}
```
- in `l == 0`{.java}, Long l is first unboxed to long, then we are compare two primitive types, so it returns true.

#### No Widen for wrapper type
- The following code will not compile: `Type mismatch: cannot convert from Integer to Long`{.red}
```java
Integer i = 0;
// Compare error: Type mismatch: cannot convert from Integer to Long
Long l = i;
```
- Integer and Long is not direct related (no parent, child relation), so there is no way to convert from Integer to Long/
- Java first unbox the Integer to an int, then widen it to a long.
```java
public static void f(long l) {
  System.out.println("flong called");
}
public static void f(Long l) {
  System.out.println("fLong called");
}
Integer i = 0;
// print: flong called
f(i);
```


#### Widening takes priority than boxing
- Auto widening transforms a variable to another with a wider type: from int to long etc.
- It's just a syntactic sugaring: `(long)the_int_value`;
- Auto widening is easier and costs less than boxing.

#### Boxing takes priority than Varargs
- Varargs is just a syntactic sugaring on top of arrays: javac has to create an array to wrap the parameters.
- Boxing is easier and costs less than Varargs.

#### [Varargs gotchas: passing an array of primitives](https://stackoverflow.com/questions/2925153/can-i-pass-an-array-as-arguments-to-a-method-with-variable-arguments-in-java/2926653)
```java
public static String ezFormat(Object... args) {
  String format = new String(new char[args.length]).replace("\0", "[ %s ]");
  return String.format(format, args);
}

int[] myNumbers = { 1, 2, 3 };
// [ [I@7852e922 ]
System.out.println(ezFormat(myNumbers));

// [ [I@4e25154f ]
System.out.println(ezFormat(new int[] { 1, 2, 3 }));
```

#### Performance Hit
- Frequent autoboxing and unboxing will create unnecessary objects.