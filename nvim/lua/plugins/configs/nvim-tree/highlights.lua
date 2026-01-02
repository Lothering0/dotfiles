local constants = require("constants")
local ternary = require("utils").ternary
local IS_CONTRAST = constants.IS_CONTRAST

---@type PluginHighlightsExport
return {
  get_highlights = function(colors)
    ---@type PluginHighlights
    return {
      NvimTreeNormal = { bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg) },
      NvimTreeFolderName = { fg = colors.folder or colors.accent },
      NvimTreeOpenedFolderName = { fg = colors.folder or colors.accent },
      NvimTreeCursorLine = {
        bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg)
      },
      NvimTreeCursorLineNr = {
        fg = colors.cyan,
        bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
      },
      NvimTreeIndentMarker = { fg = colors.border },
      NvimTreeExecFile = { link = 'Normal' },
      NvimTreeGitFileNewHL = { fg = colors.yellow },
      NvimTreeGitFileDirtyHL = { fg = colors.blue },
      NvimTreeGitFileDeletedHL = { fg = colors.red },
      NvimTreeGitIgnored = ternary(colors.git.ignored, { fg = colors.git.ignored }, nil),
    }
  end
}
