alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias vim=nvim

alias g=git

alias k=kubectl
alias docker=podman
alias docker-compose="podman compose"

alias pn="pnpm"
alias python=python3
alias pip=pip3

# better list-directories
alias ld='eza -lD' # lists only directories (no files)
alias lf='eza -lF --color=always | grep -v /' # list only files (no directories)
alias lh='eza -dl .* --group-directories-first' # list only hidden files (no directories)
alias ll='eza -al --group-directories-first' # list everything with directories first
alias ls='eza -alF --color=always --sort=size | grep -v /' # list only files sorted by size
alias lt='eza -al --sort=modified' # list everything sorted by time updated

# https://www.youtube.com/watch?v=ua1FAlHt_Ys&t=232s 
alias weather="curl http://wttr.in/"
