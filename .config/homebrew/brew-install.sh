#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMP_BREWFILE="${SCRIPT_DIR}/Brewfile.temp"

# 🚨 Trap to always clean up temp file
cleanup() {
  if [[ -f "$TEMP_BREWFILE" ]]; then
    echo "🧹 Cleaning up temporary Brewfile..."
    rm -f "$TEMP_BREWFILE"
  fi
}
trap cleanup EXIT

show_help() {
  echo ""
  echo "Homebrew Installer Options:"
  echo "  --entertainment   Include entertainment apps like Spotify and WhatsApp"
  echo "  --office365       Include Microsoft Office and Auto-Update"
  echo "  --extra           Include optional or experimental tools"
  echo "  --help            Show this help message and exit"
  echo ""
}

if [[ "$*" == *"--help"* ]]; then
  show_help
  exit 0
fi

# Always install base 
cp "${SCRIPT_DIR}/Brewfile.base" "$TEMP_BREWFILE"

# Handle optional flags
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
    --help)
      ;;
    *)
      echo "❌ Unknown option: $arg"
      echo "Run with --help for usage."
      exit 1
      ;;
  esac
done

echo "📦 Installing Homebrew packages..."
brew bundle --file="$TEMP_BREWFILE"

echo "✅ Done!"

