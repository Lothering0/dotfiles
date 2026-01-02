local utils = require("utils")
local get_path_to = utils.get_config_path("telescope")

require(get_path_to "setup")
require(get_path_to "mappings")

---@type Plugin
return {
  ---@module 'telescope.highlights'
  highlights = require(get_path_to "highlights")
}
