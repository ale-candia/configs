######## PROMPT ########

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '[%b] '
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
#PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '
PROMPT='%F{green}%n%f :: %F{red}%1~%f ${vcs_info_msg_0_}> '

######## Editor ########

export EDITOR=vim

######## Aliases ########

alias ls="ls --color"
alias la="ls -a --color"
alias ll="ls -l --color"

alias qmake="/opt/homebrew/opt/qt@5/bin/qmake"

######## Completion ########

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -U compinit; compinit

######## Functionality ########

# Make ctrl-a and ctrl-e work inside tmux
bindkey -e

######## NVM (Node Version Manager) ########
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Angular CLI autocompletion.
source <(ng completion script)
