local VimMode = require("types").VimMode
local utils = require("utils")
local map = utils.map

map(VimMode.NORMAL, "<A-e>", "<cmd>NvimTreeToggle<cr>")
