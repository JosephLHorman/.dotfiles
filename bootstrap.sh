#!/usr/bin/env bash
#
# Seed a fresh Debian-family machine, then hand over to mise.
#
# This exists for one reason: `bin/mise` downloads mise with curl, and a bare
# Debian or Ubuntu image has no curl. Everything past that point is declared in
# mise.toml and applied by `mise bootstrap` — packages, dotfiles, repos, login
# shell, tools, and the first-run task.
#
# Re-running is safe, but once mise is installed you can simply use:
#
#   mise bootstrap              apply
#   mise bootstrap --dry-run    preview
#   mise bootstrap status       what is and is not in place
#
set -euo pipefail

ROOT=$(cd -- "${BASH_SOURCE[0]%/*}" && pwd)
cd "$ROOT"

(( EUID != 0 )) || {
  echo "bootstrap.sh: do not run as root — \$HOME and file ownership would be wrong." >&2
  echo "Run as your normal user; sudo is used only for apt." >&2
  exit 1
}

[[ -r /etc/os-release ]] || { echo "bootstrap.sh: no /etc/os-release; this targets Debian-family systems." >&2; exit 1; }
# shellcheck disable=SC1091
. /etc/os-release
case "${ID:-}:${ID_LIKE:-}" in
  debian:*|ubuntu:*|*:*debian*) ;;
  *) echo "bootstrap.sh: unsupported distro '${PRETTY_NAME:-unknown}'; this bootstrap is built for apt." >&2; exit 1 ;;
esac

# Only what bin/mise itself needs. Everything else, git included, is declared
# in [bootstrap.packages] and installed by mise at phase 4.
if ! command -v curl >/dev/null; then
  echo "==> installing curl (needed to fetch mise)"
  sudo apt-get update -qq
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq curl ca-certificates
fi

echo "==> handing over to mise bootstrap"
exec ./bin/mise bootstrap "$@"
