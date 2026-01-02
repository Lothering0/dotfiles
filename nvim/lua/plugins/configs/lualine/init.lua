local utils = require("utils")
local get_path_to = utils.get_config_path("lualine")

require(get_path_to "setup")

---@type Plugin
return {
  ---@module 'lualine.highlights'
  highlights = require(get_path_to "highlights")
}
