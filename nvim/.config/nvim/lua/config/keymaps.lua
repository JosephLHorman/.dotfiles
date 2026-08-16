local keymap = vim.keymap
vim.g.mapleader = ' '

-- Behavior improvements
keymap.set("n", "Y", "y$") -- Make Y act like other capitals and copy rest of line
keymap.set("n", "Q", "<nop>") -- Be rid of cap Q

-- Movement
keymap.set("n", "J", "mzJ`z") -- Keep cursor where it's at when J-ing
keymap.set("n", "<C-d>", "<C-d>zz") -- <C-d> and <C-u> jumping w/ cursor in center
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv") -- Search terms in the middle
keymap.set("n", "N", "Nzzzv")

-- Editing
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move lines while they are highlighted, with auto indent
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("x", "<leader>p", "\"_dP") -- Paste without replacing register
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Find & Replace word I'm on
keymap.set("n", "<CR>", "<cmd>noh<CR><CR>") -- " This unsets the last search pattern register by hitting return

-- " Allow escape in terminal mode
--keymap.set("t", "<Esc>", '<C-\\><C-n>')
