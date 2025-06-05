# Marnick's Dotfiles

Run `./install.sh --help` to see all options

## Installation

1. Run `./install.sh`
1. Manually install Go `https://go.dev/dl/`
1. Import iTerm2 profile from `.config/iterm2/iterm2-profile.json` into iTerm2. 

## Updating .gitconfig

1. If exists, backup the existing `.gitconfig` via `cp $HOME/.gitconfig
   $HOME/.gitconfig.backup`
1. Make changes in `./.gitconfig`
1. Run `./scripts/configure-git.sh` to synchronize changes with correct credentials
