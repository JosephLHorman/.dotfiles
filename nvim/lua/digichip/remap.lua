vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines while they are highlighted, with auto indent!
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor where it's at when J-ing
vim.keymap.set("n", "J", "mzJ`z")
-- <C-d> and <C-u> jumping w/ cursor in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without replacing register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Be rid of cap Q
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace word I'm on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- " This unsets the last search pattern register by hitting return
vim.keymap.set("n", "<CR>", "<cmd>noh<CR><CR>")
-- " Make Y act like other capitals and copy rest of line
vim.keymap.set("n", "Y", "y$")
-- " Allow escape in terminal mode
vim.keymap.set("t", "<Esc>", '<C-\\><C-n>')
