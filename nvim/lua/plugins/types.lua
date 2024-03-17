---@meta

---@class Plugin
---@field highlights PluginHighlightsExport

---@alias PluginHighlights table<string, HighlightOptions>

---@alias PluginHighlightsGetter fun(colors: any): PluginHighlights

---@class PluginHighlightsExport
---@field get_highlights PluginHighlightsGetter
