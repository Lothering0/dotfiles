local helpers = require("helpers")
local get_path_to = helpers.get_config_path("telescope")

require(get_path_to "setup")
require(get_path_to "mappings")

return { highlights = require(get_path_to "highlights") }
