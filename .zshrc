# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crunch"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search autojump zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
eval "$(rbenv init -)"
alias g='grep --color=always -n --exclude=\*.svn\*'
alias gs='screen'
alias mdiff='mvim -d'
alias bndl='bundle install --binstubs --path vendor/bundle'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias killchrome="ps aux | grep -i chrome | cut -d ' ' -f2 | xargs kill -9"
alias t="/usr/local/Cellar/todo-txt/2.9/bin/todo.sh"
source /usr/local/Cellar/todo-txt/2.9/etc/bash_completion.d/todo_completion complete -F _todo t
export EDITOR=/usr/bin/vim
export GREP_OPTIONS="--exclude=\*.svn\*"
alias tmux="TERM=screen-256color-bce tmux"
alias gh="open \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`"
alias gits="git s"
alias update-chromedriver=~/workspace/dotfiles/update_chromedriver.sh
alias edna-copy="rm -rf ~/workspace/edna-acceptance/public && mkdir ~/workspace/edna-acceptance/public && cp -R ~/workspace/edna/public ~/workspace/edna-acceptance/public/web"

#for vi mode
#http://dougblack.io/words/zsh-vi-mode.html
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1

#work related env variables
export CONFIG=vagrant
export VAGRANT_DIRECTORY=/Users/matthewrobbins/workspace/dev_environment
