# In ~/.zshrc type next line:
# source ~/dotfiles/zsh/.zshrc

export XMONAD_CONFIG_DIR="$HOME/dotfiles/xmonad" # xmonad.hs is expected to stay here
export XMONAD_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/xmonad"
export XMONAD_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/xmonad"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG="$HOME/dotfiles/zsh"
export EDITOR=nvim
export KEYTIMEOUT=1
export NEOVIDE_MULTIGRID=true

if [ -f ~/dotfiles/zsh/.aliases.zsh ]; then
  source ~/dotfiles/zsh/.aliases.zsh
fi

alias neofetch="neofetch --config ~/dotfiles/neofetch/config.conf"
alias code="code --disable-features=SendMouseLeaveEvents"
alias dt="cd ~/dotfiles"
alias pr="cd ~/projects"
alias pl="cd ~/projects/playground"
alias js="node ~/projects/repl/index.js" # https://github.com/Lothering0/repl

# Use powerline
USE_POWERLINE="true"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
)
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $HOME/dotfiles/zsh/.p10k.zsh
