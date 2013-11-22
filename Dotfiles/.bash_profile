alias tmux="TERM=screen-256color-bce tmux"
alias tumx='tmux -2'
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
