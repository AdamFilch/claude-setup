#!/usr/bin/env bash
set -e
src="$(cd "$(dirname "$0")" && pwd)"
dst="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
backup="$dst/backups/pre-claude-setup-$(date +%Y%m%d%H%M%S)"
mkdir -p "$dst"

link() {
  local from="$1" to="$2"
  if [ -L "$to" ] && [ "$(readlink "$to")" = "$from" ]; then return; fi
  if [ -e "$to" ] || [ -L "$to" ]; then mkdir -p "$backup"; mv "$to" "$backup/"; fi
  ln -s "$from" "$to"
  echo "linked $to"
}

for f in CLAUDE.md settings.json agents commands; do link "$src/$f" "$dst/$f"; done

mkdir -p "$dst/skills"
for s in "$src"/skills/*/; do s="${s%/}"; link "$s" "$dst/skills/$(basename "$s")"; done

[ -d "$backup" ] && echo "old files moved to $backup"
exit 0
