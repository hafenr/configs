# === setup ===
UNAME_OUT="$(uname -s)"
case "${UNAME_OUT}" in
    Linux*)     OS=Linux;;
    Darwin*)    OS=Mac;;
    CYGWIN*)    OS=Cygwin;;
    MINGW*)     OS=MinGw;;
    *)          OS="UNKNOWN:${UNAME_OUT}"
esac

# Remap CapsLock to be both ESC and CTRL (install xcape first!)
if [ "$OS" = "Linux" ]; then
    setxkbmap -option ctrl:nocaps
    xcape -e 'Control_L=Escape'
fi

# === general settings ===
export EDITOR=vim
export LANG=en_US.UTF-8
stty -ixon

export HISTTIMEFORMAT="%d/%m/%y %T "

alias l='ls -alh'
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias co='column -t'
alias crick='ssh crick'
alias split-csv="column -s'|' -t | less -#2 -N -S"
alias dh='dirs -v' # show the cd history

alias gch='git checkout'
alias gs='git status'
alias gco='git commit'
alias gpl='git pull'
alias gps='git pull'

alias kbuild='kustomize build --enable_alpha_plugins --load_restrictor none'
alias teramake='make -f /Users/rhafen/dev/base-k8s/make/Makefile'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# === other settings ===
# tl-specific settings
export DELI_SECRETS_FILE=/Users/rhafen/deli-secrets.conf

# tmux
alias tmux="TERM=screen-256color tmux"

# java/scala
export JAVA_OPTS='-Xms2048m -Xmx2048m'
export SBT_OPTS="-Xmx6G -Xss4M"
export SCALA_HOME=/usr/local/Cellar/scala/2.12.1
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home

# python
## pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
## virtualenv
export WORKON_HOME=$HOME/.virtualenvs

# kubectl
alias kx=kubectx
alias ks=kubens

# spark/hadoop
export IPYTHON=1
export SPARK_LOCAL_IP="localhost"
#export HADOOP_HOME=/opt/hadoop-2.8.0
#export HADOOP_PREFIX=/opt/hadoop-2.8.0
#export HADOOP_CONF_DIR=/opt/hadoop-2.8.0/etc/hadoop
#export HADOOP_LIBEXEC_DIR=/opt/hadoop-2.8.0/libexec
export HADOOP_OPTS="-XX:-UseGCOverheadLimit"
export HADOOP_CLIENT_OPTS="-XX:-UseGCOverheadLimit -Xmx4096m"

alias hls='hdfs dfs -ls'
alias hget='hdfs dfs -get'
alias hput='hdfs dfs -put'
alias hcat='hdfs dfs -cat'

# path extensions
export PATH=$PATH:$PATH/bin

# === fzf ===
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules --ignore target -g ""'

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# Equivalent to above, but opens it with `open` command
fo() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && open "$file"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

fh() {
      eval $(([ -n "$ZSH_NAME"  ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

fk() {
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x"  ]
    then
        kill -${1:-9} $pid
    fi

}

[ -f ~/.fzf.bash ] && source ~/.fzf.zsh
