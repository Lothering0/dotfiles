local VimMode = require("types").VimMode
local helpers = require("helpers")
local map = helpers.map

-- COC TS-Server keymaps
-- Jump to type definition
map(VimMode.NORMAL, "<A-t>", "<Plug>(coc-type-definition)")
-- Jump to definition
map(VimMode.NORMAL, "<A-d>", "<Plug>(coc-definition)")
-- Rename symbol
map(VimMode.NORMAL, "<A-s>", "<Plug>(coc-rename)")
-- Show suggestion window
map(VimMode.INSERT, "<c-space>", "coc#refresh()", true, true)
-- Confirm on enter
map(VimMode.INSERT, "<CR>", "coc#pum#visible() ? coc#pum#confirm() : \"\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>\"", true, true)
