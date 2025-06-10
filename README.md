# Marnick's Dotfiles

Quick Start. Run `./install.sh --help` to see all options

## Tool suite

The goal is to create a smooth and fun experience across my development endeavors, with
[vim motions](https://vimdoc.sourceforge.net/htmldoc/motion.html) at its core, [catppuccin](https://catppuccin.com) as color scheme and simplicity and
modularity in its configuration.

1. [homebrew](https://brew.sh/) as MacOS system package manager
1. [NeoVim](https://neovim.io/) as editor with configuration outlined [here](./.config/nvim/lua/marnickvda/README.md)
1. [iterm2](https://iterm2.com/) running `zsh` with [starship](https://starship.rs/) and the package
   manager [zplug](https://github.com/zplug/zplug).
1. [tmux](https://github.com/tmux/tmux/wiki) as terminal multiplexer with
   [tpm](https://github.com/tmux-plugins/tpm) as plugin manager.

## Guides

### Installation

1. Run `./install.sh`
1. Manually install Go `https://go.dev/dl/`
1. Import iTerm2 profile from `.config/iterm2/iterm2-profile.json` into iTerm2. 

### Updating .gitconfig

1. If exists, backup the existing `.gitconfig` via `cp $HOME/.gitconfig
   $HOME/.gitconfig.backup`
1. Make changes in `./.gitconfig`
1. Run `./scripts/configure-git.sh` to synchronize changes with correct credentials
