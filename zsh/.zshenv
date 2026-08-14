# Read by every zsh invocation (interactive, scripts, cron, GUI-launched programs) —
# keep this file cheap: static exports only, no eval of external tools.

## PATH
typeset -U path # dedupe PATH entries as more get appended
export PATH="$PATH:$HOME/.local/bin" # To add Claude to path
PATH="${PATH:+${PATH}:}/home/digichip/.fzf/bin"

## Env Variables
export EDITOR="nvim"
