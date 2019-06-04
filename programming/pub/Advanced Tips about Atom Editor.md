---

### [Awesome Tips about Chrome Series](/search/label/Atom_Series){target="blank"}
<script src="/feeds/posts/default/-/Atom_Series?orderby=updated&amp;alt=json-in-script&amp;callback=series&amp;max-results=20"></script>

---

<!-- SD: 
Advanced Tips About Atom Editor: How to Add Custom Command and Add New Functions into Atom.
-->

### [Add Command To Move/Select To First Letter](https://discuss.atom.io/t/move-and-select-to-first-letter-a-za-z/65504)
- Add the command in `init.coffee`
```coffee
atom.commands.add 'atom-text-editor', 'custom:move-to-first-letter': ->
    editor = atom.workspace.getActiveTextEditor()
    if !editor
      return 
    cursor = editor.getLastCursor()
    line = editor.lineTextForBufferRow(cursor.getBufferRow())
    match = /[a-zA-Z]/.exec(line)
    if !match 
      return
    cursor.setBufferPosition([cursor.getBufferRow(), match.index])

atom.commands.add 'atom-text-editor', 'custom:select-to-first-letter-of-line': ->
    editor = atom.workspace.getActiveTextEditor()
    if !editor
      return 
    cursor = editor.getLastCursor()
    selections = editor.getSelections()
    line = editor.lineTextForBufferRow(cursor.getBufferRow())
    match = /[a-zA-Z]/.exec(line)
    if !match 
      return
    firstLetterPos = [cursor.getBufferRow(), match.index]
    selections[0].setBufferRange([firstLetterPos, cursor.getBufferPosition()])
```
- Add the shortcut in keymap.cson
```yaml
'atom-text-editor':
  'ctrl-cmd-left': 'custom:select-to-first-letter-of-line'
```

### How To Add Custom Command
```coffee
# https://atom.io/docs/api/v1.0.2/CommandRegistry
atom.commands.add 'atom-text-editor',
  'user:insert-date': (event) ->
    editor = @getModel()
    editor.insertText(new Date().toLocaleString())
```

---
#### [Related Posts](/search?q=label:Markdown|label:"Atom Editor"){target="blank"}
<script src="/feeds/posts/default/-/Atom Editor?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Markdown?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
<script src="/feeds/posts/default/-/Dev Tips?orderby=updated&amp;alt=json-in-script&amp;callback=weightedRandomRelatedPosts&amp;max-results=20"></script>
