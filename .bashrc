parse_git_branch() {
	     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[38;5;226m\]\u\[$(tput sgr0)\] :: \[$(tput sgr0)\]\[\033[38;5;14m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;196m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"

alias ls='ls --color'
alias ll='ls -alF'
alias la='ls -A'

export EDITOR='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env"

source /home/ale/Local/alacritty/extra/completions/alacritty.bash

# History management
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:l:ll:lll"
