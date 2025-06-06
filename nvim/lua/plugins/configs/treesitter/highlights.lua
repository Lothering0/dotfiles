local ternary = require("helpers").ternary
local constants = require("constants")
local HAS_STRING_BACKGROUND = constants.HAS_STRING_BACKGROUND

---@type PluginHighlightsExport
return {
  get_highlights = function(colors)
    ---@type PluginHighlights
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
      ["@constant"]              = { fg = colors["@constant"] or colors.yellow },
      ["@constant.builtin"]      = { fg = colors["@constant.builtin"] or colors.pink },
      ["@variable.builtin"]      = { fg = colors["@variable.builtin"] or colors.error },
      ["@variable"]              = { fg = colors["@variable"] or colors.fg },
      ["@keyword"]               = { fg = colors["@keyword"] or colors.purple },
      ["@keyword.import"]        = { fg = colors["@keyword.import"] or colors["@keyword"] or colors.purple },
      ["@keyword.export"]        = { fg = colors["@keyword.export"] or colors["@keyword"] or colors.purple },
      ["@keyword.operator"]      = { fg = colors["@keyword.operator"] or colors.cyan },
      ["@keyword.coroutine"]     = { fg = colors["@keyword.coroutine"] or colors.cyan },
      ["@keyword.return"]        = { fg = colors["@keyword.return"] or colors["@keyword"] or colors.purple },
      ["@keyword.repeat"]        = { fg = colors["@keyword.repeat"] or colors["@keyword"] or colors.purple },
      ["@exception"]             = { fg = colors["@exception"] or colors.purple },
      ["@variable.parameter"]    = { fg = colors["@variable.parameter"] or colors.orange },
      ["@parameter.reference"]   = { fg = colors["@parameter.reference"] or colors.orange },
      ["@repeat"]                = { fg = colors["@repeat"] or colors.purple },
      ["@string"]                = {
        fg = colors["@string"] or colors.darkgreen,
        bg = ternary(HAS_STRING_BACKGROUND, colors.string_bg, nil)
      },
      ["@include"]               = { fg = colors["@include"] or colors.purple },
      ["@variable.member"]       = { fg = colors["@variable.member"] or colors.gray },
      ["@property"]              = { link = "@variable.member" },
      ["@type.qualifier"]        = { fg = colors["@type.qualifier"] or colors.purple },
      ["@constructor"]           = { fg = colors["@constructor"] or nil },
      ["@operator"]              = { fg = colors["@operator"] or colors.cyan },
      ["@punctuation"]           = { fg = colors["@punctuation"] or colors.yellow },
      ["@punctuation.bracket"]   = { fg = colors["@punctuation"] or colors.white },
      ["@punctuation.delimiter"] = { fg = colors["@punctuation.delimiter"] or colors.operator or colors.cyan },
      ["@tag"]                   = { fg = colors["@tag"] or colors.darkred },
      ["@tag.delimiter"]         = { fg = colors["@tag.delimiter"] or colors.cyan },
      ["@tag.attribute"]         = { fg = colors["@tag.attribute"] or colors.darkpurple },
      jsonNumber = { link = "@number" },
      jsonBoolean = { link = "@boolean" },
      jsonString = { link = "@string" },
      jsonNull = { link = "@constant.builtin" },
      jsonKeyword = { link = "@variable.member" },
      jsonBraces = { link = "@punctuation" },
      jsonQuote = { link = "@punctuation" },
      yamlBool = { link = "@boolean" },
      yamlMappingKey = { link = "@variable.member" },
      Number = { link = "@number" },
      String = { link = "@string" },
      Function = { link = "@function" },
      Repeat = { link = "@repeat" },
      Operator = { link = "@operator" },
      Exception = { link = "@exception" },
      Conditional = { link = "@conditional" },
      Statement = { link = "@keyword" },
      Comment = { fg = colors.comments },
      typescriptNumber        = { link = "@number" },
      typescriptBoolean       = { link = "@boolean" },
      typescriptImport        = { link = "@keyword.import" },
      typescriptExport        = { link = "@keyword.export" },
      typescriptTry           = { link = "@keyword" },
      typescriptExceptions    = { link = "@keyword" },
      typescriptKeywordOp     = { link = "@keyword" },
      typescriptVariable      = { link = "@keyword" },
      typescriptBraces        = { link = "@punctuation" },
      typescriptEndColons     = { link = "@punctuation" },
      typescriptTypeReference = { link = "@type" },
      typescriptInterfaceName = { link = "@type" },
      typescriptFuncKeyword   = { link = "@keyword" },
      typescriptFuncComma     = { link = "@punctuation" },
      typescriptMember        = { link = "@property" },
      typescriptConsoleMethod = { link = "@method" },
      typescriptTypeParameter = { link = "@type" },
      typescriptAliasDeclaration = { link = "@type" },
      typescriptAliasKeyword     = { link = "@keyword" },
      typescriptInterfaceKeyword = { link = "@keyword" },
      typescriptInterfaceExtends = { link = "@keyword" },
      typescriptFuncCallArg     = { link = "@parameter.reference" },
      typescriptReadonlyModifier = { link = "@keyword" },
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
}
