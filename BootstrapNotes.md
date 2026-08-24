## SETUP: DELTE ME
> [!WARNING]
> This file is an unrefined stream of conciousness that should not be read by mortal eyes

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
