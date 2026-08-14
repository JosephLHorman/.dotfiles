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

# Stuff added by zsh-newuser-install
unsetopt beep

# Vim mode
bindkey -v
export KEYTIMEOUT=1 # remove default Esc delay

# Cutsom additions
## Path Changes
export PATH="$PATH:$HOME/.local/bin" # To add Claude to path

## Env Variables:
export EDITOR="nvim"

## Aliases
alias ls="ls --color"

## Shell Integrations
eval "$(starship init zsh)"
PATH="${PATH:+${PATH}:}/home/digichip/.fzf/bin"
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
# (#q...) qualifiers inside [[ ]] require extended_glob, hence the setopt.
setopt extended_glob
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zinit cdreplay -q # See zinit README- tldr: performance gains
zinit light Aloxaf/fzf-tab # Load after compinit but before autosuggestions
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions
# zsh-syntax-highlighting installed at EOF

## Zinit snippets
zinit snippet OMZP::command-not-found

zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting # INSTALL.md requests this be the last plugin sourced; turbo-loading (wait lucid) still defers it until after everything else.
