-- Current theme. Full list of available themes you can find in lua/themes
local THEME = "material/deep_ocean"
-- Width of the sidebar (directiories tree)
local EXPLORER_WIDTH = 32
-- Show line numbers in explorer
local EXPLORER_HAS_NUMBERS = false
-- Number of column where should be vertical rule
local VIRT_COLUMN = 121
-- If true, editor has contrast elements (especially, sidebars)
local IS_CONTRAST = false
-- Determines is non-text (like whitespaces and linebreaks) should always be visible or only when selected or is current line
-- TODO: make enum 'current-line' | 'always' | 'never'
local ALWAYS_SHOW_NON_TEXT = false
-- Should string literals has a background
local HAS_STRING_BACKGROUND = true

return {
  THEME = THEME,
  EXPLORER_WIDTH = EXPLORER_WIDTH,
  EXPLORER_HAS_NUMBERS = EXPLORER_HAS_NUMBERS,
  VIRT_COLUMN = VIRT_COLUMN,
  IS_CONTRAST = IS_CONTRAST,
  ALWAYS_SHOW_NON_TEXT = ALWAYS_SHOW_NON_TEXT,
  HAS_STRING_BACKGROUND = HAS_STRING_BACKGROUND,
}
