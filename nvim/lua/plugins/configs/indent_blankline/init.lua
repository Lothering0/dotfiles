local helpers = require("helpers")
local get_path_to = helpers.get_config_path("indent_blankline")

require(get_path_to "setup")
require(get_path_to "options")

return { highlights = require(get_path_to "highlights") }
