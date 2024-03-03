local ternary = require("helpers").ternary
local constants = require("constants")
local HAS_STRING_BACKGROUND = constants.HAS_STRING_BACKGROUND

local function get_highlights(colors)
  return {
    ["@number"]                = { fg = colors["@number"] or colors.pink },
    ["@boolean"]               = { fg = colors["@boolean"] or colors.pink },
    ["@conditional"]           = { fg = colors["@conditional"] or colors.purple },
    ["@function"]              = { fg = colors["@function"] or colors.darkblue },
    ["@method"]                = { fg = colors["@function"] or colors.darkblue },
    -- attributes or decorators
    ["@attribute"]             = { fg = colors["@attribute"] or colors["@function"] or colors.darkblue },
    ["@type"]                  = { fg = colors["@type"] or colors.yellow },
    ["@type.builtin"]          = { fg = colors["@type.builtin"] or colors.yellow },
    ["@constant.builtin"]      = { fg = colors["@constant.builtin"] or colors.pink },
    ["@variable.builtin"]      = { fg = colors["@variable.builtin"] or colors.error },
    ["@variable"]              = { fg = colors["@variable"] or colors.fg },
    ["@keyword"]               = { fg = colors["@keyword"] or colors.purple },
    ["@keyword.import"]        = { fg = colors["@keyword.import"] or colors["@keyword"] or colors.purple },
    ["@keyword.operator"]      = { fg = colors["@keyword.operator"] or colors.cyan },
    ["@exception"]             = { fg = colors["@exception"] or colors.purple },
    ["@parameter"]             = { fg = colors["@parameter"] or colors.orange },
    ["@parameter.reference"]   = { fg = colors["@parameter.reference"] or colors.orange },
    ["@repeat"]                = { fg = colors["@repeat"] or colors.purple },
    ["@string"]                = {
      fg = colors["@string"] or colors.darkgreen,
      bg = ternary(HAS_STRING_BACKGROUND, colors.string_bg, nil)
    },
    ["@include"]               = { fg = colors["@include"] or colors.purple },
    ["@property"]              = { fg = colors["@property"] or colors.gray },
    ["@type.qualifier"]        = { fg = colors["@type.qualifier"] or colors.purple },
    ["@constructor"]           = { fg = colors["@constructor"] or nil },
    ["@operator"]              = { fg = colors["@operator"] or colors.cyan },
    ["@punctuation"]           = { fg = colors["@punctuation"] or colors.yellow },
    ["@punctuation.bracket"]   = { fg = colors["@punctuation"] or colors.white },
    ["@punctuation.delimiter"] = { fg = colors["@punctuation.delimiter"] or colors.operator or colors.cyan },
    ["@tag"]                   = { fg = colors["@tag"] or colors.darkred },
    ["@tag.delimiter"]         = { fg = colors["@tag.delimiter"] or colors.cyan },
    jsonNumber = { link = "@number" },
    jsonBoolean = { link = "@boolean" },
    jsonString = { link = "@string" },
    jsonNull = { link = "@constant.builtin" },
    jsonKeyword = { link = "@property" },
    jsonBraces = { link = "@punctuation" },
    Number = { link = "@number" },
    String = { link = "@string" },
    Function = { link = "@function" },
    Repeat = { link = "@repeat" },
    Operator = { link = "@operator" },
    Exception = { link = "@exception" },
    Conditional = { link = "@conditional" },
    Statement = { link = "@keyword" },
    Comment = { fg = colors.comments },
    --[[Type = { fg = colors.yellow },
    StorageClass = { fg = colors.yellow },
    Structure = { fg = colors.purple },
    Exception = { fg = colors.cyan },
    Special = { fg = colors.purple },
    SpecialChar = { fg = colors.cyan },
    Tag = { fg = '#FF0000' },
    Function = { fg = colors.purple }--]]
  }
end

return { get_highlights = get_highlights }
