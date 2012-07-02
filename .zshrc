# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
# export ZSH_THEME="kolo"
export ZSH_THEME="tom"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git osx ruby rails) # TOM 30/4/2012 Tried removing plugins to see if it would make things faster
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

bindkey '^j' vi-cmd-mode

source ~/.tomrc
