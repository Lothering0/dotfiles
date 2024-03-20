---@type PluginHighlightsExport
return {
  get_highlights = function(colors)
    ---@type PluginHighlights
    return {
      TelescopeSelectionCaret = { fg = colors.accent },
      TelescopeSelection = { fg = colors.accent, bg = colors.selection },
      TelescopeNormal = { fg = colors.fg, bg = colors.bg_alt },
      TelescopePromptNormal = { fg = colors.fg, bg = colors.contrast },
      TelescopePromptBorder = { fg = colors.contrast, bg = colors.contrast },
      TelescopePromptCounter = { fg = colors.text },
      TelescopePreviewNormal = { bg = colors.bg },
      TelescopePreviewBorder = { fg = colors.bg, bg = colors.bg },
      TelescopeResultsNormal = { bg = colors.bg_alt },
      TelescopeResultsBorder = { bg = colors.bg_alt },
      TelescopePreviewTitle = { link = "TelescopePreviewNormal" },
      TelescopePromptTitle = { fg = colors.contrast },
    }
  end
}
