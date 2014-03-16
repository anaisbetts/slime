module.exports =
  activate: (rootView, state) ->
    @coffee = require 'coffee-script'
    atom.workspaceView.command "slime:eval-block", => @evalBlock()
    atom.workspaceView.command "slime:eval-file", => @evalFile()
    atom.workspaceView.command "slime:eval-line", => @evalLine()

  evalBlock: ->
    editor = atom.workspace.activePaneItem
    sel = editor.getSelection().getText()

    console.log(@coffee.eval(sel))

  evalFile: ->
    editor = atom.workspace.activePaneItem
    sel = editor.getText()

    console.log(@coffee.eval(sel))

  evalLine: ->
    editor = atom.workspace.activePaneItem
    sel = editor.getCursor().getCurrentBufferLine()

    console.log(@coffee.eval(sel))
