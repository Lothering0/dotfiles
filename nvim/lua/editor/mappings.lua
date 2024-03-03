local helpers = require("helpers")
local map = helpers.map
local is_surrounded = helpers.is_surrounded

-- Center the screen after jump on last line of file
map("n", "G", "Gzz")

-- Not exiting visual mode after tabulating
map("v", ">", ">gv", false)
map("v", "<", "<gv", false)

-- Autoclose brackets
map("i", '"', '""<left>')
map("i", "'", "''<left>")
map("i", "`", "``<left>")
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")

-- Comments
map("i", "<C-_>", "<esc>maI// <esc>`a<Right><Right><Right>a", true)
map("i", "<C-A-_>", "<esc>maI<esc>d3l`a<Left><Left><Left>a", true)

map("n", "<C-_>", "<esc>maI// <esc>`a<Right><Right><Right>", true)
map("n", "<C-A-_>", "<esc>maI<esc>d3l`a<Left><Left><Left>", true)

map("v", "<C-_>", "o<esc>i/* <esc>gvO<Right><Right><Right><esc>a */<esc>gv<Right><Right><Right>", true)

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
map("i", "<CR>", enter_map_expression, true, true)

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
map("i", "<Space>", space_map_expression, true, true)

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
map("i", "<BS>", backspace_map_expression, true, true)
