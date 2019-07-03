---
baseurl: https://lifelongprogrammer.blogspot.com/2018/08/java-sublist-tips-and-traps.html
---

#### How ArrayList.subList works
- ArrayList.subList returns one view from original list: it doesn't contain its own data at all, any change we made on subList will be reflected on original list.
- ArrayList.subList returns a different class: java.util.ArrayList$SubLists, so we can't cast it to ArrayList, otherwise ClassCastException will be thrown.
- the **parent** and `ArrayList.this`{.java} points to the original list.

##### Meaning of modCount
- From JavaDoc of `java.util.AbstractList.modCount`{.java}, we know that modCount only changes when we change the size of the list: like add/remove. Importantly `set(index, newValue)`{.java} doesn't change the modCount.

> The number of times this list has been structurally modified.
>
> Structural modifications are those that change the size of the list, or otherwise perturb it in such a fashion that iterations in progress may yield incorrect results.

- subList remembers the modCount at creation time, in methods like **get, size, add, remove**, it compares its modCount with the original list's modCount. If it changes, it would throws ConcurrentModificationException.

##### How subList is Implemented?
<details><summary>Source Code of Sublist</summary>
```java
public List<E> subList(int fromIndex, int toIndex) {
    subListRangeCheck(fromIndex, toIndex, size);
    return new SubList(this, 0, fromIndex, toIndex);
}
private class SubList extends AbstractList<E> implements RandomAccess {
    private final AbstractList<E> parent;
    private final int parentOffset;
    private final int offset;
    int size;
    SubList(AbstractList<E> parent,
            int offset, int fromIndex, int toIndex) {
        this.parent = parent;
        this.parentOffset = fromIndex;
        this.offset = offset + fromIndex;
        this.size = toIndex - fromIndex;
        this.modCount = ArrayList.this.modCount;
    }
    private void checkForComodification() {
        if (ArrayList.this.modCount != this.modCount)
            throw new ConcurrentModificationException();
    }    
    public E set(int index, E e) {
        rangeCheck(index);
        checkForComodification();
        E oldValue = ArrayList.this.elementData(offset + index);
        ArrayList.this.elementData[offset + index] = e;
        return oldValue;
    }
    public E get(int index) {
        rangeCheck(index);
        checkForComodification();
        return ArrayList.this.elementData(offset + index);
    }
    public void add(int index, E e) {
        rangeCheckForAdd(index);
        checkForComodification();
        parent.add(parentOffset + index, e);
        this.modCount = parent.modCount;
        this.size++;
    }
}
```
</details>
---

### The Dos and Don'ts of subList
Before test, we create an original ArrayList, and a subList like below:
```java
// actual type: ArrayList, [1, 10]
List<Integer> sourceList = IntStream.range(0, 10).mapToObj(Integer::valueOf).collect(Collectors.toList());
// [inclusive, exclusive), [1,2]
// actual type: java.util.ArrayList$SubLists
List<Integer> subList = sourceList.subList(1, 3);
```

#### It's Fine to Update Sublist
- Any change made at subList would be reflected on original list.
- In the following code, we change the subList: change its second element **value: 2** to 12, then remove the first element **value: 1**, add 100 at the end. All the changes are also reflected in the original lsit.
```java
// subList: [1,2), originalList:[0, 9]
subList.set(1, 12);
subList.remove(0);
subList.add(100);
// [12, 100]
System.out.println(subList);
// [0, 12, 100, 3 .. 9]
System.out.println(originalList);
```

##### What happen when we change the subList and modCount?
When we change the subList, the change is actually done at the sourceList where it also update modCount if needed (if the size changes); then modCount of subList updates accordingly.

```java
public E java.util.ArrayList.SubList.remove(int index) {
    rangeCheck(index);
    checkForComodification();
    E result = parent.remove(parentOffset + index);
    this.modCount = parent.modCount;
    this.size--;
    return result;
}
```

#### It's Fine to call Set in SourceList
- It's Fine to change the value of existing elements in the sourceList: if the element is inside the sublist range, the change would be also reflected to the subList.
- This is because `set(index, newValue)`{.java} doesn't change the modCount.
```java
// subList: [1,2), originalList:[0, 9]
// This changes the element in the subList
sourceList.set(1, -1);
// This changes the element outside of the subList
sourceList.set(9, -9);
// [-1, 2]
System.out.println(subList);
// [0, -1, 2, 3, 4, 5, 6, 7, 8, -9]
System.out.println(sourceList);
```

#### Don't Change Size of sourceList List While still Uses subList {.red}
- Don't change size of the sourceList (like add, remove) while still uses subList, as it would change the modCount of the sourceList.
- subList remembers the modCount at creation time, in methods like **get, size, add, remove**, it compares its modCount with the original list's modCount. If it changes, it would throws ConcurrentModificationException.
```java
// subList: [1,2), originalList:[0, 9]
sourceList.add(10);
// [0, ... 10]
System.out.println(sourceList);
// throws  java.util.ConcurrentModificationException
System.out.println(subList);
```

#### Don't Return a subList from a (Public) Method {.red}
As subLists points to the original list, as long as there is still an reference to the subList, java can't garbage collect the original list.

In the following code, we return a small subList of the original list, but as long as we still hold reference to the sublist, Java can't claim the resource used by the original list.
```java
public static List<Integer> returnSubListOfBigList() {
  List<Integer> sourceList = IntStream.range(0, 10000).mapToObj(Integer::valueOf).collect(Collectors.toList());
  return sourceList.subList(1, 3);
}
```
#### Don't add subList into cache {.red}
For the same reason, don't add subList into any long lived collection.

#### How to Return a sub range of list
If we need return a sub range of list from a method, it's better to create a new list:
```java
return new ArrayList<>(list.subList(inclusive, exclusive));
```

### Usage of subList
- Remove range from a list
  - we can't call `java.util.ArrayList.removeRange(int, int)` as it protected.
  - `list.subList(inclusive, exclusive).clear();`{.java} will do the trick.
- Right Rotate of a LinkedList
```java
public void rightRotate(LinkedList<Integer> list, int shift) {  
  Collections.reverse(list);
  Collections.reverse(list.subList(0, shift + 1));
  Collections.reverse(list.subList(shift + 1, list.size()));
}
```

### LinkedList.subList
We have talked about `ArrayList.subList`{.java}, but how about other Lists, especially LinkedList?

`java.util.AbstractList`{.java} provides default subList implementation: ArrayList overrides it and provides its own implementation; but LinkedList doesn't.

So `LinkedList.sublist`{.java} would use AbstractList.subList, and return `java.util.SubList`{.java}.

- The `java.util.SubList`{.java} is a class defined in AbstractList source file, but it's not an inner class of AbstractList.
java.util.AbstractList.subList(int, int)
- The `java.util.SubList`{.java} is still a just a view of the underlying LinkedList: get(the_index) method on the subList would take o(n) not O(1).
- When operate on a List, don't make assumption on the underlying type, don't use get if possible, use iterator instead.
```java
public List<E> java.util.AbstractList.subList(int fromIndex, int toIndex) {
    return (this instanceof RandomAccess ?
            new RandomAccessSubList<>(this, fromIndex, toIndex) :
            new SubList<>(this, fromIndex, toIndex));
}
```

##### Other Views in Java
There are some other views in java, like `Arrays.asList`{.java}, `Map.keySet()/values()`{.java}, `TreeMap.subMap`{.java} etc.

`Arrays.asList`{.java} is backed by one array, so there is no concept like modCount.

<details><summary>

#### The Complete Code
</summary>
```java
public class TestSubList {
	public static void main(String[] args) {
		// actual type: ArrayList, [1, 10]
		List<Integer> sourceList = IntStream.range(0, 10).mapToObj(Integer::valueOf).collect(Collectors.toList());
		// [inclusive, exclusive), [1,2]
		// actual type: java.util.ArrayList$SubLists
		List<Integer> subList = sourceList.subList(1, 3);
		System.out.println(sourceList);
		// [1,2]
		System.out.println(subList);
		// updateSubList(sourceList, subList);
		// setSourceList(sourceList, subList);
		// addRemoveSourceList(sourceList, subList);
		subListOfLinkedList();
		subList = returnSubListOfBigList();
		System.out.println(subList);
	}
	public static void subListOfLinkedList() {
		List<Integer> sourceList = IntStream.range(0, 10).mapToObj(Integer::valueOf).collect(Collectors.toCollection(LinkedList::new));
		// new LinkedList<>(Arrays.asList(1,2));
		// actual type: java.util.SubList
		List<Integer> subList = sourceList.subList(1, 3);
		System.out.println(subList);
	}
	public static List<Integer> returnSubListOfBigList() {
		List<Integer> sourceList = IntStream.range(0, 10000).mapToObj(Integer::valueOf).collect(Collectors.toList());
		return sourceList.subList(1, 3);
	}
	private static void addRemoveSourceList(List<Integer> sourceList, List<Integer> subList) {
		// subList: [1,2), originalList:[0, 9]
		sourceList.add(10);
		// [0, ... 10]
		System.out.println(sourceList);
		// throws java.util.ConcurrentModificationException
		System.out.println(subList);
	}
	private static void setSourceList(List<Integer> sourceList, List<Integer> subList) {
		// subList: [1,2), originalList:[0, 9]
		// This changes the element in the subList
		sourceList.set(1, -1);
		// This changes the element outside of the subList
		sourceList.set(9, -9);
		// [-1, 2]
		System.out.println(subList);
		// [0, -1, 2, 3, 4, 5, 6, 7, 8, -9]
		System.out.println(sourceList);
	}
	private static void updateSubList(List<Integer> sourceList, List<Integer> subList) {
		subList.set(1, 12);
		subList.remove(0);
		subList.add(100);
		// [12, 100]
		System.out.println(subList);
		// [0, 12, 100, 3 .. 9]
		System.out.println(sourceList);
	}
}
```
<details>
---
