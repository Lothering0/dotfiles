local helpers = require("helpers")
local get_path_to = helpers.get_config_path("bufferline")

require(get_path_to "setup")
require(get_path_to "mappings")

---@type Plugin
return {
  ---@module 'bufferline.highlights'
  highlights = require(get_path_to "highlights")
}
