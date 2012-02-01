export LANG=en_US.UTF-8

source ~/bin/ansicolor
source ~/.gps1.bash

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
export PS1="\u@$PROMPT_HOSTNAME:$C_BLUE\w$C_CYAN$C_RESET$ "
export PS2='\[\e[m\]\[\e[01;31m\]>\[\e[m\] '

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/local/share/python:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH

export CC=gcc-4.2

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
