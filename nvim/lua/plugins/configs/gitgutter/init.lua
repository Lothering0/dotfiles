local helpers = require("helpers")
local get_path_to = helpers.get_config_path("gitgutter")

require(get_path_to "options")
require(get_path_to "mappings")

---@type Plugin
return {
  ---@module 'gitgutter.highlights'
  highlights = require(get_path_to "highlights")
}
