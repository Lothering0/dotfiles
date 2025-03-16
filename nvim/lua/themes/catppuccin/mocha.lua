-- See: https://catppuccin.com/palette/

---@type ThemeColors
return {
  meta = {
    name = "catppuccin",
    style = "mocha"
  },

  -- Common colors
  white =    '#cdd6f4',
  gray =     '#585b70',
  black =    '#11111b',
  red =      '#f38ba8',
  green =    '#a6e3a1',
  yellow =   '#f9e2af',
  blue =     '#89b4fa',
  paleblue = '#74c7ec',
  cyan =     '#94e2d5',
  purple =   '#cba6f7',
  orange =   '#fab387',
  pink =     '#f5c2e7',

  -- Dark colors
  darkred =    '#f38ba8',
  darkgreen =  '#a6e3a1',
  darkyellow = '#f9e2af',
  darkblue =   '#89b4fa',
  darkcyan =   '#94e2d5',
  darkpurple = '#cba6f7',
  darkorange = '#fab387',

  error =  '#f38ba8',
  link =   '#94e2d5',
  cursor = '#f5e0dc',
  title =  '#cdd6f4',

  none =         'NONE',
  bg =           '#1e1e2e',
  bg_alt =       '#181825',
  fg =           '#cdd6f4',
  text =         '#cdd6f4',
  comments =     '#9399b2',
  -- Current line in telescope or lines in context menus
  selection =    '#1F2233',
  contrast =     '#2a2b3c',
  -- Inactive scope line
  active =       '#313244',
  border =       '#313244',
  line_numbers = '#6c7086',
  -- Number of line on lualine (bottom right corner)
  highlight =    '#181825',
  -- Not used variables
  disabled =     '#464B5D',
  accent =       '#b4befe',
  -- Selection area in visual modes
  visual =       '#353648',
  ["@variable.member"] = '#cdd6f4',
  ["@punctuation"] =  '#f38ba8',

  git = {
    added = '#a6e3a1',
    modified = '#89b4fa',
    removed = '#f38ba8'
  }
}
