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

perplexity() {
  if [ $# -eq 0 ]; then
    echo "Usage: perplexity <your query>"
  else
    query=$(echo "$*" | sed 's/ /+/g')
    url="https://www.perplexity.ai/?q=$query"
    if [[ "$OSTYPE" == "darwin"* ]]; then
      open "$url"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
      xdg-open "$url"
    else
      echo "Unsupported operating system"
    fi
  fi
}

alias ai='perplexity'

daily_task() {
    local dir="$HOME/obsidian/work/daylinotes"
    local date=$(date +"%Y-%m-%d")
    local file="$dir/$date.md"
    local timestamp=$(date +"%H:%M:%S")
    local entry="\n### $timestamp\n"
    
    for item in "$@"; do
        entry+="- [ ] $item\n"
    done

    echo -e "$entry" >> "$file"
    echo "Entry added to $file."
}

eval $(thefuck --alias)

# Start zellij if not already inside a zellij session
#if command -v zellij &> /dev/null && [ -z "$ZELLIJ" ]; then
#  zellij attach || zellij
#fi

export PATH=$(go env GOPATH)/bin:$PATH
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"


pokemon-colorscripts -r --no-title