local opt = vim.opt

-- Visuals
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.laststatus = 3 -- Use only one status line across all splits
--vim.o.cmdheight = 0 -- Only show cmd line when needed, works best with ui2

-- Editing
opt.swapfile = false
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undofile = true
opt.clipboard = "unnamedplus" -- Allows system clipboard access
opt.autoread = true -- Reload files edited externally
opt.breakindent = true -- Wrapped lines preserve indentation

-- Line numbers
opt.nu = true
opt.relativenumber = true
opt.numberwidth = 2 -- Set number column width to 2 (default is 4)

-- Tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Searching
opt.hlsearch = true -- Highlight all serach matches
opt.incsearch = true -- Show as you type
opt.ignorecase = true
opt.smartcase = true -- Override ignorecase if caps are used

-- Disable Proviers
-- (Unneeded healtcheck warnings)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider= 0

-- Misc
opt.updatetime = 100 -- Faster completion
