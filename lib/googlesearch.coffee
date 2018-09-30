Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'wolframsearch:wolfram-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://www.wolframalpha.com/input/?i=#{cased}"
        Shell.openExternal url
