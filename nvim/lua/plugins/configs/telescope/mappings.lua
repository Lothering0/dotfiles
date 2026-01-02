local VimMode = require("types").VimMode
local utils = require("utils")
local map = utils.map

-- Find files using Telescope command-line sugar.
-- By file name
map(VimMode.NORMAL, "<A-f>", "<cmd>Telescope find_files hidden=true<cr>")
-- By plain text
map(VimMode.NORMAL, "<A-r>", "<cmd>Telescope live_grep<cr>")
