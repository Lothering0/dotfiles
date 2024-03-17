local helpers = require("helpers")
local get_path_to = helpers.get_config_path("bufferline")

require(get_path_to "setup")
require(get_path_to "mappings")

---@module 'bufferline.highlights'
local highlights = require(get_path_to "highlights")

---@type Plugin
return { highlights = highlights }
