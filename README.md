# .dotfiles

I got really bad about stale config management. Now this is my source of truth for configs.
Use at your own risk.

## TLDR Usage:
- Fresh machine: `./bootstrap.sh`
- Afterwards: `mise bootstrap`

## Provisioning

Setup is declarative. [`mise.toml`](mise.toml) states what the machine should
look like — apt packages, symlinks, git checkouts, login shell, tools — and
`mise bootstrap` converges to it. Re-running is how you update.

```sh
./bootstrap.sh              # fresh machine, nothing installed
mise bootstrap              # thereafter
mise bootstrap --dry-run    # print what would change
mise bootstrap status       # what is and is not in place
```

Run as your normal user — it refuses root, and uses sudo only for apt.
See [bootstrap/README.md](bootstrap/README.md) for details on how it fits 
together and why some dependencies are handled specially

`bootstrap.sh` exists only because fetching mise needs curl, which a bare image
lacks; everything past that is mise.

## Prerequisites
None to install by hand ideally.

Developer tools come from [mise](https://mise.jdx.dev), which also manages
per-project node/python versions. System packages come from apt. fzf, TPM and
zinit are git checkouts, because they ship shell integration rather than just a
binary. `mise bootstrap status` reports the version of everything.

## Packages
Each top-level directory holds one program's config. `[dotfiles]` in `mise.toml` maps each to
its destination in `$HOME`; `bootstrap/` and `bin/` are provisioning machinery and are not
linked anywhere.

| Package | Installs to | Contents |
|---|---|---|
| `zsh` | `~/.zshenv`, `~/.zshrc` | shell options, vi mode, zinit plugins, fzf integration |
| `nvim` | `~/.config/nvim/` | lazy.nvim, LSP + mason, treesitter, telescope, mini.nvim, snacks.nvim |
| `tmux` | `~/.config/tmux/` | prefix `C-Space`, carbonfox theme, TPM |
| `starship` | `~/.config/starship.toml` | prompt (modified tokyo-night) |
| `mise` | `~/.config/mise/config.toml` | the developer tool list (neovim, ripgrep, fd, node, uv, ...) |

The mapping lives in `[dotfiles]` in `mise.toml`, not in directory structure, so a path can move
without renaming anything.

## How does it work?
Clone to `~/.dotfiles` and run `./bootstrap.sh`. `[dotfiles]` in `mise.toml`
maps each source in this repo to its destination in `$HOME` and symlinks it, so
editing a file here changes the live config immediately.

`mise bootstrap dotfiles` has subcommands worth knowing: `status` shows what is
linked, `diff` shows what applying would change, and `add` starts tracking a
new file.

## Keybindings
See the [keybindings cheatsheet](Cheatsheet.md) for a rough idea of day-to-day 
bindings across nvim, tmux, and zsh — including the places where they conflict 
with each other.

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
- [ ] Build and test bootstrap/installation script
- [ ] Verify the provisioner on WSL (clipboard and the Windows-PATH interaction are the untested parts)

## Tutorials for when I forget how this works:
### Overall concepts:
  - https://www.youtube.com/watch?v=NoFiYOqnC4o
  - https://www.youtube.com/watch?v=CFzEuBGPPPg
### Zsh configuration:
  - https://www.youtube.com/watch?v=ud7YxC33Z3w
