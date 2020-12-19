export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs time disk_usage ram)
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
#POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="\uF09C"
#POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
#POWERLEVEL9K_VCS_GIT_ICON='\uF408 '
#POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uF408 '

ZSH_DISABLE_COMPFIX=true

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  iterm2
  macports
  man
  osx
  python
  composer
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#===============================================================
# zsh-completionsの設定
autoload -U compinit && compinit -u

alias g='git'
alias gaa='git add .'
alias gap='git add -p'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push origin HEAD'
alias gsw='git switch'
alias gchb='git checkout -b'
alias gb='git branch'
alias gf='git fetch -p'
alias gs='git status'
alias gl='git log'
alias gll='git log --oneline'
alias gd='git diff'
alias gm='git merge --no-ff'
alias gri='git rebase -i'
alias gb-delete="git branch --merged | egrep -v '\*|deploy/staging|deploy/production|master' | xargs git branch -d"
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias r='ruby'
alias mss='mysql.server start'
alias msr='mysql.sercer restart'
alias so='source'
alias be='bundle exec'
alias rs='bundle exec rails s'
alias rc='bundle exec rails c'
alias r='bundle exec rspec'
alias erd='bundle exec erd --notation=uml --attributes=primary_keys,foreign_keys,content'
alias di='docker images'
alias dc='docker container'
alias de='docker exec -it'
alias doco='docker-compose'
alias t='tmux'
alias s='measurement start'
alias e='measurement stop'

function measurement() {
  config_path="${HOME}/.development_efficiency_measurement/config"
  url=`cat ${config_path} | grep url | sed s/url=// | awk '{ print }'`
  token=`cat ${config_path} | grep token | sed s/token=// | awk '{ print }'`
  user_id=`cat ${config_path} | grep user_id | sed s/user_id=// | awk '{ print }'`
  user_name=`cat ${config_path} | grep user_name | sed s/user_name=// | awk '{ print }'`
  curl -L "${url}?token=${token}&user_id=${user_id}&user_name=${user_name}&text=$1" \
    -sS -d "" -H "Content-Type: application/json" | jq
}

function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
   *.arj) unarj $1;;
    *.7z) 7z x $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz,7z}=extract
for file in $(ls -1); do
  extract $file;
done

# 文字コードの指定
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# cdなしでディレクトリ移動
setopt auto_cd

# ビープ音の停止
setopt no_beep

# ビープ音の停止(補完時)
setopt nolistbeep

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# ヒストリ(履歴)を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# キーバインディングをemacs風にする
bindkey -d
bindkey -e

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 追加したソフトやパッケージ用のコマンドのパスを通す
eval "$(anyenv init -)"
