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

# PyEnv
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init - zsh)"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
source <(fzf --zsh)

# ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
## ZINIT Plugins
zinit light zsh-users/zsh-completions # Load before compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
autoload -Uz compinit && compinit
zinit cdreplay -q # See zinit README- tldr: performance gains
zinit light Aloxaf/fzf-tab # Load after compinit but before autosuggestions
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zinit light zsh-users/zsh-autosuggestions
# zsh-syntax-highlighting installed at EOF

## Zinit snippets
zinit snippet OMZP::command-not-found

zinit light zsh-users/zsh-syntax-highlighting # INSTALL.md requests this be the last plugin sourced.
