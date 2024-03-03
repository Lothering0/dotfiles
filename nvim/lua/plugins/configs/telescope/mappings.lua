local helpers = require("helpers")
local map = helpers.map

-- Find files using Telescope command-line sugar.
-- By file name
map("n", "<A-f>", "<cmd>Telescope find_files hidden=true<cr>")
-- By plain text
map("n", "<A-r>", "<cmd>Telescope live_grep<cr>")
