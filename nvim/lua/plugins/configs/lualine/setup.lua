local colors = require("themes/init")
local is_hl_set = 0

function set_mode_color(color, bg_color)
  bg = bg_color or colors.contrast

  -- Left separator of A section. Hack
  if is_hl_set < 2 then
    vim.api.nvim_set_hl(0, "lualine_transitional_lualine_a_mode_to_StatusLine", {
      fg = colors.selection,
      bg = colors.bg
    })
    is_hl_set = is_hl_set + 1
  end

  vim.api.nvim_set_hl(0, "LualineMode", { fg = color, bg = colors.selection })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = color, bg = bg, bold = true })
end

local modes = {
  default = {
    fg = colors.cyan,
    symbol = "?",
  },
  -- Normal
  N = {
    fg = colors.cyan,
    symbol = "",
  },
  -- Insert
  I = {
    fg = colors.green,
    symbol = "",
  },
  -- Visual
  V = {
    fg = colors.purple,
    bg = colors.bg,
    symbol = "󰈈",
  },
  -- Replace
  R = {
    fg = colors.red,
    symbol = "",
  },
  -- O-Pending
  O = {
    fg = colors.accent,
    symbol = "󰞌",
  },
  -- Command
  C = {
    fg = colors.darkyellow,
    symbol = "",
  },
}

require('lualine').setup {
  icons_enabled = false,
  options = {
    globalstatus = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    -- section_separators = { left = ' ', right = ' '},
  },
  sections = {
    lualine_a = {
      {
        'mode',
        color = 'LualineMode',
        separator = { left = '', right = ''},
        fmt = function(str)
          local mode_name = str:sub(1,1)
          local mode = modes[mode_name] or modes.default
          set_mode_color(mode.fg, mode.bg)
          return mode.symbol or mode_name
        end
      },
    },
    lualine_b = {
      'branch',
      {
        'diff',
        colored = true,
        diff_color = {
          added = 'LualineGitAdded',
          modified = 'LualineGitModified',
          removed = 'LualineGitDeleted'
        },
        -- symbols = { added = '  ', modified = '  ', removed = ' 󰆴 ' }
        symbols = { added = '+', modified = '~', removed = '-' }
      },
      'diagnostics'
    },
    lualine_c = {},
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = colors.orange },
      }
    },
    lualine_y = {
      {
        "filetype",
        fmt = function(lang)
          if lang == "html" then return "HTML" end
          if lang == "css" then return "CSS" end
          if lang == "sass" then return "Sass" end
          if lang == "scss" then return "SCSS" end
          if lang == "javascript" then return "JavaScript" end
          if lang == "typescript" then return "TypeScript" end
          if lang == "json" then return "JSON" end
          if lang == "vue" then return "Vue" end
          if lang == "javascriptreact" then return "JS React" end
          if lang == "typescriptreact" then return "TS React" end
          if lang == "lua" then return "Lua" end
          if lang == "python" then return "Python" end
          if lang == "markdown" then return "Markdown" end
          if lang == "cpp" then return "C++" end
          if lang == "c" then return "C" end
          if lang == "php" then return "PHP" end
          if lang == "haskell" then return "Haskell" end
          return lang
        end
      }
    },
  }
}
