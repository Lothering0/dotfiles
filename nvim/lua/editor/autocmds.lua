local helpers = require("helpers")
local augroup = helpers.augroup
local autocmd = helpers.autocmd

-- Highlight yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "YankedText", timeout = "150" })
  end
})
