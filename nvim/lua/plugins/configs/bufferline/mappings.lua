local helpers = require("helpers")
local map = helpers.map

-- Switching between buffers
map("n", "H", ":BufferLineCyclePrev<CR>")
map("n", "L", ":BufferLineCycleNext<CR>")
-- Close current buffer (using plugin bufdelete.nvim)
map("n", "<A-w>", ":lua require('bufdelete').bufdelete(0, true)<CR>")
-- Reorder buffers
map("n", "<C-H>", ":BufferLineMovePrev<CR>")
map("n", "<C-L>", ":BufferLineMoveNext<CR>")
