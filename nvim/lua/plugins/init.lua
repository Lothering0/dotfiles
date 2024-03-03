require("plugins/packer")
local lume = require('lume')

return {
  plugins = lume.merge(
    { material = require("plugins/configs/material/init") },
    require("plugins/configs/init"),
    { bufferline = require("plugins/configs/bufferline/init") }
  ),
}
