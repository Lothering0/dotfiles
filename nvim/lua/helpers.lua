local helpers = {
  g = vim.g,
  o = vim.opt,
  c = vim.cmd,
  augroup = vim.api.nvim_create_augroup, -- Create/get autocommand group
  autocmd = vim.api.nvim_create_autocmd -- Create autocommand
}

---@param mode VimMode
---@param key string
---@param rhs string
---@param noremap? boolean
---@param expr? boolean
function helpers.map(mode, key, rhs, noremap, expr)
  noremap = noremap or true
  vim.api.nvim_set_keymap(mode, key, rhs, {
    silent = true,
    noremap = noremap,
    expr = expr
  })
end

---Highlights by group name
---@param name HighlightGroup Group name
---@param values HighlightOptions
function helpers.highlight(name, values)
  vim.api.nvim_set_hl(0, name, values)
end

---Returns is cursor on current position surrounded by first and second letter in symbols params
---@param symbols string
---@nodiscard
---@return string
function helpers.is_surrounded(symbols)
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
    expression = expression .. helpers.is_surrounded(symbols) .. " ? " .. vim_expression .. " : "
  end

  expression = expression .. key_to_remap
  return helpers.map("i", key_to_remap, expression, true)
end

---@param folder string
---@return fun(file: string): string
function helpers.get_config_path(folder)
  ---@param file string
  ---@return string
  ---@nodiscard
  return function(file)
    return "plugins/configs/" .. folder .. "/" .. file
  end
end

---@generic if_true
---@generic if_false
---@param condition any
---@param if_true if_true
---@param if_false if_false
---@return if_true | if_false
---@nodiscard
function helpers.ternary(condition, if_true, if_false)
  if condition then return if_true end
  return if_false
end

---@generic value
---@param t table
---@param value value
---@return boolean
---@nodiscard
function helpers.includes(t, value)
  for _, v in pairs(t) do
    if value == v then return true end
  end

  return false
end

return helpers
