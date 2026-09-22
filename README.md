# .dotfiles

I got really bad about stale config management. Now this is my source of truth for configs.
Use at your own risk.

## TLDR Usage:
- `stow --no-folding <package name>`

## Prerequisites

GNU Stow does the linking; everything else is the software being configured. Known-good versions (what this is currently running on):

| Tool | Version tested |
|---|---|
| GNU Stow | 2.3.1 |
| zsh | — (plus [zinit](https://github.com/zdharma-continuum/zinit), bootstrapped by `.zshrc` on first run) |
| Neovim | 0.12.0 |
| tmux | 3.4 (plus [TPM](https://github.com/tmux-plugins/tpm)) |
| starship | — |

See [bootstrap notes](BootstrapNotes.md) for the fuller dependency list, including what the nvim plugins pull in (ripgrep, fd, fzf, node, lazygit, a C compiler, ...).

## Packages

Each top-level directory is one stow package. Stow as desired to configure packages.

| Package | Installs to | Contents |
|---|---|---|
| `zsh` | `~/.zshenv`, `~/.zshrc` | shell options, vi mode, zinit plugins, fzf/fnm integration |
| `nvim` | `~/.config/nvim/` | lazy.nvim, LSP + mason, treesitter, telescope, mini.nvim, snacks.nvim |
| `tmux` | `~/.config/tmux/` | prefix `C-Space`, carbonfox theme, TPM |
| `starship` | `~/.config/starship.toml` | prompt (modified tokyo-night) |

## How does it work?
This repository currently assumes the usage of GNU Stow and cloning this repo directly into the home directory.

## Usage
- Ensure .dotfiles/ is in the $HOME directory.
- `cd ~/.dotfiles`, then stow the packages you want — stow treats each package directory as
  a tree to mirror into `$HOME`, so `stow zsh` links `zsh/.zshrc` to `~/.zshrc`.
  - If a real file already exists where a link should go, stow refuses rather than
    clobbering it. Move the original aside first.
  - Dry-run anything you're unsure about with `stow --no-folding --simulate --verbose=2 <package>`.
- use `stow --no-folding <package name>`
  - `--no-folding` can save your butt! Without it, stow will symlink entire directories, which will cause changes to this repo if the application stores caches or other changes inside of its .config/ directory. Using this flag forces real directories to exist and only links files.

## Keybindings

See the [keybindings cheatsheet](Cheatsheet.md) for the day-to-day bindings across nvim, tmux, and zsh — including the places where they conflict with each other.

## TODO:
### Configuration Files
- [ ] Consider adding an appropriate/better keybinding for accepting zsh-autosuggest recommendations
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
- [ ] Ideas to explore:
    - [ ] For TMUX config, when SSHed, have window title changed to hostname of ssh target

### Bootstrap/Installation Script
- [ ] See [bootstrap notes](BootstrapNotes.md) for all that will need to be included in this process.
- [ ] Build and test bootstrap/installation script

## Tutorials for when I forget how this works:
### Overall concepts:
  - https://www.youtube.com/watch?v=NoFiYOqnC4o
  - https://www.youtube.com/watch?v=CFzEuBGPPPg
### Zsh configuration:
  - https://www.youtube.com/watch?v=ud7YxC33Z3w
