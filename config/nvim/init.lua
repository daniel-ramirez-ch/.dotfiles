vim.cmd([[ autocmd FileType markdown setlocal textwidth=70 ]])
vim.cmd([[ autocmd FileType markdown setlocal formatoptions+=t ]])

vim.cmd([[
function! s:preserve_cursor_position(command) abort
    let l:save_view = winsaveview()
    execute a:command
    call winrestview(l:save_view)
endfunction

autocmd BufWritePre *.md call s:preserve_cursor_position('normal gggqG')
]])

vim.o.clipboard = "unnamedplus"

vim.cmd([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup='IncSearch', timeout=100 })
augroup END
]])

vim.api.nvim_set_keymap('n', '<space>w', ':w<CR>', { noremap = true, silent = true })

