#!/bin/bash

set -e

# Get the absolute path to the directory this script is in
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Build Brewfile from components located relative to the script
TEMP_BREWFILE="${SCRIPT_DIR}/Brewfile.temp"

# Start with base
cp "${SCRIPT_DIR}/Brewfile.base" "$TEMP_BREWFILE"

# Handle flags
for arg in "$@"; do
  case "$arg" in
    --entertainment)
      cat "${SCRIPT_DIR}/Brewfile.entertainment" >> "$TEMP_BREWFILE"
      ;;
    --office365)
      cat "${SCRIPT_DIR}/Brewfile.office365" >> "$TEMP_BREWFILE"
      ;;
    --extra)
      cat "${SCRIPT_DIR}/Brewfile.extra" >> "$TEMP_BREWFILE"
      ;;
    *)
      echo "❌ Unknown option: $arg"
      echo "Usage: ./brew-install.sh [--entertainment] [--office365] [--extra]"
      exit 1
      ;;
  esac
done

echo "📦 Installing Homebrew packages..."
brew bundle --file="$TEMP_BREWFILE"

echo "✅ Done!"
rm "$TEMP_BREWFILE"
