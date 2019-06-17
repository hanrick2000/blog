- [prime factors](https://www.vogella.com/tutorials/JavaAlgorithmsPrimeFactorization/article.html)
```java
public static List<Integer> primeFactors(int numbers) {
    int n = numbers;
    List<Integer> factors = new ArrayList<Integer>();
    for (int i = 2; i <= n / i; i++) {
        while (n % i == 0) {
            factors.add(i);
            n /= i;
        }
    }
    if (n > 1) {
        factors.add(n);
    }
    return factors;
}
```

- [Sieve of Eratosthenes: print all primes smaller than or equal to n](https://www.geeksforgeeks.org/sieve-of-eratosthenes/)
```java
boolean prime[] = new boolean[n+1]; 
for(int i=0;i<n;i++) 
    prime[i] = true; 
for(int p = 2; p*p <=n; p++) 
{ 
    // If prime[p] is not changed, then it is a prime 
    if(prime[p] == true) 
    { 
        // Update all multiples of p 
        for(int i = p*p; i <= n; i += p) 
            prime[i] = false; 
    } 
}
```

- [Codility  - Count Semiprimes](https://github.com/styro103/CountSemiprimes/blob/master/CountSemiPrimes.java)
```java
public int [] solution(int N, int [] P, int [] Q) 
{
    if (N<4) return new int [P.length]; //If Max Number is Less Than 4, Return Array of Zeroes (4 is First Semiprime)
int M = P.length; //Number of Queries
    int [] semiRanges = new int [M]; //Array of Semiprime Counts Between Ranges
    int [] semisCount = getSemis(N); //Get Count of Semiprimes of Each Number Up to Max
    for (int k=0; k<M; k++) //Loop Through Queries
        semiRanges[k] = (Q[k]<4) ? 0 : semisCount[Q[k]] - semisCount[P[k]-1]; //Subtract Counts to Get Semiprimes Count Between Range
    return semiRanges; //Return Array of Semiprimes Between Ranges
}
int [] getSemis(int N)
{
    int [] sieve = sifter(N); //Get Array of Minimum Prime Factors
    int [] rsc = new int [N+1]; //Array of Counts of Semiprimes
    int sc = 0; //Semiprimes Count
    for (int i=4; i<rsc.length; i++) //Loop From 4 To One More Than Max Number
    {
        if (sieve[i]!=0 && sieve[i/sieve[i]]==0) sc++; //If Semiprime, Increase Count
        rsc[i] = sc; //Set Count of Semiprimes at Integer
    }
    return rsc; //Return Array of Counts of Semiprimes
}
int [] sifter (int N) //Get Array of Minimum Prime Factors
{
    int [] sieve = new int [N+1]; //Array of Minimum Prime Factors
    for (int i=2; i<=Math.sqrt(N); i++) //Loop From 2 till Max Number
    {
        if (sieve[i]==0) //If Prime Number
        {
            for (int j=i*i; j<=N; j+=i) //Find All Multiples
                if (sieve[j]==0) sieve[j] = i; //If Prime Factor Isn't Listed, Update
        }
    }
    return sieve; //Return Array of Minimum Prime Factors
}
```

- [HARD LeetCode 952 - Largest Component Size by Common Factor](https://leetcode.com/articles/largest-component-size-by-common-factor/)
  - [union find](https://leetcode.com/problems/largest-component-size-by-common-factor/discuss/200959/Simplest-Solution-(Union-Find-only)-No-Prime-Calculation)
  - connect/union value with same factors
  - No need to store all index with same factor, only need one, others are union-ed together
```java
public int largestComponentSize(int[] A) {
    int N = A.length;
    Map<Integer, Integer> map = new HashMap<>();// key is the factor, val is the node index
    UF uf = new UF(N);
    for (int i = 0; i < N; i++){
        int a = A[i];
        for (int j = 2; j * j <= a; j++){
            if (a % j == 0){
                if (!map.containsKey(j)){//this means that no index has claimed the factor yet
                    map.put(j, i);
                }else{//this means that one index already claimed, so union that one with current
                    uf.union(i, map.get(j));
                }
                if (!map.containsKey(a/j)){
                    map.put(a/j, i);
                }else{
                    uf.union(i, map.get(a/j));
                }
            }
        }
        if (!map.containsKey(a)){//a could be factor too. Don't miss this
            map.put(a, i);
        }else{
            uf.union(i, map.get(a));
        }
    }
    return uf.max;
}
```

