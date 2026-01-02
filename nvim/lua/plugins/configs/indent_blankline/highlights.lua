---@type ConfigConstants
local constants = require("constants")
local utils = require("utils")
local ternary, includes = utils.ternary, utils.includes
local NonTextVisibility = require("types").NonTextVisibility
local SHOW_NON_TEXT = constants.SHOW_NON_TEXT

---@type PluginHighlightsExport
return {
  get_highlights = function(colors)
    ---@type PluginHighlights
    return {
      ['@ibl.indent.char.1'] = { fg = colors.active, nocombine = true },
      ['@ibl.scope.char.1'] = { fg = colors.fg, nocombine = true },
      ['@ibl.whitespace.char.1'] = {
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
