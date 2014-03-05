module.exports =
  activate: (state) ->
    atom.workspaceView.command "space-tab:convert-to-tabs", => @convertToTabs()
    atom.workspaceView.command "space-tab:convert-to-spaces", => @convertToSpaces()

  convertToTabs: ->
    debugger
    editor = atom.workspace.activePaneItem
    spaceCount = editor.getTabLength()
    re = new RegExp("(?:^|\G) {" + spaceCount + "}")
    textArray = editor.getText().split('\n')
    newTextArray = [];
    textArray.forEach (line) ->
      newTextArray.push(line.replace(re, "\t"))

    result = newTextArray.reduce (previousValue, currentValue) ->
       return previousValue + currentValue + '\n';

    editor.setText(result)

  convertToSpaces: ->
    editor = atom.workspace.activePaneItem
    editor.insertText('Converting leading tabs to spaces')
