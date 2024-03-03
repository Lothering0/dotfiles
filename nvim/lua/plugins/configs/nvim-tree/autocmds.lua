local function open_nvim_tree(data)
  -- open the tree but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false })
end

local function close_nvim_tree()
  if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
    vim.cmd "quit"
  end
end

-- NvimTree open on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- NvimTree autoclose. WARNING: it can be cause of errors!

-- Native solution
--[[ vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = close_nvim_tree
}) --]]

-- Community solution
local function tab_win_closed(winnr)
  local api = require"nvim-tree.api"
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  -- close buffer was nvim tree
  if buf_info.name:match(".*NvimTree_%d*$") then
    -- Close all nvim tree on :q
    -- and was not the last window (not closed automatically by code below)
    if not vim.tbl_isempty(tab_bufs) then
      api.tree.close()
    end
  -- else closed buffer was normal buffer
  else
    -- if there is only 1 buffer left in the tab
    if #tab_bufs == 1 then
      local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      -- and that buffer is nvim tree
      if last_buf_info.name:match(".*NvimTree_%d*$") then
        vim.schedule(function ()
          -- if its the last buffer in vim
          if #vim.api.nvim_list_wins() == 1 then
            -- then close all of vim
            vim.cmd "quit"
          -- else there are more tabs open
          else
            -- then close only the tab
            vim.api.nvim_win_close(tab_wins[1], true)
          end
        end)
      end
    end
  end
end

--[[ vim.api.nvim_create_autocmd("WinClosed", {
  callback = function ()
    local winnr = tonumber(vim.fn.expand("<amatch>"))
    vim.schedule_wrap(tab_win_closed(winnr))
  end,
  nested = true
}) ]]--
