local function get_highlights(colors)
  return {
    TelescopeSelectionCaret = { fg = colors.accent },
    TelescopeSelection = { fg = colors.accent, bg = colors.selection },
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_alt },
    TelescopePromptNormal = { fg = colors.fg, bg = colors.contrast },
    TelescopePromptBorder = { fg = colors.contrast, bg = colors.contrast },
    TelescopePreviewNormal = { bg = colors.bg },
    TelescopePreviewBorder = { fg = colors.bg, bg = colors.bg },
    TelescopeResultsNormal = { bg = colors.bg_alt },
    TelescopeResultsBorder = { bg = colors.bg_alt },
    TelescopePreviewTitle = { link = "TelescopePreviewNormal" },
    TelescopePromptTitle = { fg = colors.contrast },
  }
end

return { get_highlights = get_highlights }
