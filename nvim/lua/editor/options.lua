---@type ConfigConstants
local constants = require("constants")
local utils = require("utils")
local NonTextVisibility = require("types").NonTextVisibility

local SHOW_NON_TEXT = constants.SHOW_NON_TEXT

local ternary, includes = utils.ternary, utils.includes

-- vim.g.mapleader = " "
vim.opt.number = true
vim.opt.scrolloff = 10
-- vim.opt.smarttab

vim.cmd [[
  set autoindent
  set tabstop=2 expandtab
  set shiftwidth=2 expandtab
  set softtabstop=2
  set mouse=a
	set noswapfile
	set noshowmode
]]
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.listchars:append({
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
vim.opt.list = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.signcolumn = "yes"
vim.opt.encoding = "utf-8"
-- Hide empty lines (~) and separator line
vim.opt.fillchars:append({ vert = " ", eob = " " })
-- Hide current mode (-- INSERT --/-- VISUAL -- etc)
-- vim.opt.nocompatible = true
vim.opt.updatetime = 300

vim.g.vim_json_conceal = 0

vim.filetype.add({
  pattern = {
    ['.*/.xmobarrc'] = 'haskell',
    ['.*/*.rasi']    = 'scss',
    ['.*/.env.*']    = 'sh',
  },
})

utils.defer(function ()
  vim.o.guicursor = "a:block-blinkon1000-blinkoff10-Cursor,n-v-sm:block,i-c-ci-ve:ver20,r-cr-o:hor20"
end)
