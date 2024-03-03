local helpers = require("helpers")
local o = helpers.o
local g = helpers.g

-- Scopes for indentations highlighter
g.indent_blankline_context_patterns = {
  'class',
  'function',
  'method',
  '^if',
  '^while',
  '^for',
  '^object',
  '^table',
  'block',
  'arguments'
}

g.indent_blankline_use_treesitter = true
-- g.indent_blankline_char_list = { '▏', '╎', '┆', '┊' }
g.indent_blankline_char_list = { '│', '╎', '┆', '┊' }
-- From description: Turn this off if you want to use background highlighting instead of chars
g.indent_blankline_show_trailing_blankline_indent = false
