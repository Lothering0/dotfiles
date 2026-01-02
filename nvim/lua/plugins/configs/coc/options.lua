vim.g.coc_global_extensions = { 'coc-tsserver' }
vim.cmd [[autocmd CursorHold * silent call CocActionAsync('highlight')]]
-- vim.cmd [[command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')]]
