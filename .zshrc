######## PROMPT ########

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '[%b] '
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{green}%n%f :: %F{red}%1~%f ${vcs_info_msg_0_}> '

######## Editor ########

export EDITOR=vim

######## Aliases ########

alias ls="ls --color"
alias la="ls -a --color"
alias ll="ls -l --color"

######## Completion ########

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -U compinit; compinit

######## Functionality ########

# Make ctrl-a and ctrl-e work inside tmux
bindkey -e

######## NVM (Node Version Manager) ########
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
