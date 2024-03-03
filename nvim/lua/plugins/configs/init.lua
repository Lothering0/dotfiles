local function get_path(plugin)
  return "plugins/configs/" .. plugin .. "/init"
end

-- Material and Bufferline plugins are required in the upper module in plugins/init.lua
-- Bufferline plugin is important to be required after Material plugin

return {
  coc = require(get_path "coc"),
  colorizer = require(get_path "colorizer"),
  emmet = require(get_path "emmet"),
  gitgutter = require(get_path "gitgutter"),
  hop = require(get_path "hop"),
  indent_blankline = require(get_path "indent_blankline"),
  lualine = require(get_path "lualine"),
  noice = require(get_path "noice"),
  ["nvim-tree"] = require(get_path "nvim-tree"),
  telescope = require(get_path "telescope"),
  treesitter = require(get_path "treesitter"),
  ["vim-visual-multi"] = require(get_path "vim-visual-multi"),
  ["virt-column"] = require(get_path "virt-column"),
}
