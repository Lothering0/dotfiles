local utils = require("utils")
local get_path_to = utils.get_config_path("nvim-tree")

require(get_path_to "setup")
require(get_path_to "autocmds")
require(get_path_to "mappings")

---@type Plugin
return {
  ---@module 'nvim-tree.highlights'
  highlights = require(get_path_to "highlights")
}
