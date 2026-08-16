# General options
unsetopt beep
setopt extended_glob # Also needed by by compinit check below
setopt globdots # Include dotfiles in globbing/tab completion without a leading dot

# History
HISTSIZE=10000
HISTFILE=~/.histfile
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt sharehistory # Implies appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups # Subsumes hist_ignore_dups and hist_save_no_dups
setopt hist_find_no_dups
setopt inc_append_history

# Vim mode
bindkey -v
export KEYTIMEOUT=1 # remove default Esc delay
bindkey -v '^?' backward-delete-char # allow backspace past insert-mode entry point

# Custom additions
## Aliases
alias ls="ls --color"

## Shell Integrations
eval "$(starship init zsh)"
# Source fzf's static shell scripts directly instead of `fzf --zsh`, which forks fzf every startup
[[ -f ~/.fzf/shell/completion.zsh ]] && source ~/.fzf/shell/completion.zsh
[[ -f ~/.fzf/shell/key-bindings.zsh ]] && source ~/.fzf/shell/key-bindings.zsh

# ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
## ZINIT Plugins
zinit light zsh-users/zsh-completions # Load before compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
autoload -Uz compinit
# Only run the full (slow) compinit security/rebuild scan if the dump is >24h old; otherwise trust the cached dump.
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zinit cdreplay -q # See zinit README- tldr: performance gains
zinit light Aloxaf/fzf-tab # Load after compinit but before autosuggestions
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compcache"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive completion matching

zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions
# zsh-syntax-highlighting installed at EOF

## Zinit snippets
zinit snippet OMZP::command-not-found

zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting # INSTALL.md requests this be the last plugin sourced; turbo-loading (wait lucid) still defers it until after everything else.
