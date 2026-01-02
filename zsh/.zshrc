export PATH=$PATH:~/.dotnet/tools

export XMONAD_CONFIG_DIR="$HOME/dotfiles/xmonad" # xmonad.hs is expected to stay here
export XMONAD_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/xmonad"
export XMONAD_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/xmonad"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG="$HOME/dotfiles/zsh"
export EDITOR=nvim
export KEYTIMEOUT=1
export NEOVIDE_MULTIGRID=true

source ~/dotfiles/zsh/.colors.zsh

if [ -f ~/dotfiles/zsh/.aliases.zsh ]; then
  source ~/dotfiles/zsh/.aliases.zsh
fi

if [ -f ~/dotfiles/zsh/.variables.zsh ]; then
  source ~/dotfiles/zsh/.variables.zsh
fi

alias xmonad-recompile="~/dotfiles/xmonad/xmonad_recompile.sh"
alias neofetch="neofetch --config ~/dotfiles/neofetch/config.conf"
alias fastfetch="fastfetch -c ~/dotfiles/fastfetch/config.jsonc"
alias code="code --disable-features=SendMouseLeaveEvents"
alias ghci="ghci -ghci-script ~/dotfiles/ghc/ghci.conf"
alias js="node ~/projects/pets/repl/index.js"  # https://github.com/Lothering0/repl

alias dt="cd ~/dotfiles"
alias pr="cd ~/projects"
alias pl="cd ~/projects/playground"

# Use powerline
USE_POWERLINE="true"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
)
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=false
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $HOME/dotfiles/zsh/.p10k.zsh

if [ -f ~/projects/shell-color-scripts/colorscript.sh ]; then
  ~/projects/shell-color-scripts/colorscript.sh random
fi

eval "$(zoxide init zsh --cmd cd)"
