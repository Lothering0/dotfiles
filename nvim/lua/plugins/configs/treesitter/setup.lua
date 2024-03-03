local colors = require("themes/init")

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  },
  rainbow = {
    enable = false,
    extended_mode = false,
    disable = { "typescript" },
    colors = { colors.yellow, colors.purple, colors.cyan }
  }
}
