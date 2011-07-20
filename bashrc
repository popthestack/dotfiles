export LANG=en_US.UTF-8

source ~/bin/ansicolor

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

PROMPT_HOSTNAME='muaddib'
#export PS1="\u@$PROMPT_HOSTNAME:$C_BLUE\w$C_CYAN\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1)')\"\`$C_RESET$ "
export PS1="\u\[\e[01;32m\]★ $C_LIGHT_BLUE\w$C_CYAN\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1)')\"\`$C_RESET$ "
export PS2='\[\e[m\]\[\e[01;31m\]>\[\e[m\] '

export PATH=$HOME/bin:/usr/local/bin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH
