
- [Github Repo](https://github.com/alibaba/p3c)
- [Install Eclipse plugin](https://github.com/alibaba/p3c/tree/master/eclipse-plugin)
- [P3C-PMD](https://github.com/alibaba/p3c/tree/master/p3c-pmd)
- [Alibaba Java Coding Guidelines](https://alibaba.github.io/Alibaba-Java-Coding-Guidelines/)

#### OOP Rules
8. [Mandatory] Rules for using primitive data types and wrapper classes:
  1) Members of a POJO class must be wrapper classes.
  2) The return value and arguments of a RPC method must be wrapper classes.
  3) [Recommended] Local variables should be primitive data types.
  Note: In order to remind the consumer of explicit assignments, there are no initial values for members in a POJO class. As a consumer, you should check problems such as NullPointerException and warehouse entries for yourself.
  Positive example: As the result of a database query may be null, assigning it to a primitive date type will cause a risk of NullPointerException because of autoboxing.
  Counter example: Consider the output of a transaction volume’s amplitude, like ±x%. As a primitive data, when it comes to a failure of calling a RPC service, the default return value: 0% will be assigned, which is not correct. A hyphen like - should be assigned instead. Therefore, the null value of a wrapper class can represent additional information, such as a failure of calling a RPC service, an abnormal exit, etc.



8. [Mandatory] Do not add ‘is’ as prefix while defining Boolean variable, since it may cause a serialization exception in some Java frameworks.

Counter example:
boolean isSuccess; The method name will be isSuccess() and then RPC framework will deduce the variable name as ‘success’, resulting in a serialization error since it cannot find the correct attribute.

- If the variable name is isSuccess, Gson will serialize it as: `{"isSuccess":true}`{.json}, but jackson, fastjson will serialize it as: `{"success":true}`{.json}

9. [Mandatory] Do not remove or add elements to a collection in a foreach loop. Please use Iterator to remove an item. Iterator object should be synchronized when executing concurrent operations.

- The For each loop is just a syntactic sugar for the Iterator. counterExampleRemoveInIterator and counterExampleRemoveInFoorLoop are equivalent.

```java
public boolean hasNext() {
    return cursor != size;
}
```
- If we remove 1, after the removal, the size would be 1, cursor is also 1, so it doesn't iterate the second element at all.
- If we remove 2, after the removal, the size would be 1, cursor is 2, so hasNext returns true, then `checkForComodification()`{.java} in `java.util.ArrayList.Itr.next()`{.java} would throw ConcurrentModificationException.

```java
public static void main(String[] args) {
	List<String> a = new ArrayList<String>();
	a.add("1");
	a.add("2");
	String toRemove = "1";
	// if toRemove = "2";, it would throw ConcurrentModificationException
	counterExampleRemoveInFoorLoop(a, toRemove);
	counterExampleRemoveInIterator(a, toRemove);
}

private static void counterExampleRemoveInFoorLoop(List<String> list, String toRemove) {
	for (String temp : list) {
		if (Objects.equals(temp, toRemove)) {
			list.remove(temp);
		}
	}
}

private static void counterExampleRemoveInIterator(List<String> list, String toRemove) {
	Iterator<String> it = list.iterator();
	do {
		if (!it.hasNext())
			break;
		String temp = it.next();
		if (Objects.equals(temp, toRemove)) {
			list.remove(temp);
		}

	} while (true);
}
```

<!-- https://pan.baidu.com/s/1_AxBPEUQIWGfwj7K9MAWXg -->