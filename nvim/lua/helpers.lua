local g = vim.g
local o = vim.opt
local c = vim.cmd

local function map(mode, key, v, noremap, expr)
  local noremap = noremap or true
  vim.api.nvim_set_keymap(mode, key, v, {
    silent = true,
    noremap = noremap,
    expr = expr
  })
end

augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
autocmd = vim.api.nvim_create_autocmd -- Create autocommand

--[=====[
 Returns is cursor on current position surrounded by first and second
 letter in symbols params
--]=====]
local function is_surrounded(symbols)
  local vim_fn = 'getline(".")[col(".")-2:col(".")-1]'

  return vim_fn .. '=="' .. symbols .. '"'
end

--[=====[
  Example:

  if_surrounded({
    "{}": "bar"
  }, "b")

  Result:
  Cursor between braces: {|}. Then press b and result should be: {bar}.
  In other cases result should be as expected "b"

  CAUTION:
  By some reason behaviour of this function is unexpected. It is not getting
  string value of vim maps from string literal (e.g. <Space><Space><Left>)
  instead function executing this string. So, function is not working
--]=====]
local function if_surrounded(table, key_to_remap)
  local expression = ""

  for symbols, vim_expression in pairs(table) do
    expression = expression .. is_surrounded(symbols) .. " ? " .. vim_expression .. " : "
  end

  expression = expression .. key_to_remap
  return map("i", key_to_remap, expression, true)
end

local function get_config_path(folder)
  return function(file)
    return "plugins/configs/" .. folder .. "/" .. file
  end
end

local function ternary(condition, if_true, if_false)
  if condition then return if_true end
  return if_false
end

return {
  g = g,
  o = o,
  c = c,
  map = map,
  augroup = augroup,
  autocmd = autocmd,
  is_surrounded = is_surrounded,
  -- if_surrounded = if_surrounded,
  get_config_path = get_config_path,
  ternary = ternary
}
