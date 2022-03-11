export LANG=en_US.UTF-8

if [ -f ~/.exports.bash ]; then
    source ~/.exports.bash
fi

username=`whoami`

alias g='git'
alias gi='git'
alias gs='git status'
alias gsn='git status -uno'
alias gksdiff='git difftool -y -t Kaleidoscope'
alias gg='rg -SF'
alias ggi='rg -iF'

alias npmrun='npm run -s'

alias argh='sudo $(history -p \!\!)'

alias nodewrap='NODE_NO_READLINE=1 rlwrap node'

alias dc='docker-compose'
alias rm-docker='docker rm $(docker ps -q -f "status=exited");docker rmi $(docker images -q -f "dangling=true")'
alias rm-docker-force='docker rm --force $(docker ps -q -f "status=exited");docker rmi --force $(docker images -q -f "dangling=true")'

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
  alias ll='ls -l'
  alias la='ls -la'
  alias l='ls -CF'
  alias ls='ls -G'
  alias lh='ls -lh'
  alias get='git'
  #eval "`dircolors -b`"
  alias grep='grep --exclude=".svn" --exclude=".swp" --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
else
  alias grep='grep --exclude-dir=".git" --exclude=".svn" --exclude=".swp"'
fi

export GOPATH=$HOME/go
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/usr/local/share/npm/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules
export CC=gcc

# enable ctrl+o in bash on OS X
stty discard undef

# add ctrl-s as a step-forward option (i-search, whereas ctrl-r is reverse-i-search)
stty -ixon

function title {
    echo -ne "\033]0;"$*"\007"
}

# make sure this is the last line
eval "$(starship init bash)"
