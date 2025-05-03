# ~/.bashrc: Configuration for interactive bash shells in editing environment
# Enables git command completion and basic shell settings
# Designed for use with tmux, Vim, and gtags
# - Loads bash-completion for git (e.g., git sta<Tab> -> git status)
# - Supports ./bitcoin Volume for git operations (e.g., git commit)
# Sourced from: https://github.com/HowHsu/development/.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Enable bash completion
# Loads /usr/share/bash-completion/bash_completion for git and other commands
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# Set prompt to show user, host, and current directory
PS1='\u@\h:\w\$ '

# Enable color support for ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Define common aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
