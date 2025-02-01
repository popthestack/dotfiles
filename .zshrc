DISABLE_AUTO_TITLE="true"

if [ -f ~/.zsh_exports ]; then
  source ~/.zsh_exports
fi

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

function title() {
  echo -en "\e]2;$@\a"
}

# enable ctrl+o in bash on OS X
stty discard undef

# add ctrl-s as a step-forward option (i-search, whereas ctrl-r is reverse-i-search)
stty -ixon

eval $(thefuck --alias)
eval "$(mise activate zsh)"
# make sure this is the last line:
eval "$(starship init zsh)"
