local constants = require("constants")
local ternary = require("helpers").ternary
local ALWAYS_SHOW_NON_TEXT = constants.ALWAYS_SHOW_NON_TEXT

local function get_highlights(colors)
  return {
    -- MatchParen = { bg = colors.selection, bold = true }
    MatchParen = { bg = colors.selection },
    ColorColumn = { bg = colors.bg },
    VirtColumn = { fg = colors.virt_column or colors.active },
    Whitespace = { fg = ternary(ALWAYS_SHOW_NON_TEXT, colors.active, colors.bg) },
    NonText = { fg = ternary(ALWAYS_SHOW_NON_TEXT, colors.active, colors.bg) },
    YankedText = { fg = colors.bg, bg = colors.yellow },
    -- CursorLineNr = { fg = colors.accent, bg = colors.bg_alt },
    CursorLineNr = { fg = colors.text, bg = colors.contrast },
    -- Cursor = { fg = colors.bg, bg = colors.cursor },
    Visual = { fg = colors.none, bg = colors.visual },
  }
end

return { get_highlights = get_highlights }
