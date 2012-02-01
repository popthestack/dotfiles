#!/bin/bash
#
# A better PS1 for Git
#
# Author: Justin Hileman (http://justinhileman.com)
#
# Installation:
#     Add the following function to your `.bashrc` or `.bash_profile`,
#     or save it somewhere (e.g. `~/.gps1.bash`) and source it in `.bashrc`

__gps1() {
	local _pretty_pwd
	local _project
	local _ref
	local _stat_flags
	local _base_dir
	local _sub_dir
	local _stat_color

	# ansi terminal colors
	if [ "$TERM" != "dumb" ]; then
		export  normal=$(printf '\e[0m')

		export     red=$(printf '\e[0;31m')
		export   green=$(printf '\e[0;32m')
		export  yellow=$(printf '\e[0;33m')
		export    blue=$(printf '\e[0;34m')
		export magenta=$(printf '\e[0;35m')
		export    cyan=$(printf '\e[0;36m')
		export   white=$(printf '\e[0;37m')

		export     RED=$(printf '\e[1;31m')
		export   GREEN=$(printf '\e[1;32m')
		export  YELLOW=$(printf '\e[1;33m')
		export    BLUE=$(printf '\e[1;34m')
		export MAGENTA=$(printf '\e[1;35m')
		export    CYAN=$(printf '\e[1;36m')
		export   WHITE=$(printf '\e[1;37m')
	fi

	__gps1_prompt_command() {
		local last_command

		[ -z "$PS0" ] && PS0=$PS1

		function parse_git_dirty {
			git diff --no-ext-diff --quiet --exit-code > /dev/null 2>&1 || echo "*"
		}
		function parse_git_staged {
			git diff --cached --no-ext-diff --quiet --exit-code > /dev/null 2>&1 || echo "~"
		}
		function parse_git_ahead {
			git branch -v 2> /dev/null | grep -Eo '^\* [^ ]* *[^ ]* *\[[^]]*\]' | grep -Eo '\[[^]]*\]$' | awk 'ORS="";/ahead/ {print "+"} /behind/ {print "-"}'
		}
		function parse_git_stashed {
			git rev-parse --verify refs/stash >/dev/null 2>&1 && echo "$"
		}
		function parse_git_branch {
	#		__git_ps1 "%s"
			git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
		}

		last_command=$(history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g")

		if [ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then

			# find the parent dir and project name
			if [ $(git --version|sed -e 's/[a-z \.]//g'|grep -Eo '[[:digit:]]{3}') -ge 170 ]; then
				_base_dir=$(git rev-parse --show-toplevel 2>/dev/null)
			else
				_base_dir=$(readlink -f ./$(git rev-parse --show-cdup))
			fi
			_project=$(basename "${_base_dir}")
			_base_dir="${_base_dir%$_project}"
			_base_dir="${_base_dir/$HOME/~}"

			# find the path relative to project root
			_sub_dir=$(git rev-parse --show-prefix)
			_sub_dir="${_sub_dir%/}"
			[[ -n $_sub_dir ]] && _sub_dir="/$_sub_dir"

			# get the current branch
			_ref=$(parse_git_branch)
			[[ "$_ref" = '(no branch)' ]] && _ref="$(git rev-parse --short HEAD)…"

			# save these for later
			local _st_dirty="$(parse_git_dirty)"
			local _st_staged="$(parse_git_staged)"
			local _st_ahead="$(parse_git_ahead)"
			local _st_stashed="$(parse_git_stashed)"

			_stat_flags="${_st_dirty}${_st_staged}${_st_ahead}${_st_stashed}"
			[[ -n "$_stat_flags" ]] && _stat_flags=" $_stat_flags"

			if [ -n "$_st_dirty" ] || [ -n "$_st_staged" ]; then
				_stat_color=$RED
			elif [ -n "$_st_stashed" ]; then
				_stat_color=$YELLOW
			else
				_stat_color=$green
			fi
			PS1=${PS0/\\w/$GPS1}
		else
			PS1=$PS0
		fi

		_pretty_pwd="${PWD/$HOME/~}"
	}

	# Add some awesomeness here.
	if [[ ! $PROMPT_COMMAND =~ __gps1_prompt_command ]]; then
		export PROMPT_COMMAND="__gps1_prompt_command; ${PROMPT_COMMAND:-:}"
	fi

	GPS1='\[${blue}\]${_base_dir}\[${WHITE}\]${_project}\[${normal}\][\[${_stat_color}\]${_ref}${_stat_flags}\[${normal}\]]\[${blue}\]${_sub_dir}\[${normal}\]'
}
__gps1
