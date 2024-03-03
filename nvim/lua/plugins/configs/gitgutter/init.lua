local helpers = require("helpers")
local get_path_to = helpers.get_config_path("gitgutter")

require(get_path_to "options")

return { highlights = require(get_path_to "highlights") }
