---@type PluginHighlightsExport
return {
  get_highlights = function(colors)
    ---@type PluginHighlights
    return {
      NoiceCmdlinePopup = { bg = colors.contrast },
      NoiceCmdlinePopupBorder = { fg = colors.border },
      NoiceCmdlinePopupBorderSearch = { fg = colors.darkyellow },
      NoiceCmdlineIconSearch = { fg = colors.darkyellow },
    }
  end
}
