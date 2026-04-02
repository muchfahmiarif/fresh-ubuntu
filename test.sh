#!/usr/bin/env bash
set -euo pipefail

ZSHRC="$HOME/.zshrc"
BASHRC="$HOME/.bashrc"
LINE='export MY_VAR=hello-world'

touch "$ZSHRC" "$BASHRC"

# Write to both files
for FILE in "$ZSHRC" "$BASHRC"; do
  if ! grep -qxF "$LINE" "$FILE"; then
    echo "$LINE" >> "$FILE"
    echo "✓ Added to $FILE"
  else
    echo "✓ Already exists in $FILE"
  fi
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Install complete!"
echo ""
echo "  Apply now (bash):  source ~/.bashrc"
echo "  Apply now (zsh):   source ~/.zshrc"
echo "  Or open a new terminal tab."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
