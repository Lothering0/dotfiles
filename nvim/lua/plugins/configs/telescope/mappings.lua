local VimMode = require("types").VimMode
local helpers = require("helpers")
local map = helpers.map

-- Find files using Telescope command-line sugar.
-- By file name
map(VimMode.NORMAL, "<A-f>", "<cmd>Telescope find_files hidden=true<cr>")
-- By plain text
map(VimMode.NORMAL, "<A-r>", "<cmd>Telescope live_grep<cr>")
