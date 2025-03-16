local constants = require("constants")
local IS_CONTRAST = constants.IS_CONTRAST

local colors = require("themes/init")

require('material').setup({
  contrast = {
    sidebars = IS_CONTRAST,
    -- floating_windows = true,
    -- non_current_windows = true,
    cursor_line = true,
    popup_menu = true
  },
  lualine_style = "stealth", -- can be "stealth" or "default"
  plugins = {
    "nvim-tree",
    "telescope",
    "gitsigns",
    "indent-blankline",
    "nvim-web-devicons",
  },
  async_loading = false,
  -- See: https://github.com/marko-cerovac/material.nvim/blob/main/lua/material/colors/init.lua
  custom_colors = function(clrs)
    -- if colors.meta.name == "material" then return end

    clrs.editor.bg = colors.bg

    clrs.backgrounds.sidebars = colors.bg
    clrs.backgrounds.floating_windows = colors.bg
    clrs.backgrounds.non_current_windows = colors.bg
    clrs.backgrounds.cursor_line = colors.contrast

    clrs.lsp.error = colors.error
    clrs.lsp.warning = colors.yellow
    clrs.lsp.info = colors.paleblue
    clrs.lsp.hint = colors.purple

    clrs.git.added = colors.darkgreen

    for key, value in pairs(clrs.main) do
      clrs.main[key] = colors[key]
    end

    for key, value in pairs(clrs.editor) do
      clrs.editor[key] = colors[key]
    end
  end,
})
