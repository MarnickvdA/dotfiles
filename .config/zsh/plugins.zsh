# zplug package manager setup
export ZPLUG_HOME="$(brew --prefix)/opt/zplug"
source "$ZPLUG_HOME/init.zsh"

# zplug plugins
zplug "mafredri/zsh-async", from:github

# oh-my-zsh plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh, defer:1
zplug "plugins/docker-compose", from:oh-my-zsh, defer:1
zplug "plugins/gh", from:oh-my-zsh, defer:1
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/golang", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/hitchhiker", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/postgres", from:oh-my-zsh

# UX plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2

# disabled plugins (restore if needed)
# zplug "plugins/qrcode", from:oh-my-zsh
# zplug "plugins/spring", from:oh-my-zsh
# zplug "plugins/themes", from:oh-my-zsh
# zplug "plugins/argocd", from:oh-my-zsh
# zplug "plugins/aws", from:oh-my-zsh
# zplug "plugins/deno", from:oh-my-zsh
# zplug "plugins/gradle", from:oh-my-zsh
# zplug "plugins/helm", from:oh-my-zsh
# zplug "plugins/httpie", from:oh-my-zsh
# zplug "plugins/macos", from:oh-my-zsh
# zplug "plugins/mvn", from:oh-my-zsh

zplug load

if ! zplug check --verbose && [[ -t 0 ]]; then
    printf "Install missing plugins? [y/N]: "
    if read -q; then
        echo
        zplug install
    fi
fi
