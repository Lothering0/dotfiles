require('telescope').setup{
  defaults = {
    -- default is: { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    prompt_prefix = "   ",
    selection_caret = " ",
    prompt_title = "",
    results_title = "",
    file_ignore_patterns = {
      "node_modules",
      "dist",
      ".git/",
      -- TODO: make sure that ignore works for *-lock.json files
      "^package-lock.json",
      "^yarn-lock.json",
    },
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top"
      }
    }
  }
}
