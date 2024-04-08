local packer = require("packer")

-- Command for fast creating a snapshot. Path: ~/dotfiles/nvim/snapshots/YYYY-MM-DDTHH-mm-ss
vim.api.nvim_create_user_command(
  "PackerFastSnapshot",
  function()
    local file_name = os.date("%Y-%m-%dT%H-%M-%S")
    packer.snapshot(file_name)
    print("Created snapshot file: ~/dotfiles/nvim/snapshots/" .. file_name)
  end,
  { nargs = 0 }
)
