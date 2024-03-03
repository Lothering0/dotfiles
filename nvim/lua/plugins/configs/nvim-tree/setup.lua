local constants = require("constants")
local EXPLORER_WIDTH = constants.EXPLORER_WIDTH
local EXPLORER_HAS_NUMBERS = constants.EXPLORER_HAS_NUMBERS

require("nvim-tree").setup({
  on_attach = function(bufnr)
    local api = require "nvim-tree.api"
    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- Custom mappings
    vim.keymap.set('n', 'b', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.del('n', '-', { buffer = bufnr })
  end,
  filters = {
    dotfiles = false,
    exclude = { "" }
  },
  view = {
    width = EXPLORER_WIDTH,
    number = EXPLORER_HAS_NUMBERS,
    relativenumber = EXPLORER_HAS_NUMBERS,
  },
  renderer = {
    --[[ indent_markers = {
      enable = true,
      inline_arrows = false,
      icons = {
        corner = "╰",
        edge = "│",
        item = "│",
        bottom = "─",
        none = "│",
      },
    }, --]]
    root_folder_label = false,
    highlight_git = "name",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "",
        edge = "",
        item = "",
        bottom = "",
        none = "",
      },
    },
    special_files = {},
    --[[ special_files = {
      "tsconfig.json",
      "package.json",
      "Cargo.toml",
      "Makefile",
      "README.md",
      "readme.md"
    }, --]]
    icons = {
      -- use one space as value if current font is full mono
      padding = "  ",
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
})
