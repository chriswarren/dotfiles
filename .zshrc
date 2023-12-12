# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh
  export ZSH=$HOME/.oh-my-zsh
  export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/opt/homebrew/sbin
  HYPHEN_INSENSITIVE=true
  COMPLETION_WAITING_DOTS=true
  ZSH_DISABLE_COMPFIX=true

# plugins
  plugins=(autojump macos tmux)
  if [[ -f $ZSH/oh-my-zsh.sh ]]; then
    source $ZSH/oh-my-zsh.sh
  fi

  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# terminal color settings
  CLICOLOR=1
  export EDITOR="nvim"
  [[ $TMUX != "" ]] && export TERM="screen-256color"
  
  alias vi=$EDITOR
  alias vim=$EDITOR

# shell aliases
  alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
  alias e=$EDITOR
  alias help='navi'
  alias less="less -R"
  alias lf="less +F"
  alias ll="ls -la"
  alias g='git'
  alias mkcd='mkdir $1 && cd $1'
  alias ..="cd ../"
  alias ...="cd ../../"
  alias ....="cd ../../../"

# git aliases
  alias gap='git add -p'
  alias gnap='git add -N --ignore-removal . && gap'
  alias glp='git log -p'
  alias glg='git log --graph --oneline --decorate --color --all'
  alias gb='git branch'
  alias gc='git commit -v'
  alias gca='git commit -a -v'
  alias gcl='git clean -f -d'
  alias gd='git diff'
  alias gdc='git diff --cached'
  alias gdh='git diff HEAD'
  alias gl='git pull'
  alias glod='git log --oneline --decorate'
  # alias glod='git log --graph --pretty="%Cgreen%h%Creset%Cblue%d%Creset %Cred%an%Creset: %s"'
  alias gp='git push'
  alias gpr='git pull --rebase'
  alias gst='git status'
  alias gr='git rebase'
  alias grc='git rebase --continue'
  alias gra='git rebase --abort'
  alias gco='git checkout'
  alias gsm='git switch main && git pull --rebase'
  alias reset-authors='git commit --amend --reset-author -C HEAD'

# project aliases
  alias workzone='tmuxinator start tce-dev'

# standardrb aliases
  alias stdn='rm -f .standard_todo.yml && bundle exec standardrb --generate-todo'
  alias stdtmp='mv .standard_todo.yml .standard_todo.tmp'
  alias stdc='cat .standard_todo.tmp | grep "  - " | sort | uniq -c | sort -n'

# shell functions
  function move-last-download {
    local download_dir="${HOME}/Downloads/"
    local last_download="$(ls -t ${download_dir} | head -1)"
    local destination_file="${PWD}/${1:-${last_download}}"

    echo "MV: ${download_dir}${last_download}"
    echo "TO: ${destination_file}"

    mv "${download_dir}${last_download}" "${destination_file}"
  }

  function killports () {
    for port in "$@"; do
      pid=$(lsof -i tcp:$port -t)

      if [[ $pid ]]; then
        kill -9 $pid
        echo "killed port: $port"
      else
        echo "No proccess matching port: $port"
      fi
    done
  }

  function mkcd {
     mkdir -p "$1" && cd "$1"
  }

  # source env var file
  function cashcat {
    env $(cat "$1") "$2"
  }

# version management
#  source /usr/local/opt/asdf/asdf.sh
#  export PATH="$HOME/.asdf/shims:$PATH"

# ruby
  export CC=gcc
  alias be='bundle exec'

# import local zsh customizations, if present
  zrcl="$HOME/.zshrc.local"
  [[ ! -a $zrcl ]] || source $zrcl

# DOCKER
  export DEV_HOST="cdw.arux.dev"
  export MYSQL_ROOT_PASSWORD="rsRLDzn2bL1Yb4p"

# secrets
# source ~/.secrets

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rmv/bin"
