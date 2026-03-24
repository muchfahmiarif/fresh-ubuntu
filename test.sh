#!/usr/bin/env bash
set -euo pipefail  # strict mode: exit on error, undefined vars, pipe fail

ZSHRC="$HOME/.zshrc"
LINE='export MY_VAR=hello-world'

touch "$ZSHRC"

if ! grep -qxF "$LINE" "$ZSHRC"; then
  echo "$LINE" >> "$ZSHRC"
  echo "✓ Added to $ZSHRC"
else
  echo "✓ Line already exists"
fi

# Auto-reload current zsh session
source "$ZSHRC"
echo "✓ Reloaded ~/.zshrc - MY_VAR is now available"
echo "Test: echo \$MY_VAR"
