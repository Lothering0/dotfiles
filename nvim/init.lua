if vim.g.vscode then
  -- VSCode extension
else
  -- ordinary Neovim
  require("editor/init")
  require("plugins/init")
  require("neovide/init")
end
