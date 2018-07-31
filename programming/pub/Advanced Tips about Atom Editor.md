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
