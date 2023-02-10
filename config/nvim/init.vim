call plug#begin()
	Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '*', 'do': { -> coc#util#install() }}
	Plug 'machakann/vim-highlightedyank'
	Plug 'Raimondi/delimitMate'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'github/copilot.vim',
	Plug 'bling/vim-bufferline',
call plug#end()

set relativenumber
set number

colorscheme gruvbox
set bg=dark

"Use <cr> to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"format your code on <cr>
"inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"Use <Tab> and <S-Tab> to navigate the completion list:
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

let g:highlightedyank_highlight_duration = 250

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" Fuzzy find with leader ff
let mapleader = " "
nnoremap <leader>ff :FZF<CR>

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" shift l goes to the next buffer, shift h goes to the previous buffer and shift q closes the current buffer
nnoremap <silent> <S-l> :bnext<CR>
nnoremap <silent> <S-h> :bprevious<CR>
nnoremap <silent> <S-q> :bd<CR>

" leader l d n goes to the next coc lsp diagnostic, leader l d p goes to the previous coc lsp diagnostic
nnoremap <silent> <leader>ldn <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>ldp <Plug>(coc-diagnostic-prev)

" don't show buffer number
let g:bufferline_show_bufnr = 0
