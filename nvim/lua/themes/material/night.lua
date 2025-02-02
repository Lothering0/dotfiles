---@type ThemeColors
---@deprecated
return {
  meta = {
    name = "material",
    style = "night"
  },

  -- Common colors
  white =    '#EEFFFF',
  gray =     '#717CB4',
  black =    '#000000',
  red =      '#FF5F74',
  green =    '#D6FFAB',
  yellow =   '#FFBF60',
  blue =     '#7AA2F7',
  paleblue = '#B0C9FF',
  cyan =     '#08DAFF',
  purple =   '#A876FF',
  orange =   '#FF8D4C',
  pink =     '#FF9CAC',

  -- Dark colors
  darkred =    '#FF5F74',
  darkgreen =  '#D6FFAB',
  darkyellow = '#FFBF60',
  darkblue =   '#7AA2F7',
  darkcyan =   '#08DAFF',
  darkpurple = '#A876FF',
  darkorange = '#FF8D4C',

  error =  '#FF5F74',
  link =   '#80CBC4',
  cursor = '#75B5FF',
  title =  '#EEFFFF',

  none =         'NONE',
  bg =           '#16161E',
  bg_alt =       '#101014',
  fg =           '#A6ACCD',
  text =         '#717CB4',
  comments =     '#51597D',
  selection =    '#1F2233',
  contrast =     '#1E202E',
  active =       '#1A1C25',
  border =       '#232637',
  line_numbers = '#363b54',
  highlight =    '#1F2233',
  disabled =     '#464B5D',
  accent =       '#3d59a1',
  visual =       '#2D324A',
  ["@keyword"] = '#7AA2F7',
  ["@function"] = '#A876FF',
  ["@punctuation"] = '#EEFFFF',
  ["@variable"] = '#C78BFF',
  ["@variable.member"] = '#C78BFF',
  ["@variable.builtin"] = '#75B5FF',
  ["@variable.parameter"] = '#FF5F74',
  ["@type"] = '#FFBF60',
  -- ["@type"] =  '#75B5FF',
  -- ["@type.builtin"] =  '#08DAFF',
  ["@keyword.import"] =  '#54BEFB',
  ["@keyword.export"] =  '#54BEFB',
  -- ["@punctuation"] =  '#89DDFF',
  ["@operator"] =     '#89DDFF',
  ["@tag"]           = '#FF5F74',
  ["@tag.delimiter"] = '#BA3C97',

  folder =       '#A9B1D6',

  git = {
    added = '#D6FFAB',
    modified = '#7AA2F7',
    removed = '#FF5F74'
  }
}
