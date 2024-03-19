local helpers = require("helpers")
local get_path_to = helpers.get_config_path("noice")

require(get_path_to "setup")

---@type Plugin
return {
  ---@module 'noice.highlights'
  highlights = require(get_path_to "highlights")
}
