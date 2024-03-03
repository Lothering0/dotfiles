local function get_highlights(colors)
  return {
    LualineGitAdded = { fg = colors.git.added, bg = colors.bg_alt, bold = true },
    LualineGitModified = { fg = colors.git.modified, bg = colors.bg_alt, bold = true },
    LualineGitDeleted = { fg = colors.git.removed, bg = colors.bg_alt, bold = true },
    lualine_b_diagnostics_warn_normal = { fg = colors.darkyellow, bg = colors.bg_alt },
    lualine_b_diagnostics_warn_insert = { link = "lualine_b_diagnostics_warn_normal" },
    lualine_b_diagnostics_warn_visual = { link = "lualine_b_diagnostics_warn_normal" },
    lualine_b_diagnostics_warn_replace = { link = "lualine_b_diagnostics_warn_normal" },
    lualine_b_diagnostics_warn_command = { link = "lualine_b_diagnostics_warn_normal" },
    lualine_b_diagnostics_warn_inactive = { link = "lualine_b_diagnostics_warn_normal" },
    lualine_b_diagnostics_warn_terminal = { link = "lualine_b_diagnostics_warn_normal" },
    lualine_b_diagnostics_hint_normal = { fg = colors.darkpurple, bg = colors.bg_alt },
    lualine_b_diagnostics_hint_insert = { link = "lualine_b_diagnostics_hint_normal" },
    lualine_b_diagnostics_hint_visual = { link = "lualine_b_diagnostics_hint_normal" },
    lualine_b_diagnostics_hint_replace = { link = "lualine_b_diagnostics_hint_normal" },
    lualine_b_diagnostics_hint_command = { link = "lualine_b_diagnostics_hint_normal" },
    lualine_b_diagnostics_hint_inactive = { link = "lualine_b_diagnostics_hint_normal" },
    lualine_b_diagnostics_hint_terminal = { link = "lualine_b_diagnostics_hint_normal" },
    -- Left separator of A section
    lualine_transitional_lualine_a_mode_to_StatusLine = { bg = colors.bg },
  }
end

return { get_highlights = get_highlights }
