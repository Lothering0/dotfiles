---@type ConfigConstants
local constants = require("constants")
local VIRT_COLUMN = constants.VIRT_COLUMN

-- vim.opt.colorcolumn = { 81 }
require("virt-column").setup({
  char = "│",
  virtcolumn = tostring(VIRT_COLUMN),
  highlight = 'VirtColumn',
})
