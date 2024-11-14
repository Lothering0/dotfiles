vim.cmd [[packadd packer.nvim]]

local packer = require("packer")
packer.util = require("packer.util")

packer.init({
  snapshot_path = packer.util.join_paths(vim.fn.stdpath("config"), "snapshots"),
})

return packer.startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Bottom line  
  use { "nvim-lualine/lualine.nvim" }

  -- Another icons
  use { "nvim-tree/nvim-web-devicons" }

  -- Explorer
  use { "nvim-tree/nvim-tree.lua" }

  -- Buffers
  use {
    "akinsho/bufferline.nvim",
    tag = "*",
    requires = "nvim-tree/nvim-web-devicons",
  }

  -- Close buffer
  use { "famiu/bufdelete.nvim" }

  -- EasyMotion analog
  use { "phaazon/hop.nvim", branch = "v2" }

  -- Multi cursor
  use { "mg979/vim-visual-multi", branch = "master" }

  -- Material theme
  use { "marko-cerovac/material.nvim" }

  -- Color (hex/rgb) highlight
  use { "norcalli/nvim-colorizer.lua" }

  -- Highlight indentations
  use { "lukas-reineke/indent-blankline.nvim" }

  -- Set symbol on certain column
  use { "lukas-reineke/virt-column.nvim" }

  -- Syntax highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    -- To install: typescript javascript jsdoc lua luadoc haskell vue
  }

  -- Emmet
  use { "mattn/emmet-vim" }

  -- Required by Telescope
  use { "nvim-lua/plenary.nvim" }

  -- Telescope (git, explorer)
  use { "nvim-telescope/telescope.nvim" }

  -- Git changes file
  use { "airblade/vim-gitgutter" }

  -- Language server
  use {
    "neoclide/coc.nvim",
    branch = "release",
    run = ":CocInstall coc-highlight coc-prettier coc-eslint coc-sumneko-lua",
  }

  -- Plugin which replace native Neovim command line
  use { "folke/noice.nvim" }

  -- Required by Noice
  use { "MunifTanjim/nui.nvim" }

  -- Kitty configuration syntax highlighting
  use { "fladson/vim-kitty" }

  -- KMonad configuration syntax highlighting
  use { 'kmonad/kmonad-vim' }
end)
