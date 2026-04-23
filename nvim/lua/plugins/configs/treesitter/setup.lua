local colors = require("themes/init")

require'nvim-treesitter.config'.setup {
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

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
  },
  callback = function() vim.treesitter.start() end,
})
