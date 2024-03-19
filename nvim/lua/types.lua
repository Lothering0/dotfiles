---@meta

-- https://luals.github.io/wiki/annotations/

---@enum VimMode
local VimMode = {
  NORMAL = 'n',
  INSERT = 'i',
  VISUAL = 'v',
  REPLACE = 'x',
}

---@alias Hex string Hex value. Example: "#ffffff"

---@enum CtermColor NR-16
local CtermColor = {
  BLACK = 0,
  DARK_BLUE = 1,
  DARK_GREEN = 2,
  DARK_CYAN = 3,
  DARK_RED = 4,
  DARK_MAGENTA = 5,
  DARK_YELLOW = 6,
  GRAY = 7,
  DARK_GRAY = 8,
  BLUE = 9,
  GREEN = 10,
  CYAN = 11,
  RED = 12,
  MAGENTA = 13,
  YELLOW = 14,
  WHITE = 15,
}

---@alias HighlightGroup string Name of highlight group

---@class HighlightColorOptions Highlight options for setting colors. Examlpe: { fg = "#ff0000", bg = "#00ff00" }
---@field fg? Hex
---@field bg? Hex
---@field sp? Hex

---@class HighlightTerminalUIOptions
---@field bold?  boolean
---@field standout? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field underdouble? boolean
---@field underdotted? boolean
---@field underdashed? boolean
---@field strikethrough? boolean
---@field italic? boolean
---@field reverse? boolean
---@field inverse? boolean Same as reverse
---@field nocombine? boolean

---@class HighlightOtherOptions
---@field blend? number Integer between 0 and 100
---@field link? string Name of another highlight group to link to
---@field default boolean? Don't override existing definition
---@field ctermfg CtermColor? Sets foreground of cterm color ctermfg
---@field ctermbg CtermColor? Sets background of cterm color ctermbg
---@field cterm boolean? Cterm attribute map, like highlight-args. If not set, cterm attributes will match those from the attribute map documented above.
---@field force boolean? if true force update the highlight group when it exists

---@alias HighlightOptions HighlightColorOptions | HighlightTerminalUIOptions | HighlightOtherOptions Highlight options

---@class ConfigConstants
-- TODO: make special type for theme
---@field THEME Theme Current theme. Full list of available themes you can find in lua/themes
---@field EXPLORER_WIDTH number Width of the sidebar (directiories tree)
---@field EXPLORER_HAS_NUMBERS boolean Show line numbers in explorer
---@field VIRT_COLUMN number Number of column where should be vertical rule
---@field IS_CONTRAST boolean If true, editor has contrast elements (especially, sidebars)
-- TODO: make enum 'current-line' | 'always' | 'never'
---@field ALWAYS_SHOW_NON_TEXT boolean Determines is non-text (like whitespaces and linebreaks) should always be visible or only when selected or is current line
---@field HAS_STRING_BACKGROUND boolean Should string literals has a background

return { CtermColor = CtermColor, VimMode = VimMode }
