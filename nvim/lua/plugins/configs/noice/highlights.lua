local function get_highlights(colors)
  return {
    NoiceCmdlinePopup = { bg = colors.contrast },
    NoiceCmdlinePopupBorder = { fg = colors.border },
    NoiceCmdlinePopupBorderSearch = { fg = colors.darkyellow },
    NoiceCmdlineIconSearch = { fg = colors.darkyellow },
  }
end

return { get_highlights = get_highlights }
