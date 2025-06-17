#!/bin/bash

set -e

echo "🍺 Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

echo "📁 Stowing dotfiles..."
stow .

# Run git configuration
sh ./scripts/configure-git.sh
