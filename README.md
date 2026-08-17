# .dotfiles

## TLDR Usage:
- `stow --no-folding <package name>`

## TODO:
- [ ] Upate starship colors to match carbonfox theme
- [ ] Rebuild NVIM config from scratch
- [ ] Rebuild TMUX config from scratch
- [ ] Build and test bootstrap/installation script
- [ ] Consier adding an appropriate/better keybinding for accepting zsh-autosuggest reccomendations
  - (Perhaps whatever keybind ends up being used for a similar function in nvim for autocompletions)
- [ ] Implement fnm for Node
- [ ] Implment uv for Python
- [ ] As a part of install script, update tmux.conf's clipboard program to match environment
  - (xclip -selection clipboard -in / pbcopy) - likely for linux
- [ ] Add python module to starship
- [ ] I'll probably get tired of starship using the bright carbonfox colors. Consider either using dim, going monochrome, using monochrome bg w/ colored fg, or moving away from powerlevel style prompt
- [ ] Install script needs to create nvim's undodir (/undodur) under: print(vim.fn.stdpath("data"))
- [ ] Learn about nvim ui2 and consider adding to config
- [ ] Depending on LSP settup, consider adding telescope pickers to use isntead of default diag options
- [ ] Add rust to starship

## What is this?
I got really bad about stale config management. Now this is my source of truth for configs. Use at your own risk.

## How does it work?
This repository currently assumes the usage of GNU Stow and cloning this repo directly into the home directory.

## Usage
- Ensure .dotfiles/ is in the $HOME directory.
- (...)
- use `stow --no-folding <package name>`
  - `--no-folding` can save your butt! Without it, stow will symlink entire directories, which will cause changes to this repo if the application stores caches or other changes inside of its .config/ directory. Using this flag forces real directories to exist and only links files.

## Tutorials for when I forget how this works:
### Overall concepts:
  - https://www.youtube.com/watch?v=NoFiYOqnC4o
  - https://www.youtube.com/watch?v=CFzEuBGPPPg
### Zsh configuration:
  - https://www.youtube.com/watch?v=ud7YxC33Z3w 


## SETUP: DELTE ME
- Packages to install:
  - zsh
  - git (may be required beforehand anyway to download repo and run bootstrap script)
  - stow
  - tmux
  - unzip (for fnm)
  - luarocks (requires build-essential libreadline-dev unzip)
  - ripgrep (nvim and telescope)
  - fd (telescope)
  - Node.js (npm)
    - required for tree-sitter-cli (see below)
    - required by mason.nvim to install most LSP servers (bashls, cssls, html, ts_ls, jsonls, basedpyright) - only lua_ls skips this via a prebuilt binary
  - treesitter:
    - tar
    - curl
    - tree-sitter-cli
      - requires node on PATH
      - requires C/C++ compiler
      - best install method requires `cargo/cargo binstall`
        - Requires Rust
        - also used by blink.cmp (nvim completion) as a fallback build path when no prebuilt binary is available for the platform

- Special installations:
  - fzf
    - Since apt is far behind on fzf, instead use the git installation into `~/.fzf`, and update using `cd ~/.fzf && git pull && ./install`
  - nvim
    - Assumes the /opt/ binary installation of nvim. If installed otherwise, edit the path for nvim set in zsh/.zshenv
  - TPM
    - git clone
  - fnm
    - curl'd script
  - uv
    - curl'd script
    - needs installation of version and --default version set

- Scripts to run after
  - Change shell: `chsh -s $(which zsh)`
  - starship installation script (curl based)
  - In Tmux be sure to run <prefix>I

## Keybindings to remember:
### ZSH + FZF:
  - Alt+C: Quick CD
  - CTRL+R: Interactive history search (vi mode disables- fzf brings back)
  - CTRL+T: Interactive file finder
