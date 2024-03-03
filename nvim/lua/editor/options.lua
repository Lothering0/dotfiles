local helpers = require("helpers")
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
o.listchars:append({ space = "·", eol = "↴", trail = "·" })
o.list = true
o.termguicolors = true
o.ignorecase = true
o.signcolumn = "yes"
o.encoding = "utf-8"
-- Hide empty lines ~
o.fillchars = "eob: "
-- Hide current mode (-- INSERT --/-- VISUAL -- etc)
-- o.nocompatible = true
-- Hide separator line
o.fillchars:append({ vert = " " })
o.updatetime = 300

g.vim_json_conceal = 0
