#### Implementation
- return value is what we need
- boundary check
- give meaningful variable name, not i, j

### Recursion
- base cases
- backtrack: remove

- base values in data structure
  - [LeetCode - 403 Frog Jump](https://leetcode.com/problems/frog-jump/discuss/88824/very-easy-to-understand-java-solution-with-explanations)

### Common Bugs
- array len: n or n+1
- < or <=
- i%j or j%i

```java
map.put(x,map.getOrDefault(x,0)+1);
```

### Dummy Node
- LinkedList
- [LeetCode 23 - Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/discuss/10809/13-lines-in-Java)
  - [PriorityQueue](https://leetcode.com/problems/merge-k-sorted-lists/discuss/10809/13-lines-in-Java)
  - [Divide and Conquer](https://leetcode.com/problems/merge-k-sorted-lists/discuss/11010/A-solution-use-divide-and-conquer-algorithm-in-java)

### Number
- overflow
- change negative to positive
- [LeetCode 29 - Divide Two Integers](https://www.jiuzhang.com/solution/divide-two-integers/)
  - [iterative version](https://www.programcreek.com/2014/05/leetcode-divide-two-integers-java/)
  - [Recursion](https://leetcode.com/problems/divide-two-integers/discuss/13422/Accepted-Java-solution-with-comments.)
```java
public int divide(int dividend, int divisor) {
    if(divisor==0) return Integer.MAX_VALUE; // throw ex;
    if(divisor==-1 && dividend == Integer.MIN_VALUE)
        return Integer.MAX_VALUE; // or return min_value
    long pDividend = Math.abs((long)dividend);
    long pDivisor = Math.abs((long)divisor);
    int result = 0;
    while(pDividend>=pDivisor){
        int numShift = 0;    
        while(pDividend>=(pDivisor<<numShift)){
            numShift++;
        }
        result += 1<<(numShift-1);
        pDividend -= (pDivisor<<(numShift-1));
    }
    if((dividend>0 && divisor>0) || (dividend<0 && divisor<0)){
        return result;
    }else{
        return -result;
    }
}
```

- [LeetCode 65 - Valid Number](https://leetcode.com/problems/valid-number/discuss/23738/Clear-Java-solution-with-ifs)
```java
public boolean isNumber(String s) {
    s = s.trim();    
    boolean pointSeen = false;
    boolean eSeen = false;
    boolean numberSeen = false;
    boolean numberAfterE = true;
    for(int i=0; i<s.length(); i++) {
        if('0' <= s.charAt(i) && s.charAt(i) <= '9') {
            numberSeen = true;
            numberAfterE = true;
        } else if(s.charAt(i) == '.') {
            if(eSeen || pointSeen) {
                return false;
            }
            pointSeen = true;
        } else if(s.charAt(i) == 'e') {
            if(eSeen || !numberSeen) {
                return false;
            }
            numberAfterE = false;
            eSeen = true;
        } else if(s.charAt(i) == '-' || s.charAt(i) == '+') {
            if(i != 0 && s.charAt(i-1) != 'e') {
                return false;
            }
        } else {
            return false;
        }
    }
    return numberSeen && numberAfterE;
}
```

- [LeetCode 8 - String to Integer (atoi)](http://www.cnblogs.com/grandyang/p/4125537.html)
```java
public int myAtoi(String str) {
    if (str.isEmpty()) return 0;
    int sign = 1, base = 0, i = 0, n = str.length();
    while (i < n && str.charAt(i) == ' ') ++i;
    if (i < n && (str.charAt(i) == '+' || str.charAt(i) == '-')) {
        sign = (str.charAt(i++) == '+') ? 1 : -1;
    }
    while (i < n && str.charAt(i) >= '0' && str.charAt(i) <= '9') {
        if (base > Integer.MAX_VALUE / 10 || (base == Integer.MAX_VALUE / 10 && str.charAt(i) - '0' > 7)) {
            return (sign == 1) ? Integer.MAX_VALUE : Integer.MIN_VALUE;
        }
        base = 10 * base + (str.charAt(i++) - '0');
    }
    return base * sign;
}
```


- [LeetCode 468 - Validate IP Address](https://leetcode.com/problems/validate-ip-address/discuss/95491/Java-Simple-Solution)
```java
public String validIPAddress(String IP) {
	if(isValidIPv4(IP)) return "IPv4";
	else if(isValidIPv6(IP)) return "IPv6";
	else return "Neither";
}

public boolean isValidIPv4(String ip) {
	if(ip.length()<7) return false;
	if(ip.charAt(0)=='.') return false;
	if(ip.charAt(ip.length()-1)=='.') return false;
	String[] tokens = ip.split("\\.");
	if(tokens.length!=4) return false;
	for(String token:tokens) {
		if(!isValidIPv4Token(token)) return false;
	}
	return true;
}
public boolean isValidIPv4Token(String token) {
	if(token.startsWith("0") && token.length()>1) return false;
	try {
		int parsedInt = Integer.parseInt(token);
		if(parsedInt<0 || parsedInt>255) return false;
		if(parsedInt==0 && token.charAt(0)!='0') return false;
	} catch(NumberFormatException nfe) {
		return false;
	}
	return true;
}
	
public boolean isValidIPv6(String ip) {
	if(ip.length()<15) return false;
	if(ip.charAt(0)==':') return false;
	if(ip.charAt(ip.length()-1)==':') return false;
	String[] tokens = ip.split(":");
	if(tokens.length!=8) return false;
	for(String token: tokens) {
		if(!isValidIPv6Token(token)) return false;
	}
	return true;
}
public boolean isValidIPv6Token(String token) {
	if(token.length()>4 || token.length()==0) return false;
	char[] chars = token.toCharArray();
	for(char c:chars) {
		boolean isDigit = c>=48 && c<=57;
		boolean isUppercaseAF = c>=65 && c<=70;
		boolean isLowerCaseAF = c>=97 && c<=102;
		if(!(isDigit || isUppercaseAF || isLowerCaseAF)) 
			return false;
	}
	return true;
}
```

- [LeetCode 43 - Multiply Strings](https://leetcode.com/problems/multiply-strings/discuss/17605/Easiest-JAVA-Solution-with-Graph-Explanation)
```java
// https://blog.csdn.net/mine_song/article/details/70482898
public String multiply(String num1, String num2) {
  if (num1.equals("0") || num2.equals("0"))
    return "0";
  int n1 = num1.length();
  int n2 = num2.length();
  int[] products = new int[n1 + n2];
  for (int i = n1 - 1; i >= 0; i--) {
    for (int j = n2 - 1; j >= 0; j--) {
      products[i + j + 1] += ((int) num1.charAt(i) - '0') * ((int) num2.charAt(j) - '0');
    }
  }
  int carry = 0;
  StringBuilder sb = new StringBuilder();
  for (int i = n1 + n2 - 1; i >= 0; i--) {
    int tmp = products[i] + carry;
    sb.append(tmp % 10);
    carry = tmp / 10;
  }
  sb.reverse();
  if (sb.charAt(0) == '0')
    sb.deleteCharAt(0);
  return sb.toString();
}
public String multiply(String num1, String num2) {
    int m = num1.length(), n = num2.length();
    int[] pos = new int[m + n];   
    for(int i = m - 1; i >= 0; i--) {
        for(int j = n - 1; j >= 0; j--) {
            int mul = (num1.charAt(i) - '0') * (num2.charAt(j) - '0'); 
            int p1 = i + j, p2 = i + j + 1;
            int sum = mul + pos[p2];

            pos[p1] += sum / 10;
            pos[p2] = (sum) % 10;
        }
    }      
    StringBuilder sb = new StringBuilder();
    for(int p : pos) if(!(sb.length() == 0 && p == 0)) sb.append(p);
    return sb.length() == 0 ? "0" : sb.toString();
}
```
- [CSV Parser - Airbnb](https://github.com/allaboutjst/airbnb/blob/master/src/main/java/csv_parser/CSVParser.java)
```java
public String parseCSV(String str) {
    List<String> res = new ArrayList<>();
    boolean inQuote = false;
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < str.length(); i++) {
        if (inQuote) {
            if (str.charAt(i) == '\"') {
                if (i < str.length() - 1 && str.charAt(i + 1) == '\"') {
                    sb.append("\"");
                    i++;
                } else {
                    inQuote = false;
                }
            } else {
                sb.append(str.charAt(i));
            }
        } else {
            if (str.charAt(i) == '\"') {
                inQuote = true;
            } else if (str.charAt(i) == ',') {
                res.add(sb.toString());
                sb.setLength(0);
            } else {
                sb.append(str.charAt(i));
            }
        }
    }
    if (sb.length() > 0) {
        res.add(sb.toString());
    }
    return String.join("|", res);
}
```

- [LeetCode 755 - Pour Water](https://www.jianshu.com/p/5f092d7850ce)
```java
public int[] pourWater(int[] heights, int V, int K) {
    for (int i = 0; i < V; i++) {
        int minLeft = findLeftMin(K, heights);
        if (minLeft != K) {
            heights[minLeft]++;
        } else {
            int rightMin = findRightMin(K, heights);
            if (rightMin != K) {
                heights[rightMin]++;
            } else {
                heights[K]++;
            }
        }
    }
    return heights;
}
private int findRightMin(int k, int[] heights) {
    int index = k;
    for (int i = k + 1; i < heights.length; i++) {
        if (heights[i] < heights[index]) {
            index = i;
        } else if (heights[i] > heights[index]) {
            break;
        }
    }
    return index;
}
private int findLeftMin(int k, int[] heights) {
    int index = k;
    for (int i = k - 1; i >= 0; i--) {
        if (heights[i] < heights[index]) {
            index = i;
        } else if (heights[i] > heights[index]) {
            break;
        }
    }
    return index;
}
```
### Overflow
- promote int to long

### Define input and output
- when you can define input and output
  - Explain it to the interviewer why you choose them
- Choose class/data structures with powerful API
  - StringBuilder vs List
- Immutable
  - Don't return input directly if the input is mutable
  - clone it
- Don't return null
  - return empty list (implement it in the code not just talk it)
- big add
  - input: String vs List<Integer>
  - return String vs List<Integer>

### eps(epsilon)
- when related with float, double

