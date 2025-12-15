# homebrew
export HOMEBREW_FORCE_BREWED_GIT=1
export HOMEBREW_PIP_INDEX_URL="https://mirrors.tuna.tsinghua.edu.cn/simple"
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
eval $(/opt/homebrew/bin/brew shellenv)

export HOMEBREW=$(brew --prefix)
export PATH=${HOMEBREW}/include:$PATH
export LIBRARY_PATH=${HOMEBREW}/lib

export VISUAL="nvim"
export EDITOR="nvim"
export GIT_EDITOR="nvim"
#export DOTPATH="$( cd "$( dirname "$( readlink "$HOME/.zshrc" )/" )" && pwd )"

NEWLINE=$'\n'
PROMPT="%F{blue}%~ %#%f %F{green}%T%f${NEWLINE}"
export LESS='-Pslines %lt-%lb'

# completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# search history
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^r' history-beginning-search-menu

# history with up and down
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down

get_dark_mode () {
  osascript -e "tell app \"System Events\" to tell appearance preferences to get dark mode"
}

# proxy
p () {
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"
  echo "HTTP Proxy on"
}

np () {
  unset http_proxy
  unset https_proxy
  echo "HTTP Proxy off"
}

# mpv with nohup
mb () {
  nohup mpv ${*} >> ~/.cache/mpv_nohup.log &
}

# icloud path
icloud () {
  cd $HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs
}

# Move to CWD When Exiting Yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# alias if $2 exist
function alias_if_exist() {
  cmd=$(echo "$2" | cut -d ' ' -f 1) # get command without parameters
  if command -v $cmd &> /dev/null; then
    alias $1=$2
  fi
}

# gitui
function g() {
  if [[ $(get_dark_mode) == 'true' ]]; then
    gitui -t catppuccin-mocha.ron
  else
    gitui -t catppuccin-latte.ron
  fi
}

alias_if_exist sed gsed
alias_if_exist awk gawk
alias_if_exist grep ggrep
alias_if_exist ls "eza --icons -F"
alias_if_exist l "eza -l --color=auto --icons"
alias_if_exist ll "eza -l --color=auto --total-size --icons"
alias_if_exist tree "eza --tree"
alias_if_exist v nvim
alias_if_exist vi nvim
alias_if_exist vim nvim

alias q=exit

eval "$(zoxide init zsh)"
