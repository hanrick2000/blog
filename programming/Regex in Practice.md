<!-- TOPOST  -->




- Add `|` at the beginning (to fix markdown table)
  - Search for `^(.*)$` and replace with `|$1`



- [Does not contain certain Characters](https://stackoverflow.com/questions/4105956/regex-does-not-contain-certain-characters)
  - [^<>]: The caret in the character class ([^) means match anything but.
  - ex: find all links that doesn't start with http in markdown: `\]\([^h]`