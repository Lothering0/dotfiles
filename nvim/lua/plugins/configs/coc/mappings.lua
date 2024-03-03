local helpers = require("helpers")
local map = helpers.map

-- COC TS-Server keymaps
-- Jump to type definition
map("n", "<A-t>", "<Plug>(coc-type-definition)")
-- Jump to definition
map("n", "<A-d>", "<Plug>(coc-definition)")
-- Rename symbol
map("n", "<A-s>", "<Plug>(coc-rename)")
-- Show suggestion window
map("i", "<c-space>", "coc#refresh()", true, true)
-- Confirm on enter
map("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : \"\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>\"", true, true)
