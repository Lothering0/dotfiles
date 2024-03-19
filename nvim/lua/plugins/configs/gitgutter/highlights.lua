---@type PluginHighlightsExport
return {
  get_highlights = function(colors)
    ---@type PluginHighlights
    return {
      GitGutterAdd = { fg = colors.git.added },
      GitGutterChange = { fg = colors.git.modified },
      GitGutterDelete = { fg = colors.git.removed },
    }
  end
}
