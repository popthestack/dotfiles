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

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/usr/local/share/npm/bin:$PATH

# export PS1="\`if [ \$? != 0 ]; then echo \[\e[31m\]ಠ_ಠ \[\e[0m\]; fi\`\[\033[01;34m\]\[\033[01;32m\]\w\[\033[00;33m\] \[\033[01;36m\]λ\[\033[00m\] "
# export PS2='\[\e[m\]\[\e[01;31m\]>\[\e[m\] '

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

function _update_ps1() {
  PS1="$($GOPATH/bin/powerline-go -cwd-mode plain -condensed -mode patched -modules "nix-shell,venv,ssh,cwd,perms,git,hg,jobs,exit,root,vgo" -error $?)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export NODE_PATH=/usr/local/lib/node_modules

export CC=gcc

# enable ctrl+o in bash on OS X
stty discard undef

# add ctrl-s as a step-forward option (i-search, whereas ctrl-r is reverse-i-search)
stty -ixon

function title {
    echo -ne "\033]0;"$*"\007"
}
