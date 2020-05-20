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
plugins=(rbenv git history-substring-search autojump zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="$HOME/.rbenv/bin:$HOME/bin:$HOME/bin/terraform:/Applications/Arduino.app/Contents/MacOS/:$HOME/sonar-scanner-3.3.0.1492-macosx/bin:$HOME/bin/groovy-2.5.9/bin:$PATH"
eval "$(rbenv init -)"
alias mi='mvn install'
alias g='grep --color=always -n --exclude=\*.svn\*'
alias gs='screen'
alias mdiff='mvim -d'
alias bndl='bundle install --binstubs --path vendor/bundle'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias killchrome="ps aux | grep -i chrome | cut -d ' ' -f2 | xargs kill -9"
export EDITOR=/usr/bin/vim
alias tmux="TERM=screen-256color-bce tmux"
alias gh="open \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`"
alias gits="git s"
alias update-chromedriver=~/workspace/dotfiles/update_chromedriver.sh
alias tagfile='rm -rf tags && ctags -R --exclude=vendor --languages=Ruby,JavaScript .'
alias hgrep='history | ag -i $1'
alias copydeps='mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.useRepositoryLayout=true -DoutputDirectory=output -Dmdep.addParentPoms=true -Dmdep.copyPom=true'
alias openports='sudo lsof -PiTCP -sTCP:LISTEN'

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
export TF_VAR_access_key="AKIAI3XMH7SEPEJTCY2Q"
export TF_VAR_secret_key="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"

docker_rm_containers_for_image() {
    docker ps -a | awk '{ print $1,$2 }' | grep $1 | awk '{print $1 }' | xargs docker rm
}


[ -s "/Users/ost/.jabba/jabba.sh" ] && source "/Users/ost/.jabba/jabba.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
