source "$HOME/.aliases"

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups
# Append to history file
shopt -s histappend

VISUAL=vim
EDITOR="$VISUAL"
PSQL_EDITOR='vim -c"setf sql"'
CLICOLOR=1

export VISUAL EDITOR PSQL_EDITOR CLICOLOR

# PROMPT
# give the fullpaths of files passed in argv or piped through stdin
function fullpath {
	ruby -e '
	$stdin.each_line { |path| puts File.expand_path path }  if ARGV.empty?
	ARGV.each { |path| puts File.expand_path path }         unless ARGV.empty?
	' "$@"
}

# Prompt
function parse_git_branch {
	branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
	if [ "HEAD" = "$branch" ]; then
		echo "(no branch)"
	else
		echo "$branch"
	fi
}

function prompt_segment {
	# for colours: http://en.wikipedia.org/wiki/ANSI_escape_code#Colors
	# change the 30 to change the text
	# change the 45 to change the background
	if [[ ! -z "$1" ]]; then
		echo "\[\033[${2:-30};46m\]${1}\[\033[0m\]"
	fi
}

function build_mah_prompt {
	# time
	ps1="$(prompt_segment " \@ ")"

	# cwd
	ps1="${ps1} $(prompt_segment " \w ")"

	# git branch
	git_branch=`parse_git_branch`
	if [[ ! -z "$git_branch" ]]
	then
		ps1="${ps1} $(prompt_segment " $git_branch " 35)"
	fi

	# next line
	ps1="${ps1}\n\$ "

	# set prompt output
	# PS1="$ps1"
	PS1="$ps1"
}

PROMPT_COMMAND='build_mah_prompt'

# This is absolutely disgusting, but I can't find a better way to do it. It will colourize the
# standarderr red (but will print on stdout, and stdout on stderr)
function colour-red {
	ruby -e '$stderr.print "\e[31m", $stdin.read, "\e[0m"'
}
function colour-stderr-red {
	( $* 3>&1 1>&2- 2>&3- ) | colour-red
}

export HISTIGNORE="%*"

# export PATH=/usr/local/bin:$PATH

# Git Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

# RVM Completion
complete -C $rvm_scripts_path/rvm-completion.rb -o default rvm

alias et='vi'

# PostgreSQL
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# SSH Auto Completion of Remote Hosts
SSH_COMPLETE=( $(cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | egrep -v [0123456789]) )
complete -o default -W "${SSH_COMPLETE[*]}" ssh

if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

# WhoIs lookup
function isreg {
  dig soa $1 | grep -q ^$1 && echo "Yes" || echo "No"
}

# Load RVM in to shell
[[ -s "/Users/cdw/.rvm/scripts/rvm" ]] && source "/Users/cdw/.rvm/scripts/rvm"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
