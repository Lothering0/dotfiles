local helpers = require("helpers")
local lume = require("lume")
---@type ThemeColors
local colors = require("themes/init")

--- Returns a collection of highlightable plugins
---@param plugins Plugin[]
---@return PluginHighlights
---@nodiscard
local function get_highlights(plugins)
  --- Collection of highlightable plugins
  local highlights = {}

  for _, plugin in pairs(plugins) do
    --- A function, if plugin contains highlights
    local highlights_getter = type(plugin) == "table" and plugin.highlights and plugin.highlights.get_highlights

    -- Merging highlights of plugin to collection
    if highlights_getter then
      highlights = lume.merge(highlights, highlights_getter(colors))
    end
  end

  return highlights
end

---@param plugins Plugin[]
local function apply_highlights(plugins)
  local highlights = get_highlights(plugins)
  helpers.defer(function()
    for name, value in pairs(highlights) do
      helpers.highlight(name, value)
    end
  end)
end

return apply_highlights
