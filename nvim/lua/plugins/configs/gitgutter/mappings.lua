local VimMode = require("types").VimMode
local utils = require("utils")
local map = utils.map

-- Jump to the next/previous git change
map(VimMode.NORMAL, "<C-S-n>", "<Plug>(GitGutterPrevHunk)")
map(VimMode.NORMAL, "<C-n>", "<Plug>(GitGutterNextHunk)")
