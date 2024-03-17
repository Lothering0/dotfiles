local VimMode = require("types").VimMode
local helpers = require("helpers")
local map = helpers.map

-- Switching between buffers
map(VimMode.NORMAL, "H", ":BufferLineCyclePrev<CR>")
map(VimMode.NORMAL, "L", ":BufferLineCycleNext<CR>")
-- Close current buffer (using plugin bufdelete.nvim)
map(VimMode.NORMAL, "<A-w>", ":lua require('bufdelete').bufdelete(0, true)<CR>")
-- Reorder buffers
map(VimMode.NORMAL, "<C-H>", ":BufferLineMovePrev<CR>")
map(VimMode.NORMAL, "<C-L>", ":BufferLineMoveNext<CR>")
