# .dotfiles

## TLDR Usage:
- `stow --no-folding <package name>`

## TODO:
### Configuration Files
- [ ] Consier adding an appropriate/better keybinding for accepting zsh-autosuggest reccomendations
  - (Perhaps whatever keybind ends up being used for a similar function in nvim for autocompletions)
- [ ] Learn about nvim ui2 and consider adding to config
- [ ] Starship:
    - [ ] Add rust
    - [ ] Add python module - Note: using with `uv` is potentially unsafe as uv can run any binary in the venv without interaction
    - [ ] Place the character back on the left to better notice when entering normal mode
    - [ ] Add go
- [ ] Nvim:
    - [ ] Add oil.nvim or similar
    - [ ] Add gitsigns.nvim or similar
    - [ ] Consider codecompanion or similar
    - [ ] consider snack's picker
    - [ ] snacks.nvim setup a dashboard
    - [ ] After all plugins are setup, double check preference on lsp diag boxes using telescope or other
    - [ ] Check all plugins are working as expected (especially mini, lsp stuff and snacks)
- [ ] See about adding config file for windows terminal to add the carbonfox theme, or maybe a script to pull it from the existing file that nightfox.nvim will download
- [ ] For Tmux, since window flags are disabled, add alternatives that are optionally visible when window is
    - [ ] zoomed
    - [ ] marked (if useful)
    - [ ] Bell/notification
    - [ ] Activity? (if useful)
    - [ ] Silent for X (if useful)
- [ ] Get keybindings for all installed plugins and config changes

### Bootstrap/Installation Script
- [ ] Build and test bootstrap/installation script
- [ ] As a part of install script, update tmux.conf's clipboard program to match environment
  - (xclip -selection clipboard -in / pbcopy) - likely for linux
- [ ] Install script needs to create nvim's undodir (/undodur) under: print(vim.fn.stdpath("data"))

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
    - Cargo installation
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
  - snacks.nvim
    - lazygit
      - go (special installation)

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
  - go
    - curl tarbal, add to path
    - use `go env -w GOPATH=$HOME/.local/share/go` or similar to change workspace and don't forget to move the ~/go directory

- Scripts to run after
  - Change shell: `chsh -s $(which zsh)`
  - starship installation script (curl based)
  - In Tmux be sure to run <prefix>I

## Keybindings to remember:
### ZSH + FZF:
  - Alt+C: Quick CD
  - CTRL+R: Interactive history search (vi mode disables- fzf brings back)
  - CTRL+T: Interactive file finder
### Nvim
#### snacks.explorer
  - Select files with `<Tab>`. `m` to move or `c` to copy files in select mode. Can also `y`ank files in select or visual mode, and `p`aste into target directory
  - `m` on single file to rename
  - `c` on single file to copy w/ rename
  - `r` rename
  - `d` delete (single or selected)
  - `a`dd new files (dir if ending in `/`)
  - `o`pen with system application
  - `u`pdate filetree
  - `/`search `<leader>/` grep search in dir
  - toggle `H`idden files
  - toggle `I`gnored files
  - toggle `P`review
#### snacks.lazygit
  - `<leader>gg` Open @ root dir
  - `<leader>gl` Open log
### snacks.notifier
  - `<leader>nh` View notification history
#### mini.ai
  - Combine with existing `daw/ci"` nvim logic, with the following additions
  - Reminder: `d` delete, `c` change, `y` yank, `v` visual select
  - Can select all bracket-likes (`()[]{}<>`), `f`unction, `a`rgument, `t`ag (eg `<div>`), any `q`uote, any `b`racket, or `?`custom
    - With treesitter, `f`unction becomes aware, `c`lass/scope, `a`rgument becomes aware
  - Supports next/last modifiers, eg `an/in` for next occurance or `al/il` for last (previous) occurance
  - Can count out, eg `2dab` delete around 2nd outward enclosing brackets
#### mini.clue
  - `<C-d>`/`<C-u>` to scroll pop-up
#### mini.comment
  - gc- toggle comment, normal and visual
  - gcc- toggle comment on curent line
#### mini.surround
  - sa - surround add
  - sd - surround delete
  - sr - surround replace
  - sf/sF - surround find
  - sh - surround highlight
