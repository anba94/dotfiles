export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git zsh-autosuggestions kubectl zsh-syntax-highlighting fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

alias cat="bat"
alias ls="eza --icons"
alias ll="eza -lahg --icons"
alias ..="cd .."
alias ...="cd ../.."

alias perp='function _perp(){ query="$@"; encoded_query=$(echo "$query"
       │  | sed "s/ /%20/g"); xdg-open "https://www.perplexity.ai/?q=$encoded_qu
       │ ery"; }; _perp'

eval $(thefuck --alias)

# Start zellij if not already inside a zellij session
#if command -v zellij &> /dev/null && [ -z "$ZELLIJ" ]; then
#  zellij attach || zellij
#fi

export PATH=$(go env GOPATH)/bin:$PATH
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"


pokemon-colorscripts -r --no-title