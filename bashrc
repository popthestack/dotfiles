export LANG=en_US.UTF-8

if [ -f ~/bin/ansicolor ]; then
    source ~/bin/ansicolor
fi
if [ -f ~/.gps1.bash ]; then
    source ~/.gps1.bash
fi
if [ -f ~/.exports.bash ]; then
    source ~/.exports.bash
fi

username=`whoami`

alias g='git'
alias gi='git'
alias gt='git'
alias gs='git status'
alias gsn='git status -uno'
alias gg='git grep -F'
alias ggi='git grep -iF'

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
	alias ll='ls -l'
	alias la='ls -la'
	alias l='ls -CF'
	alias ls='ls -G'
	alias get='git'
    #eval "`dircolors -b`"
    alias grep='grep --exclude=".svn" --exclude=".swp" --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias grep='grep --exclude=".svn" --exclude=".swp"'
fi

PROMPT_HOSTNAME=''
# export PS1="\u@$PROMPT_HOSTNAME:$C_BLUE\w$C_CYAN$C_RESET$ "
export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]\u $PROMPT_HOSTNAME\[\e[0m\]; else echo \[\e[31m\]ಠ_ಠ \[\e[0m\]; fi\`\[\033[01;34m\]\$(~/.rvm/bin/rvm-prompt) \[\033[01;32m\]\w\[\033[00;33m\] \[\033[01;36m\]λ\[\033[00m\] "
export PS2='\[\e[m\]\[\e[01;31m\]>\[\e[m\] '

export GOPATH=$HOME/go/bin

export PATH=$HOME/bin:/usr/local/Cellar/python:/usr/local/bin:/usr/local/opt/ruby/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/local/Cellar/ruby/2.1.0/bin:$PATH
export PATH=$PATH:/usr/local/Cellar/go/1.2.1/libexec/bin:$GOPATH

export CC=gcc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export TODO=~/Dropbox/todo.txt

function todo() {
  # $# is the number of parameters passed in
  if [[ $# == "0" ]];
    then
cat $TODO;
    else
      # $@ is a string containing all parameters
      echo "• $@" >> $TODO;
  fi
}

function todone() {
  # $@ is all the arguments passed in.
  # not sure what d is. Flag to delete anything that matches?
  sed -i -e "/$@/d" $TODO;
}

# enable ctrl+o in bash on OS X
stty discard undef

# add ctrl-s as a step-forward option (i-search, whereas ctrl-r is reverse-i-search)
stty -ixon

