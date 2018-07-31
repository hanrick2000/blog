- [Maximum sum of pairs with specific difference](https://www.geeksforgeeks.org/maximum-sum-pairs-specific-difference/)
  - Pair up i with (i-1)th element or not
  - dp[i] denotes the maximum disjoint pair sum we can achieve using first i elements
  - sort + greedy
```Java
static int maxSumPairWithDifferenceLessThanK(int arr[], 
                                           int N, int K) 
{ 
    Arrays.sort(arr); 
    int dp[] = new int[N]; 
    // if no element then dp value will be 0 
    dp[0] = 0; 
    for (int i = 1; i < N; i++) 
    { 
        dp[i] = dp[i-1]; 
        if (arr[i] - arr[i-1] < K) 
        { 
            // update dp[i] by choosing maximum between 
            // pairing and not pairing 
            if (i >= 2) 
                dp[i] = Math.max(dp[i], dp[i-2] + arr[i] + arr[i-1]); 
            else
                dp[i] = Math.max(dp[i], arr[i] + arr[i-1]); 
        } 
    } 
    return dp[N - 1]; 
} 
```






