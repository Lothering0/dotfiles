# Neovim config

## 1. Neovim installation

[How to install](https://github.com/neovim/neovim/wiki/Installing-Neovim).

## 2. Config installation

In "~/.config" directory create symlink named "nvim" to "~/dotfiles/nvim" directory

```sh
ln -s ~/dotfiles/nvim ~/.config
```

### 2.1. File constants.lua

Copy from constants.example.lua file constants.lua

```sh
cp ~/.config/nvim/lua/constants.example.lua ~/.config/nvim/lua/constants.lua
```

## 3. Install package manager Packer

[How to install](https://github.com/wbthomason/packer.nvim#quickstart).

### 3.1. Install packages

After installation done open Neovim and run command:

```
:PackerSync
```

If command ends with some errors, try to run it again

### 3.2. Install coc.nvim language server

To install language server run command:

```
:CocInstall <language server> [<language server> ...]
```

[Information about available servers and extensions](https://github.com/neoclide/coc.nvim/wiki/Insntall-coc.nvim#install-extensions-for-programming-languages-you-use-daily).

### 3.3. Install syntax highlighting

To set syntax highlighting for desired language run command below:

```
:TSInstall <language>
```

[List of supported languages](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages).

### 3.4. Install ripgrep for searching by all files

[How to install](https://github.com/BurntSushi/ripgrep#installation).
