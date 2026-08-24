# Read by every zsh invocation (interactive, scripts, cron, GUI-launched programs) —
# keep this file cheap: static exports only, no eval of external tools.

## PATH
typeset -U path # dedupe PATH entries as more get appended
# Prepended (not appended) so these win over the Windows PATH that WSL
# imports ahead of .zshenv running (e.g. pyenv-win shims shadowing uv pythons).
export PATH="$HOME/.local/bin:$PATH" # To add Claude to path
PATH="$HOME/.fzf/bin:$PATH"
export PATH="/opt/nvim-linux-x86_64/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.local/share/go/bin:$PATH"

## Env Variables
export EDITOR="nvim"
