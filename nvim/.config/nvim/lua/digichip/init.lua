require("digichip.remap")
require("digichip.set")

vim.g.vimwiki_list = {{
    path = '/mnt/z/vimwiki',
    syntax = 'markdown',
    ext ='.md',
    auto_diary_index = 1,
}, {
    path = '/mnt/z/Projects/Active/The Wandering Chronicles Staging Area/vimwiki',
    syntax = 'markdown',
    ext ='.md',
    auto_diary_index = 1,
}}
vim.g.vimwiki_ext2syntax = {
    ['.md'] = 'markdown',
    ['.markdown'] = 'markdown',
    ['.mdown'] = 'markdown'
}
-- Treat all md files as vimwiki
vim.g.vimwiki_markdown_link_ext = 0
-- Use different colors for different headers
vim.g.vimwiki_hl_headers = 1

-- TODO:
-- Firenvim
--
-- " Enable spell-check for markdown and text
-- augroup markdownSpell
--     autocmd!
--     autocmd FileType markdown setlocal spell wrap linebreak nolist colorcolumn=""
--     autocmd FileType text setlocal spell wrap linebreak nolist colorcolumn=""
--     autocmd BufRead, BufNewFile *.md setlocal spell wrap linebreak nolist colorcolumn=""
--     autocmd BufRead, BufNewFile *.txt setlocal spell wrap linebreak nolist colorcolumn=""
-- augroup END
-- 
-- "*** Telescope shortcuts
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
-- 
-- " FireNvim settings:
-- if exists('g:started_by_firenvim')
--     set guifont=monospace:h22
-- endif
-- let g:firenvim_config = { 
--     \ 'globalSettings': {
--         \ 'alt': 'all',
--     \  },
--     \ 'localSettings': {
--         \ '.*': {
--             \ 'cmdline': 'neovim',
--             \ 'content': 'text',
--             \ 'priority': 0,
--             \ 'selector': 'textarea',
--             \ 'takeover': 'never',
--         \ },
--     \ }
-- \ }
-- let fc = g:firenvim_config['localSettings']
-- " let fc['*'] = { 'takeover': 'never', 'priority': 1 }
-- 
