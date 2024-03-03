local function get_highlights(colors)
  return {
    GitGutterAdd = { fg = colors.git.added },
    GitGutterChange = { fg = colors.git.modified },
    GitGutterDelete = { fg = colors.git.removed },
  }
end

return { get_highlights = get_highlights }
