

Each paragraph except the first has <p> immediately before the first word, with no space after it


Implementation comments are best placed in the body of the code where they are more meaningful. The caller of the method does not need to know how it is implemented, so it is irrelevant here. Sometimes notes about implementation are useful, but they should be clearly separated and perhaps introduced with “Note:” or “Implementation:”.

The description should describe what the method does, not how it does it.

A good description will tell the caller what the method does. How it does it is often irrelevant to the caller and is a distraction

Wrapping all references to classes, instance fields, constants, etc., in {@link} allows the IDE to provide a link to the reference and to update the name if Refactor > Rename is used.

\@tag descriptions are sentence fragments, and as sentence fragments, they shouldn’t be formatted as sentences, so they don’t start with uppercase or end with punctuation. If the description is followed by a complete sentence then it should be ended with a period before starting the full sentence.

@tag descriptions that simply state the obvious are redundant and can be left off. While the style guide allows these tags to be present, they can be a maintenance burden


