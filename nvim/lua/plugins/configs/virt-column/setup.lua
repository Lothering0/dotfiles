local VIRT_COLUMN = require("constants").VIRT_COLUMN

-- vim.opt.colorcolumn = { 81 }
require("virt-column").setup({
  char = "│",
  virtcolumn = tostring(VIRT_COLUMN),
  highlight = 'VirtColumn',
})
