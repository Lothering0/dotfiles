local VimMode = require("types").VimMode
local helpers = require("helpers")
local map = helpers.map
local is_surrounded = helpers.is_surrounded

-- Center the screen after jump on last line of file
map(VimMode.NORMAL, "G", "Gzz")
-- map(VimMode.NORMAL, "G", "Gzz")

-- Not exiting visual mode after tabulating
map(VimMode.VISUAL, ">", ">gv", false)
map(VimMode.VISUAL, "<", "<gv", false)

-- Autoclose brackets
map(VimMode.INSERT, '"', '""<left>')
map(VimMode.INSERT, "'", "''<left>")
map(VimMode.INSERT, "`", "``<left>")
map(VimMode.INSERT, "(", "()<left>")
map(VimMode.INSERT, "[", "[]<left>")
map(VimMode.INSERT, "{", "{}<left>")

-- Comments
map(VimMode.INSERT, "<C-_>", "<esc>maI// <esc>`a<Right><Right><Right>a", true)
map(VimMode.INSERT, "<C-A-_>", "<esc>maI<esc>d3l`a<Left><Left><Left>a", true)

map(VimMode.NORMAL, "<C-_>", "<esc>maI// <esc>`a<Right><Right><Right>", true)
map(VimMode.NORMAL, "<C-A-_>", "<esc>maI<esc>d3l`a<Left><Left><Left>", true)

map(VimMode.VISUAL, "<C-_>", "o<esc>i/* <esc>gvO<Right><Right><Right><esc>a */<esc>gv<Right><Right><Right>", true)

-- Enter
local enter_map_condition_1 = is_surrounded("{}") .. ' ? "<cr><esc>O"'
local enter_map_condition_2 = is_surrounded("()") .. ' ? "<cr><esc>O<tab>"'
local enter_map_condition_3 = is_surrounded("[]") .. ' ? "<cr><esc>O"'
local enter_map_condition_4 = is_surrounded("<>") .. ' ? "<cr><esc>O<tab>"'
local enter_map_conditions = table.concat({
  enter_map_condition_1,
  enter_map_condition_2,
  enter_map_condition_3,
  enter_map_condition_4
}, " : ")
local enter_map_expression = enter_map_conditions .. ' : "<cr>"'
map(VimMode.INSERT, "<CR>", enter_map_expression, true, true)

-- Space
local space_map_condition_1 = is_surrounded("{}") .. ' ? "<Space><Space><Left>"'
local space_map_condition_2 = is_surrounded("[]") .. ' ? "<Space><Space><Left>"'
local space_map_condition_3 = is_surrounded("()") .. ' ? "<Space><Space><Left>"'
local space_map_condition_4 = is_surrounded("<>") .. ' ? "<Space><Space><Left>"'
local space_map_conditions = table.concat({
  space_map_condition_1,
  space_map_condition_2,
  space_map_condition_3,
  space_map_condition_4
}, " : ")
local space_map_expression = space_map_conditions .. ' : "<Space>"'
map(VimMode.INSERT, "<Space>", space_map_expression, true, true)

-- Backspace
local backspace_map_condition_1 = is_surrounded("{}") .. ' ? "<Right><BS><BS>"'
local backspace_map_condition_2 = is_surrounded("[]") .. ' ? "<Right><BS><BS>"'
local backspace_map_condition_3 = is_surrounded("()") .. ' ? "<Right><BS><BS>"'
local backspace_map_condition_4 = is_surrounded("<>") .. ' ? "<Right><BS><BS>"'
local backspace_map_conditions = table.concat({
  backspace_map_condition_1,
  backspace_map_condition_2,
  backspace_map_condition_3,
  backspace_map_condition_4
}, " : ")
local backspace_map_expression = backspace_map_conditions .. ' : "<BS>"'
map(VimMode.INSERT, "<BS>", backspace_map_expression, true, true)

-- Auto "console.log(...);" on Alt+L
map(VimMode.INSERT, "<A-L>", "<esc>maIconsole.log(<esc>A);<esc>`a12<Right>a", true)
--[[
Explanation of command step-by-step:
<esc>        - going to normal mode
ma           - set mark on letter "a"
I            - going to start of line
console.log(
<esc>        - going to normal mode
A            - going to end of line
);
<esc>        - going to normal mode
`a           - return to the mark
12<Right>    - move right on length of symbols. "console.log(" is 12 symbols
a            - returning to insert mode
--]]

map(VimMode.NORMAL, "<A-L>", "maIconsole.log(<esc>A);<esc>`a12<Right>", true)
--[[
Explanation of command step-by-step:
ma           - set mark on letter "a"
I            - going to start of line
console.log(
<esc>        - going to normal mode
A            - going to end of line
);
<esc>        - going to normal mode
`a           - return to the mark
12<Right>    - move right on length of symbols. "console.log(" is 12 symbols
--]]
