# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
export PATH=$(go env GOPATH)/bin:$PATH
eval "$(starship init bash)"
alias cat='bat'
alias ll='eza -lahg --icons'
alias ..='cd ..'
alias ...='cd ../..'
HISTSIZE=1000
HISTFILESIZE=2000

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


pokemon-colorscripts -r --no-title
eval "$(zoxide init --cmd cd bash)"