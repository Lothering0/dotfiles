# In ~/.zshrc type next line:
# source ~/dotfiles/zsh/.zshrc

export PATH=$PATH:/snap/bin
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG="$HOME/dotfiles/zsh"
export EDITOR=nvim
export KEYTIMEOUT=1
export NEOVIDE_MULTIGRID=true

alias code="code --disable-features=SendMouseLeaveEvents"
alias pr="cd ~/projects"
alias pl="cd ~/projects/playground"
# https://github.com/Lothering0/repl
alias js="node ~/projects/repl/index.js"

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
