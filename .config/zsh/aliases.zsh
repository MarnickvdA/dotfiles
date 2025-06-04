function getGitStatistics() {
    git log --author="${1:-Marnick van der Arend}" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
}

alias vim=nvim

alias g=git
alias gstats=getGitStatistics

alias k=kubectl
alias docker=podman
alias docker-compose="podman compose"

alias pn="pnpm"
alias python=python3
alias pip=pip3

# lists only directories (no files)
alias ld='eza -lD' 

# list only files (no directories)
alias lf='eza -lF --color=always | grep -v /'

# list only hidden files (no directories)
alias lh='eza -dl .* --group-directories-first'

# list everything with directories first
alias ll='eza -al --group-directories-first'

# list only files sorted by size
alias ls='eza -alF --color=always --sort=size | grep -v /'

# list everything sorted by time updated
alias lt='eza -al --sort=modified'

alias weather="curl http://wttr.in/"
