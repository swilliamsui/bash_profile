source ~/.profile_dir/swilliamsui-bash-profile-sources.sh

# added by travis gem
[ -f /Users/swilliams/.travis/travis.sh ] && source /Users/swilliams/.travis/travis.sh

export NVM_DIR="/Users/swilliams/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export NODE_ENV="development"

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=/Users/stephenwilliams/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/Applications/Postgres.app/Contents/Versions/9.6/bin # reset path

# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh  ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

[ -f ~/.gpg-agent-info  ] && source ~/.gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}"  ]; then
	export GPG_AGENT_INFO
else
	eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info  )
fi

export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
	. "$(brew --prefix nvm)/nvm.sh"

# nodegit needs for SSH Agent
SSH_ENV="$HOME/.ssh/environment"


function start_agent {
	echo "Initialising new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	echo succeeded
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" > /dev/null
	/usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}"  ]; then
	. "${SSH_ENV}" > /dev/null
	#ps ${SSH_AGENT_PID} doesn't work under cywgin
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
		start_agent;
	}
else
	start_agent;
fi
