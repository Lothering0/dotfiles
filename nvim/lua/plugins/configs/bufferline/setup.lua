local bufferline = require("bufferline")
local ternary = require("helpers").ternary
local IS_CONTRAST = require("constants").IS_CONTRAST

bufferline.setup({
  options = {
    diagnostics = "coc",
    separator_style = ternary(IS_CONTRAST, "slant", "thin"),
    indicator = {
      -- icon = "▎", -- this should be omitted if indicator style is not 'icon'
      style = ternary(IS_CONTRAST, "none", "underline"), -- can be "icon" | "underline" | "none",
    },
    style_preset = {
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold,
    },
    offsets = {
      {
        filetype = "NvimTree",
        highlight = "BufferLineOffset",
      }
    },
  },
})
