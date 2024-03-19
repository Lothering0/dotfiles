---@meta

---@class Plugin
---@field highlights PluginHighlightsExport

---@alias PluginHighlights table<string, HighlightOptions?>

---@alias PluginHighlightsGetter fun(colors: ThemeColors): PluginHighlights

---@class PluginHighlightsExport
---@field get_highlights PluginHighlightsGetter
