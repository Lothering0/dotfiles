local VimMode = require("types").VimMode
local helpers = require("helpers")
local map = helpers.map

map(VimMode.NORMAL, "-", ":HopChar1<CR>")
