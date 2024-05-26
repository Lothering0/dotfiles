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
      -- MatchParen = { bg = colors.selection, bold = true }
      MatchParen = { bg = colors.selection },
      ColorColumn = { bg = colors.bg },
      VirtColumn = { fg = colors.virt_column or colors.active },
      Whitespace = {
        fg = ternary(
          includes({ NonTextVisibility.ALWAYS, NonTextVisibility.TRAILING }, SHOW_NON_TEXT),
          colors.active,
          colors.bg
        ),
      },
      NonText = { fg = ternary(SHOW_NON_TEXT == NonTextVisibility.ALWAYS, colors.active, colors.bg) },
      YankedText = { fg = colors.bg, bg = colors.yellow },
      -- CursorLineNr = { fg = colors.accent, bg = colors.bg_alt },
      CursorLineNr = { fg = colors.text, bg = colors.contrast },
      -- Cursor = { fg = colors.bg, bg = colors.cursor },
      Visual = { fg = colors.none, bg = colors.visual },
    }
  end
}
