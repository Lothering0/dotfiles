local constants = require("constants")
local ternary = require("helpers").ternary
local IS_CONTRAST = constants.IS_CONTRAST

local function get_highlights(colors)
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
    NvimTreeGitIgnored = ternary(colors.git.ignored, { fg = colors.git.ignored }),
  }
end

return { get_highlights = get_highlights }
