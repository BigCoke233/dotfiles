# ====== Network ====== #

# Proxy
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"

# ===== XDG Standards ====== #

# XDG Base Directory Specification https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$UID"
# XDG Base Directory Specification end

# Home Immigration to mach XDG Standard
export GOPATH="$XDG_DATA_HOME"/go
export LESSHISTFILE="${XDG_STATE_HOME}"/lesshst
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export LEMMINX_WORKSPACE_DIR="$XDG_CACHE_HOME/lemminx"
alias mvn="mvn -gs $XDG_CONFIG_HOME/maven/settings.xml"
# END

export PATH="$HOME/bin:$PATH"

# ====== Apps ====== #

# GPG
export GPG_TTY=$(tty)

# Oh My Zsh
export ZSH="$XDG_CONFIG_HOME/zsh/ohmyzsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ====== Custom Aliases ======= #

# Python
alias python='/usr/bin/python3'

# cd into one dir and list its content
peek() {
  # if no argument passed → list subdirectories in current directory
  if [ "$#" -eq 0 ]; then
    echo "📂 Subdirectories of $(pwd):"
    # list only directories, one per line
    ls -d -- */ 2>/dev/null || echo "(no subdirectories)"
    return
  fi

  # otherwise, loop through all given arguments
  for dir in "$@"; do
    if [ -d "$dir" ]; then
      (
        cd "$dir" || exit
        echo "📁 $(pwd):"
        facad
        echo
      )
    else
      echo "peek: '$dir' is not a directory"
    fi
  done
}

# mkdir and cd
mkcd() {
  if [ -z "$1" ]; then
    echo "Usage: mkcd <directory>"
    return 1
  fi

  mkdir -p "$1" && cd "$1" || return
}

# cd ../
back() {
  cd ../
}
