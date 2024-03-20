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

--- Applies highlights in 1 ms after initialization
---@param highlights PluginHighlights
local function set_highlights_deferred(highlights)
  local timer = vim.loop.new_timer()

  timer:start(1, 0, vim.schedule_wrap(function()
    timer:stop()

    for name, value in pairs(highlights) do
      helpers.highlight(name, value)
    end
  end))
end

---@param plugins Plugin[]
local function apply_highlights(plugins)
  local highlights = get_highlights(plugins)
  set_highlights_deferred(highlights)
end

return apply_highlights
