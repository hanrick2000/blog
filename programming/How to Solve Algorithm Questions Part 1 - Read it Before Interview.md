Ask how many questions the will ask

#### Clarify the questions
- Take time to draw some examples to understand the question
    - all different cases, extreme cases
- Ask the range of input
- Duplicate in the data
- Whether I can change/reuse the input
- **Ask whether I have used all useful info, whether I missed anything**

#### Write down (different) examples
- To make sure you understand the problem
- help find solution
- when write code later, check the examples

#### When Write code
- Extract some functions aggressively
    - This can save you time and space, otherwise you may repeat same code multiple times
    - Focus the main part first, define what parameters it needs
    - Leave the implementation later, interviewer may just ignore it
- Add //TODO tag where the code may be trick or error prone
- **What states, variables we need**
- What's the meaning of the (important) variables, return value and write them down
- **How do we change them**
- What the initial value should be? 0, min_value, max_value, (-)input[i];
- Leave some spaces (where you think you may need add some code later, and if the white board is big)
- **Choose the safe and simpler approaches**
    - Defensive programming (especially in code interview): check index valid
    - prefer bfs (easier to code) vs dfs, prefer dp vs dfs+cache
    - fori vs forvar loop
    - separate the specific case (when i=0, j=0)
    - Based on size of the n, choose simpler approaches
        - if n is very small, N^2 and nlogn doesn't make difference
#### Recheck the code carefully
- Check the change of variables, states, whether miss any: like next=cur.next
- Check return value
- Check what variables(known conditions) have not been used
- First focus on the main logic and error-prone part
- Also check all code
- Use different (simple) use cases to find the problem in the code/algorithm

#### Compare different approaches
- Always think whether there are better approaches (and say it)
- The different approaches may be easier to code or have better runtime (or space) complexity
- When you think you can implement it different ways or have different approaches, make sure it works and you choose the one that's easier to implement
    - Sometimes, the other approach may be not work

#### Quickly mention other approaches
#### Different approaches for different API usage pattern
#### Talk about the time and space complexity
#### Whether and how we can do better

#### Communication
- Le the interviewer your thinking process, different approaches you are trying

- What extra states/variables may help solve the problem
    - LeetCode 673 - Number of Longest Increasing Subsequence: int[] lengths, counts

#### Clean/Concise Code
- Use and write classes: like result, interval

#### Common mistakes/code
```java
// < or <=, len or len-1;
// ch -'0', ch -'a'

j < grid[0].length // not grid.length
i >= grid.length // not >
```


#### Code Pattern

#### Small Issues


#### Different Cases
- different order

#### Practice
- implement different approaches
    - dfs+cache, dp

#### Reduce n
- countMap

#### Common trick
- countMap, prefix(suffix)Map
- Map<String, first(or last) index>

