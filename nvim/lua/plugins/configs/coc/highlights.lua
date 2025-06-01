local ternary = require("helpers").ternary

---@type PluginHighlightsExport
return {
  get_highlights = function(colors)
    ---@type PluginHighlights
    return {
      CocFloating = { fg = colors.fg, bg = colors.floating_window or colors.selection },
      FgCocErrorFloatBgCocFloating = { fg = colors.error },
      CocPumSearch = { fg = colors.accent },
      CocPumVirtualText = { fg = colors.comments },
      -- CocFloatActive = { fg = colors.orange },
      CocFloatActive = { fg = colors.accent },
      CocMenuSel = { bg = colors.floating_window_current_line or colors.visual },
      CocFloatThumb = { bg = colors.fg },
      CocHighlightText = { bg = colors.selection },
      CocUnusedHighlight = ternary(colors.unused, { fg = colors.unused }, nil),
      CocSymbolClass = { fg = colors["@constructor"] or colors.darkyellow },
      CocSymbolFunction = { fg = colors["@function"] or colors.darkblue },
      CocSymbolMethod = { fg = colors["@function"] or colors.darkblue },
      CocSymbolInterface = { fg = colors.darkcyan },
      CocSymbolKeyword = { fg = colors["@keyword"] or colors.purple },
      CocSymbolProperty = { fg = colors["@variable.member"] or colors.gray },
      CocInlayHint = { fg = colors.comments, bg = colors.bg_alt },
    }
  end
}
