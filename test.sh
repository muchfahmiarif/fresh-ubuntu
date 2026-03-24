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

# Auto-reload only if in zsh
if [[ -n ${ZSH_VERSION:-} ]]; then
  source "$ZSHRC"
  echo "✓ Reloaded ~/.zshrc - MY_VAR available!"
else
  echo "✓ Added to ~/.zshrc. Reload manually: source ~/.zshrc"
fi

exec zsh

# Running MY_VAR
echo "✓ Reloaded ~/.zshrc - MY_VAR is now available"
echo "Test: echo \$MY_VAR"
