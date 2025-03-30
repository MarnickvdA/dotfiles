export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/zsh/custom"

source $ZSH/oh-my-zsh.sh

export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async", from:github
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/qrcode", from:oh-my-zsh
zplug "plugins/spring", from:oh-my-zsh
zplug "plugins/themes", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/argocd", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/deno", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/gh", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/golang", from:oh-my-zsh
zplug "plugins/gradle", from:oh-my-zsh
zplug "plugins/helm", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/hitchhiker", from:oh-my-zsh
zplug "plugins/httpie", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/macos", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/postgres", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2

zplug load

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


# User configuration

# Add deno completions to search path
if [[ ":$FPATH:" != *":$HOME/completions:"* ]]; then export FPATH="$HOME/completions:$FPATH"; fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias gits="git status"
alias pn="pnpm"
alias gc="git checkout"
alias gstats=getGitStatistics

function getGitStatistics() {
	git log --author="${1:-Marnick van der Arend}" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
}

alias weather="curl http://wttr.in/"

autoload bashcompinit && bashcompinit

export VISUAL="$EDITOR"

export HOMEBREW_NO_ENV_HINTS=true

export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

. "$HOME/.deno/env"

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

