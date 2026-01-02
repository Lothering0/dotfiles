local utils = {}

---@param mode VimMode
---@param key string
---@param rhs string
---@param noremap? boolean
---@param expr? boolean
function utils.map(mode, key, rhs, noremap, expr)
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
function utils.highlight(name, values)
  vim.api.nvim_set_hl(0, name, values)
end

---Returns is cursor on current position surrounded by first and second letter in symbols params
---@param symbols string
---@nodiscard
---@return string
function utils.is_surrounded(symbols)
  local vim_fn = 'getline(".")[col(".")-2:col(".")-1]'

  return vim_fn .. '=="' .. symbols .. '"'
end

---@param folder string
---@return fun(file: string): string
function utils.get_config_path(folder)
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
function utils.ternary(condition, if_true, if_false)
  if condition then return if_true end
  return if_false
end

---@generic value
---@param t table
---@param value value
---@return boolean
---@nodiscard
function utils.includes(t, value)
  for _, v in pairs(t) do
    if value == v then return true end
  end

  return false
end

--- Calls function in 1 ms after initialization
---@param fn fun(): any
function utils.defer(fn)
  local timer = vim.loop.new_timer()

  timer:start(1, 0, vim.schedule_wrap(function()
    timer:stop()
    fn()
  end))
end

return utils
