function getGitStatistics() {
	git log --author="${1:-Marnick van der Arend}" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
}

alias gstats=getGitStatistics
alias pn="pnpm"
alias weather="curl http://wttr.in/"
alias vim=nvim
alias pip=pip3
alias k=kubectl
alias python=python3
alias g=git
alias docker=podman
alias docker-compose="podman compose"
