local ternary = require("helpers").ternary

local function get_highlights(colors)
  return {
    CocFloating = { bg = colors.floating_window or colors.selection },
    FgCocErrorFloatBgCocFloating = { fg = colors.error },
    CocPumSearch = { fg = colors.accent },
    CocPumVirtualText = { fg = colors.comments },
    -- CocFloatActive = { fg = colors.orange },
    CocFloatActive = { fg = colors.accent },
    CocMenuSel = { bg = colors.floating_window_current_line or colors.visual },
    CocFloatThumb = { bg = colors.fg },
    CocHighlightText = { bg = colors.selection },
    CocUnusedHighlight = ternary(colors.unused, { fg = colors.unused }),
  }
end

return { get_highlights = get_highlights }
