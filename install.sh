#!/usr/bin/env bash
# Install this configuration into the current machine.
#   bash install.sh
set -euo pipefail
cd "$(dirname "$0")"

back() { [ -f "$1" ] && cp "$1" "$1.bak" && echo "    (стару версію збережено як $(basename "$1").bak)"; return 0; }
say() { printf '\n▸ %s\n' "$1"; }

say "Правила"
mkdir -p "$HOME/.claude"
back "$HOME/.claude/CLAUDE.md"
cp CLAUDE.md "$HOME/.claude/CLAUDE.md";                echo "  ✓ CLAUDE.md"

say "Скіли"
mkdir -p "$HOME/.claude/skills"
for d in skills/*/; do
  n="$(basename "$d")"
  rm -rf "$HOME/.claude/skills/$n"
  cp -R "$d" "$HOME/.claude/skills/$n";                echo "  ✓ $n"
done

say "Хук перевірки комітів"
mkdir -p "$HOME/.claude/git-hooks"
cp git-hooks/commit-msg "$HOME/.claude/git-hooks/commit-msg"
chmod +x "$HOME/.claude/git-hooks/commit-msg"
git config --global core.hooksPath "$HOME/.claude/git-hooks"
echo "  ✓ встановлено й увімкнено"

say "Глобальний gitignore"
mkdir -p "$HOME/.config/git"
back "$HOME/.config/git/ignore"
cp git/ignore "$HOME/.config/git/ignore";              echo "  ✓ ignore"

say "Перевірка"
printf 'Update README' > /tmp/_cm
bash "$HOME/.claude/git-hooks/commit-msg" /tmp/_cm >/dev/null 2>&1 \
  && echo "  ✗ хук пропустив невалідне повідомлення" || echo "  ✓ хук відхиляє невалідні"
printf 'docs: valid message' > /tmp/_cm
bash "$HOME/.claude/git-hooks/commit-msg" /tmp/_cm >/dev/null 2>&1 \
  && echo "  ✓ хук пропускає валідні" || echo "  ✗ хук відхилив валідне"
rm -f /tmp/_cm

printf '\n✓ Готово.\n\n'
