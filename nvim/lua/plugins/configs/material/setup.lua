local constants = require("constants")
local IS_CONTRAST = constants.IS_CONTRAST

local colors = require("themes/init")
local lume = require("lume")

local editor = require("editor/init")
local plugins = require("plugins/configs/init")

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
    "nvim-web-devicons"
  },
  custom_colors = function(clrs)
    -- if colors.meta.name == "material" then return end

    clrs.editor.bg = colors.bg

    clrs.backgrounds.sidebars = colors.bg
    clrs.backgrounds.floating_windows = colors.bg
    clrs.backgrounds.non_current_windows = colors.bg
    clrs.backgrounds.cursor_line = colors.contrast

    clrs.git.added = colors.darkgreen

    for key, value in pairs(clrs.main) do
      clrs.main[key] = colors[key]
    end

    for key, value in pairs(clrs.editor) do
      clrs.editor[key] = colors[key]
    end
  end,
  custom_highlights = lume.merge(
    editor.highlights.get_highlights(colors),
    -- TODO: try to do loop over this plugins. DRY
    require("plugins/configs/bufferline/highlights").get_highlights(colors),
    plugins.coc.highlights.get_highlights(colors),
    plugins.gitgutter.highlights.get_highlights(colors),
    plugins.indent_blankline.highlights.get_highlights(colors),
    plugins.lualine.highlights.get_highlights(colors),
    plugins.noice.highlights.get_highlights(colors),
    plugins["nvim-tree"].highlights.get_highlights(colors),
    plugins.treesitter.highlights.get_highlights(colors)
  ),
})
