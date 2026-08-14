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

- Special installations:
  - fzf
    - Since apt is far behind on fzf, instead use the git installation into `~/.fzf`, and update using `cd ~/.fzf && git pull && ./install`
  - nvim

- Scripts to run after
  - Change shell: `chsh -s $(which zsh)`
  - starship installation script (curl based)

## Keybindings to remember:
### ZSH + FZF:
  - Alt+C: Quick CD
  - CTRL+R: Interactive history search (vi mode disables- fzf brings back)
  - CTRL+T: Interactive file finder
