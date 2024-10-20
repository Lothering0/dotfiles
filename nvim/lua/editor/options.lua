---@type ConfigConstants
local constants = require("constants")
local helpers = require("helpers")
local NonTextVisibility = require("types").NonTextVisibility

local SHOW_NON_TEXT = constants.SHOW_NON_TEXT

local ternary, includes = helpers.ternary, helpers.includes
local g = helpers.g
local o = helpers.o
local c = helpers.c

-- g.mapleader = " "
o.number = true
o.scrolloff = 10
-- o.smarttab

c [[
  set autoindent
  set tabstop=2 expandtab
  set shiftwidth=2 expandtab
  set softtabstop=2
  set mouse=a
	set noswapfile
	set noshowmode
]]
o.cursorline = true
o.wrap = true
o.breakindent = true
o.listchars:append({
  space = ternary(
    not includes({ NonTextVisibility.NEVER, NonTextVisibility.TRAILING }, SHOW_NON_TEXT),
    "·",
    " "
  ),
  eol = ternary(
    not includes({ NonTextVisibility.NEVER, NonTextVisibility.TRAILING }, SHOW_NON_TEXT),
    "↴",
    " "
  ),
  trail = ternary(SHOW_NON_TEXT ~= NonTextVisibility.NEVER, "·", " "),
  tab = "▎ ",
})
o.list = true
o.termguicolors = true
o.ignorecase = true
o.signcolumn = "yes"
o.encoding = "utf-8"
-- Hide empty lines (~) and separator line
o.fillchars:append({ vert = " ", eob = " " })
-- Hide current mode (-- INSERT --/-- VISUAL -- etc)
-- o.nocompatible = true
o.updatetime = 300

g.vim_json_conceal = 0
