# Read by every zsh invocation (interactive, scripts, cron, GUI-launched programs) —
# keep this file cheap: static exports only, no eval of external tools.

## PATH
typeset -U path # dedupe PATH entries as more get appended
# Prepended (not appended) so these win over the Windows PATH that WSL
# imports ahead of .zshenv running (e.g. pyenv-win shims shadowing uv pythons).
PATH="$HOME/.fzf/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# mise shims, prepended last so mise-managed tools (neovim, ripgrep, fd, node)
# win over any apt-installed copy. This is a static export, which is why it
# belongs here rather than in .zshrc; `mise activate` is an eval and lives there.
export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/mise/shims:$PATH"

## Env Variables
export EDITOR="nvim"
