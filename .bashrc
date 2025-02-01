export LANG=en_US.UTF-8

if [ -f ~/.exports.bash ]; then
  source ~/.exports.bash
fi

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

function title {
  echo -ne "\033]0;"$*"\007"
}

# enable ctrl+o in bash on OS X
stty discard undef

# add ctrl-s as a step-forward option (i-search, whereas ctrl-r is reverse-i-search)
stty -ixon

eval $(thefuck --alias)
eval "$(mise activate bash)"
# make sure this is the last line:
eval "$(starship init bash)"
