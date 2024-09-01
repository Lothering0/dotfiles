---@type ThemeColors
return {
  meta = {
    name = "material",
    style = "ocean"
  },

  -- Common colors
  white =    '#EEFFFF',
  gray =     '#717CB4',
  black =    '#000000',
  red =      '#F07178',
  green =    '#C3E88D',
  yellow =   '#FFCB6B',
  blue =     '#82AAFF',
  paleblue = '#B0C9FF',
  cyan =     '#89DDFF',
  purple =   '#C792EA',
  orange =   '#F78C6C',
  pink =     '#FF9CAC',

  -- Dark colors
  darkred =    '#DC6068',
  darkgreen =  '#ABCF76',
  darkyellow = '#E6B455',
  darkblue =   '#6E98EB',
  darkcyan =   '#71C6E7',
  darkpurple = '#B480D6',
  darkorange = '#E2795B',

  error =  '#FF5370',
  link =   '#80CBC4',
  cursor = '#FFCC00',
  title =  '#EEFFFF',

  none =         'NONE',
  bg =           '#0F111A',
  bg_alt =       '#090B10',
  fg =           '#A6ACCD',
  text =         '#717CB4',
  comments =     '#464B5D',
  -- Current line in telescope or lines in context menus
  selection =    '#1F2233',
  contrast =     '#090B10',
  -- Inactive scope line
  active =       '#1A1C25',
  border =       '#232637',
  line_numbers = '#3B3F51',
  -- Number of line on lualine (bottom right corner)
  highlight =    '#1F2233',
  -- Not used variables
  disabled =     '#464B5D',
  accent =       '#84FFFF',
  -- Selection area in visual modes
  visual =       '#2d324a',
  -- ["@punctuation"] =  '#FFD700',
  ["@punctuation"] =  '#89DDFF',
  ["@operator"] =     '#B480D6',

  git = {
    added = '#ABCF76',
    modified = '#6E98EB',
    removed = '#DC6068'
  }
}
