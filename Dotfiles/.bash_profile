# git unpushed commits
alias guc="git log origin/master..HEAD"
# Git add with hunk verification
alias ga="git add -p "
alias gc="git commit"
alias gs="git status"
alias gp="git push"
alias gl="git pull"
alias test="echo changed"
alias gb="echo git branch --set-upstream local-branch-name origin/remote-branch-name"
alias gl='git log --graph --pretty=format":%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias gls='git log --graph --pretty=format":%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset" --simplify-by-decoration'
alias glas='git log --graph --pretty=format":%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset" --all --simplify-by-decoration'
# gl is just current branch
# gls is just current branch simplified
# glas is all branches simplified

# list all symlinked files
alias lss="find . -type l -maxdepth 1"
# see where a file is symlinked to, (requires you to put an arg (the file) in after )
alias lnp="stat -f %Y"
alias c="clear"

alias tmux="TERM=screen-256color tmux"
alias tumx='tmux -2'

# if [ -n "$TMUX" ]; then
    # called inside tmux session, do tmux things
    # tmux source-file ~/.tmux.conf
# fi

alias tls='tmux list-sessions'
alias ta='tmux attach-session -t'
alias tn='tmux new -s '

alias b='cd ~/backupfiles'
alias bd='cd ~/backupfiles/Dotfiles'
alias bt='cd ~/backupfiles/Todo'
alias rm='rm -i'           # prompt before overwrite (but dangerous, see rm for a better approach)
alias cp='cp -i'           # prompt before overwrite (same general problem as the rm)
alias mv='mv -i'           # prompt before overwrite (same general problem as the rm)
alias vi='vim'             # use improved vi editor
# alias git pull='git pull --rebase'
