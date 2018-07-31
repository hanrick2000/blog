- String.equals -> compare reference -> check type(anObject instanceof String) -> compare length -> compare chars one by one
- "abc" is in the constant pool.

### StringBuilder
- [StringBuffer is mutable, and its primary use is for constructing strings](https://stackoverflow.com/questions/11112602/why-does-stringbuffer-stringbuilder-not-override-equals-or-hashcode)
- StringBuilder does not override Object's .equals(), hashcode
- we can't compare string and StringBuilder directly


