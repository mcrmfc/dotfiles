#git_branch="\$(git symbolic-ref HEAD | sed -e 's|^refs/heads/||')"
#source ~/.git-completion.bash
#source ~/.git-prompt.sh
#PS1='\[\e[1;37m\]\[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]\[\e[1;35m\]$(__git_ps1 " (%s)")\[\e[0;39m\] \[\e[1;37m\]\[\e[0;39m\]$ '
#eval 'gdircolors -b ~/.dir_colors' > /dev/null
#alias ls='gls -hF --color=auto'
#alias g='grep --color=always -n --exclude=\*.svn\*'
#alias gs='screen'
#alias mdiff='mvim -d'
#alias mybundle='bundle install --binstubs --path vendor/bundle'
#alias updatedb='sudo /usr/libexec/locate.updatedb'
#alias killchrome="ps aux | grep -i chrome | cut -d ' ' -f2 | xargs kill -9"
#export EDITOR=/usr/bin/vim
#export GREP_OPTIONS="--exclude=\*.svn\*"
#set -o vi
#alias tmux="TERM=screen-256color-bce tmux"
#export PATH=/usr/local/bin/ctags:/Applications/MacVim-snapshot-64:/Applications/MAMP/Library/bin:/Users/matthewrobbins/dev/utils/browsermob-proxy-2.0-beta-7/bin:~/utils:$PATH
#alias gh="open \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`"

[ -s "/Users/ost/.jabba/jabba.sh" ] && source "/Users/ost/.jabba/jabba.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
