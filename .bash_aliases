alias ll='ls -l'
alias la='ls -la'
alias l='ls -CF'
alias ls='ls -G'
alias lh='ls -lh'

alias g='git'
alias gi='git'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gls='git shortlog -sn'
alias gsn='git status -uno'
alias gksdiff='git difftool -y -t Kaleidoscope'
alias gg='rg -SF'
alias ggi='rg -iF'
alias get='git'

alias rg='rg -SF'
alias gg='rg -SF'

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
  #eval "`dircolors -b`"
  alias grep='grep --exclude=".git" --exclude=".swp" --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
else
  alias grep='grep --exclude-dir=".git" --exclude=".git" --exclude=".swp"'
fi

alias npmrun='npm run -s'
alias nodewrap='NODE_NO_READLINE=1 rlwrap node'

alias argh='sudo $(history -p \!\!)'

alias dc='docker-compose'
alias rm-docker='docker rm $(docker ps -q -f "status=exited");docker rmi $(docker images -q -f "dangling=true")'
alias rm-docker-force='docker rm --force $(docker ps -q -f "status=exited");docker rmi --force $(docker images -q -f "dangling=true")'
