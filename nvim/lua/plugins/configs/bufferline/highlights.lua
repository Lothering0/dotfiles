local constants = require("constants")
local ternary = require("helpers").ternary
local IS_CONTRAST = constants.IS_CONTRAST

---@type PluginHighlightsExport
local highlightsGetter = {
  get_highlights = function(colors)
    ---@type PluginHighlights
    return {
      BufferLineOffset = {
        fg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
        bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
      },
      BufferLineFill = {
        fg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
        bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg)
      },
      BufferLineSeparator = {
        fg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
        bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
      },
      BufferLineSeparatorSelected = { fg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg)  },
      BufferLineSeparatorVisible = { link = "BufferLineSeparatorSelected" },
    }
  end
}

return highlightsGetter
