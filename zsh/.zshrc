# ------------------------------------------------------------------------------
# -> Before all
# ------------------------------------------------------------------------------

# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Include paths
export PATH=$HOME/bin:$HOME/.yarn/bin:/usr/local/bin:$PATH

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# ------------------------------------------------------------------------------
# -> General settings
# ------------------------------------------------------------------------------

# Set name of the theme to load
ZSH_THEME="refined"

# Load plugins
plugins=(
    git
    git-extras
    docker
    python
    pip
    composer
    archlinux
    nvm
)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------------------------
# -> Nvim
# ------------------------------------------------------------------------------

# Nvim default editor
export EDITOR='nvim'
