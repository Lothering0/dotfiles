---@type ConfigConstants
local constants = require("constants")
local helpers = require("helpers")
local ternary, includes = helpers.ternary, helpers.includes
local NonTextVisibility = require("types").NonTextVisibility
local SHOW_NON_TEXT = constants.SHOW_NON_TEXT

---@type PluginHighlightsExport
return {
  get_highlights = function(colors)
    ---@type PluginHighlights
    return {
      IndentBlanklineChar = { fg = colors.active, nocombine = true },
      IndentBlanklineContextChar = { fg = colors.fg, nocombine = true },
      IndentBlanklineSpaceChar = {
        fg = ternary(
          includes({ NonTextVisibility.ALWAYS, NonTextVisibility.TRAILING }, SHOW_NON_TEXT),
          colors.active,
          colors.bg
        ),
        nocombine = true,
      },
      IndentBlanklineContextSpaceChar = {
        fg = ternary(
          includes({ NonTextVisibility.ALWAYS, NonTextVisibility.TRAILING }, SHOW_NON_TEXT),
          colors.active,
          colors.bg
        ),
        nocombine = true,
      },
    }
  end
}
