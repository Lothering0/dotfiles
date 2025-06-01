-- See: https://catppuccin.com/palette/

---@type ThemeColors
return {
  meta = {
    name = "catppuccin",
    style = "latte"
  },

  -- Common colors
  white =    '#4c4f69',
  gray =     '#dce0e8',
  black =    '#acb0be',
  red =      '#d20f39',
  green =    '#40a02b',
  yellow =   '#df8e1d',
  blue =     '#1e66f5',
  paleblue = '#209fb5',
  cyan =     '#179299',
  purple =   '#8839ef',
  orange =   '#fe640b',
  pink =     '#ea76cb',

  -- Dark colors
  darkred =    '#d20f39',
  darkgreen =  '#40a02b',
  darkyellow = '#df8e1d',
  darkblue =   '#1e66f5',
  darkcyan =   '#179299',
  darkpurple = '#8839ef',
  darkorange = '#fe640b',

  error =  '#d20f39',
  link =   '#179299',
  cursor = '#dc8a78',
  title =  '#4c4f69',

  none =         'NONE',
  bg =           '#eff1f5',
  bg_alt =       '#e6e9ef',
  fg =           '#4c4f69',
  text =         '#4c4f69',
  comments =     '#7c7f93',
  -- Current line in telescope or lines in context menus, bracket pairs, matchings
  selection =    '#d7dae1',
  -- Current line
  contrast =     '#e3e6eb',
  -- Inactive scope line
  active =       '#ccd0da',
  border =       '#ccd0da',
  line_numbers = '#ccd0da',
  -- Number of line on lualine (bottom right corner)
  highlight =    '#e6e9ef',
  -- Not used variables
  disabled =     '#7c7f93',
  accent =       '#7287fd',
  -- Selection area in visual modes
  visual =       '#cbced7',
  ["@variable.member"] = '#4c4f69',
  ["@punctuation"] =  '#d20f39',

  git = {
    added = '#40a02b',
    modified = '#1e66f5',
    removed = '#d20f39'
  }
}
