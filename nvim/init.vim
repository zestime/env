set nocompatible
filetype plugin indent on

let mapleader = ','

" Easy to edit init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<CR>


packadd minpac
call minpac#init()
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})

" Finding files fuzzy
call minpac#add('junegunn/fzf')
nnoremap <C-p> :<C-u>FZF<CR>

" Finding files semantically using .projections.json
call minpac#add('tpope/vim-projectionist')

" Dispatch
call minpac#add('tpope/vim-dispatch')

" ALE
call minpac#add('w0rp/ale')
let g:ale_linters = {
			\ 'javascript': ['eslint'],
			\}
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Grepper
call minpac#add('mhinz/vim-grepper')
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']

" Search for the current word
nnoremap <leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

