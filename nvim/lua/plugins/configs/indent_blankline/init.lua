local utils = require("utils")
local get_path_to = utils.get_config_path("indent_blankline")

require(get_path_to "setup")

---@type Plugin
return {
  ---@module 'indent_blankline.highlights'
  highlights = require(get_path_to "highlights")
}
