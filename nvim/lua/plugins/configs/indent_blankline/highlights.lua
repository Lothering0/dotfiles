---@type ConfigConstants
local constants = require("constants")
local ternary = require("helpers").ternary
local ALWAYS_SHOW_NON_TEXT = constants.ALWAYS_SHOW_NON_TEXT

---@type PluginHighlightsExport
return {
  get_highlights = function(colors)
    ---@type PluginHighlights
    return {
      IndentBlanklineChar = { fg = colors.active, nocombine = true },
      IndentBlanklineContextChar = { fg = colors.fg, nocombine = true },
      IndentBlanklineSpaceChar = { fg = ternary(ALWAYS_SHOW_NON_TEXT, colors.active, colors.bg), nocombine = true },
      IndentBlanklineContextSpaceChar = {
        fg = ternary(ALWAYS_SHOW_NON_TEXT, colors.active, colors.bg),
        nocombine = true
      },
    }
  end
}
