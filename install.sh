#!/bin/bash

set -e

show_help() {
  echo ""
  echo "Usage: ./install.sh [options]"
  echo ""
  echo "Options:"
  echo "  --entertainment   Install media apps (Spotify, WhatsApp, etc.)"
  echo "  --office365       Install Microsoft Office suite"
  echo "  --extra           Install experimental or optional tools"
  echo "  --help            Show this help message and exit"
  echo ""
}

if [[ "$*" == *"--help"* ]]; then
  show_help
  exit 0
fi

echo "🍺 Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

./.config/homebrew/brew-install.sh "$@"

echo "📁 Stowing dotfiles..."
stow .

echo "💻 Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Run git configuration
sh ./scripts/configure-git.sh
