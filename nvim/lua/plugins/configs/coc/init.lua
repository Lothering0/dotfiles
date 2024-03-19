local helpers = require("helpers")
local get_path_to = helpers.get_config_path("coc")

require(get_path_to "options")
require(get_path_to "mappings")

---@type Plugin
return {
  ---@module 'coc.highlights'
  highlights = require(get_path_to "highlights")
}
