local VimMode = require("types").VimMode
local helpers = require("helpers")
local map = helpers.map

-- Jump to the next/previous git change
map(VimMode.NORMAL, "<C-S-n>", "<Plug>(GitGutterPrevHunk)")
map(VimMode.NORMAL, "<C-n>", "<Plug>(GitGutterNextHunk)")
