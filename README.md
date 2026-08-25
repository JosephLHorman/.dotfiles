# .dotfiles

## TLDR Usage:
- `stow --no-folding <package name>`

## TODO:
### Configuration Files
- [ ] Consier adding an appropriate/better keybinding for accepting zsh-autosuggest reccomendations
  - (Perhaps whatever keybind ends up being used for a similar function in nvim for autocompletions)
- [ ] Nvim:
    - [ ] Consider codecompanion or similar
    - [ ] Consider snack's picker
    - [ ] Snacks.nvim setup a dashboard
    - [ ] Learn about nvim ui2 and consider adding to config
    - [ ] After all plugins are setup, double check preference on lsp diag boxes using telescope or other
    - [ ] Check all plugins are working as expected (especially mini, lsp stuff and snacks)
- [ ] See about adding config file for windows terminal to add the carbonfox theme, or maybe a script to pull it from the existing file that nightfox.nvim will download
- [ ] Get keybindings for all installed plugins and config changes
- [ ] Research options for managing Windows with this source of truth
    - [ ] Starship Configuration for Powershell
    - [ ] Carbonfox theme colors for Windows Terminal

### Bootstrap/Installation Script
- [ ] See [bootstrap notes](BootstrapNotes.md) for all that will need to be included in this process.
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

## Other
- [ ] See [keybindins cheatsheet](Cheatsheet.md)

## Tutorials for when I forget how this works:
### Overall concepts:
  - https://www.youtube.com/watch?v=NoFiYOqnC4o
  - https://www.youtube.com/watch?v=CFzEuBGPPPg
### Zsh configuration:
  - https://www.youtube.com/watch?v=ud7YxC33Z3w 
