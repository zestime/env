
" only when 'compatible' is set
if &compatible 
  set nocompatible
endif
filetype plugin indent on

" General Mappings {{{
    " set a map leader for more key combos
    let mapleader = ','

    " remap esc
    inoremap jk <esc>

    " wipout buffer
    nmap <silent> <leader>b :bw<cr>

    " shortcut to save
    nmap <leader>, :w<cr>

    " set paste toggle
    set pastetoggle=<leader>v

    " edit ~/.config/nvim/init.vim
    map <leader>ev :e! ~/.config/nvim/init.vim<cr>
    " edit gitconfig
    map <leader>eg :e! ~/.gitconfig<cr>
    "
    " clear highlighted search
    noremap <space> :set hlsearch! hlsearch?<cr>

    " remove extra whitespace
    nmap <leader><space> :%s/\s\+$<cr>
    nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

    " Textmate style indentation
    vmap <leader>[ <gv
    vmap <leader>] >gv
    nmap <leader>[ <<
    nmap <leader>] >>

    " switch between current and last buffer
    nmap <leader>. <c-^>

    " enable . command in visual mode
    vnoremap . :normal .<cr>

    " toggle cursor line
    nnoremap <leader>i :set cursorline!<cr>
    " }}}

    " AutoGroups {{{
    " file type specific settings
    augroup configgroup
      autocmd!

      " automatically resize panes on resize
      autocmd VimResized * exe 'normal! \<c-w>='
      autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
      autocmd BufWritePost .vimrc.local source %

      " save all files on focus lost, ignoring warnings about untitled buffers
      autocmd FocusLost * silent! wa
      " make quickfix windows take all the lower section of the screen
      " when there are multiple windows open
      autocmd FileType qf wincmd J
      autocmd FileType qf nmap <buffer> q :q<cr>
    augroup END
    " }}}

    " Abbreviations
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute

    set autoread " detect when a file is changed

    set history=1000 " change history to 1000
    set textwidth=120

    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

    if (has('nvim'))
      let g:python_host_prog = '/usr/local/bin/python2'
      let g:python3_host_prog = '/usr/local/bin/python3'
      " show results of substition as they're happening
      " but don't open a split
      set inccommand=nosplit
    endif

    set backspace=indent,eol,start " make backspace behave in a sane manner
    set clipboard=unnamed

    if has('mouse')
      set mouse=a
    endif

    " Appearance {{{
    set number " show line numbers
    set wrap " turn on line wrapping
    set wrapmargin=8 " wrap lines when coming within n characters from side
    set linebreak " set soft wrapping
    set showbreak=… " show ellipsis at breaking
    set autoindent " automatically set indent of new line
    set ttyfast " faster redrawing
    set diffopt+=vertical
    set laststatus=2 " show the satus line all the time
    set so=7 " set 7 lines to the cursors - when moving vertical
    set wildmenu " enhanced command line completion
    set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set noshowmode " don't show which mode disabled for PowerLine
    set wildmode=list:longest " complete files like a shell
    set scrolloff=3 " lines of text around cursor
    set shell=$SHELL
    set cmdheight=1 " command bar height
    set title " set terminal title
    set showmatch " show matching braces
    set mat=2 " how many tenths of a second to blink

    " Tab control
    set expandtab 
    "set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=2 " the visible width of tabs
    set softtabstop=2 " edit as if the tabs are 4 characters wide
    set shiftwidth=2 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'

    " code folding settings
    set foldmethod=syntax " fold based on indent
    set foldlevelstart=99
    set foldnestmax=10 " deepest fold is 10 levels
    set nofoldenable " don't fold by default
    set foldlevel=1

    " toggle invisible characters
    set list
    set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
    set showbreak=↪

    " set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
    " " switch cursor to line when in insert mode, and block when not
    " set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    " 			\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    " 			\,sm:block-blinkwait175-blinkoff150-blinkon175


    " Searching
    set ignorecase " case insensitive searching
    set smartcase " case-sensitive if expresson contains a capital letter
    set hlsearch " highlight search results
    set incsearch " set incremental search, like modern browsers
    set nolazyredraw " don't redraw while executing macros

    set magic " Set magic on, for regex

    " error bells
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500

    syntax on
    set termguicolors
    let g:seoul256_background = 233
    "let g:onedark_termcolors=256

    packadd minpac
    call minpac#init()

    function! Add(repo, ...)
      let l:opts = get(a:000, 0, {})
      let l:name = substitute(a:repo, '^.*/', '', '')
      call minpac#add(a:repo)
      if has_key(l:opts, 'for')
        let l:ft = type(l:opts.for) == type([]) ? join(l:opts.for, '') : l:opts.for
        execut printf('autocmd FileType %s packadd %s', l:ft, l:name)
      endif
    endfunction

    " insert or delete brackets, parens, quotes in pair
    call minpac#add('jiangmiao/auto-pairs')

    " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
    call minpac#add('tpope/vim-surround')

    " endings for html, xml, etc. - chances surround
    call minpac#add('tpope/vim-ragtag')

    " mappings wichi are simply short normal mode aliases for commly used ex commands
    call Add('tpope/vim-unimpaired')
    call minpac#add('tpope/vim-scriptease', {'type': 'opt'})

    command! PackUpdate call minpac#update()
    command! PackClean call minpac#clean()


    " FZF {{{
      " Finding files fuzzy
      call minpac#add('/usr/local/opt/fzf')
      call Add('junegunn/fzf.vim')
      let g:fzf_layout = { 'down': '~25%' }
      nnoremap <C-p> :<C-u>FZF<CR>

      nmap <silent> <leader>r :Buffers<cr>
      nmap <silent> <leader>t :FZFMru<cr>

      " Mapping selecting mappings
      nmap <leader><tab> <plug>(fzf-maps-n)
      xmap <leader><tab> <plug>(fzf-maps-x)
      omap <leader><tab> <plug>(fzf-maps-o)
      
      " Insert mode completion
      imap <c-x><c-k> <plug>(fzf-complete-word)
      imap <c-x><c-f> <plug>(fzf-complete-path)
      imap <c-x><c-j> <plug>(fzf-complete-file-ag)
      imap <c-x><c-l> <plug>(fzf-complete-line)

      nnoremap <silent> <Leader>C :call fzf#run({
            \	'source':
            \	  map(split(globpath(&rtp, "colors/*.vim"), "\n"),
            \		  "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
            \	'sink':    'colo',
            \	'options': '+m',
            \	'left':    30
            \ })<CR>

      command! -bang -nargs=* Find call fzf#vim#grep(
            \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
            \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
      " }}}

      command! FZFMru call fzf#run({
            \  'source':  v:oldfiles,
            \  'sink':	  'e',
            \  'options': '-m -x +s',
      \  'down':	  '40%'})
    " }}}

    " Finding files semantically using .projections.json
    call Add('tpope/vim-projectionist')

    " easy commenting motions
    call Add('tpope/vim-commentary')

    " Dispatch
    call Add('tpope/vim-dispatch')
    let g:dispatch_compilers = { 'jest': 'jest-cli' }

    " Goyo
    " Distraction-free environment
    call Add('junegunn/goyo.vim')

    " ale(Asynchronous Lint Engine)
    call Add('w0rp/ale')
    let g:ale_linters = {
          \ 'javascript': ['eslint'],
          \ 'typescript': ['tsserver', 'tslint'],
          \ 'html': []
          \}
    let g:ale_change_sign_column_color = 1
    let g:ale_sign_column_always = 1
    let g:ale_sign_error = '✖'
    let g:ale_sign_warning = '⚠'
    nmap <silent> [W <Plug>(ale_first)
    nmap <silent> [w <Plug>(ale_previous)
    nmap <silent> ]w <Plug>(ale_next)
    nmap <silent> ]W <Plug>(ale_last)


    " NERDTree {{{
      call Add('scrooloose/nerdtree')
      call Add('Xuyuanp/nerdtree-git-plugin')
      call Add('ryanoasis/vim-devicons')

      " Toggle NERDTree
      function! ToggleNerdTree()
        if @% != "" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
          :NERDTreeFind
        else 
          :NERDTreeToggle
        endif
      endfunction
      " toggle nerd tree
      nmap <silent> <leader>k :call ToggleNerdTree()<cr>
      " find the current file in nerdtree without needing to reload the drawer
      nmap <silent> <leader>y :NERDTreeFind<cr>

      autocmd StdinReadPre * let s:std_in=1
      "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

      let NERDTreeShowHidden=1
      let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }
    " }}}

    " vim-fugitive {{{
    " Git client for Vim
      call Add('tpope/vim-fugitive')
      call Add('tpope/vim-rhubarb') " hub extension for fugitive
      nmap <silent> <leader>gs :Gstatus<cr>
      nmap <leader>ge :Gedit<cr>
      nmap <silent><leader>gr :Gread<cr>
      nmap <silent><leader>gb :Gblame<cr>
    " }}}

    " Grepper {{{
        call Add('mhinz/vim-grepper')
        let g:grepper = {}
        let g:grepper.tools = ['grep', 'git', 'rg']

        " Search for the current word
        nnoremap <leader>* :Grepper -cword -noprompt<CR>

        " Search for the current selection
        nmap gs <plug>(GrepperOperator)
        xmap gs <plug>(GrepperOperator)
    " }}}

    " vim-prettier {{{
      call Add('prettier/vim-prettier', {
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] })
      let g:prettier#autoformat = 0
      autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
    " }}}


    " vim-easy-align {{{
      " east to use vim alignment
      call Add('junegunn/vim-easy-align')
      xmap ga <plug>(EasyAlign)
      nmap ga <plug>(EasyAlign)
    " }}}


    " Ultisnips {{{
      call Add('SirVer/ultisnips')
      " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
      let g:UltiSnipsExpandTrigger="<tab>"
      let g:UltiSnipsJumpForwardTrigger="<c-b>"
      let g:UltiSnipsJumpBackwardTrigger="<c-z>"

      " If you want :UltiSnipsEdit to split your window.
      let g:UltiSnipsEditSplit="vertical"
      " FIXME - Proper path is needed
      let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips']
    " }}}

    " vim-test {{{
      call minpac#add("janko-m/vim-test") 
      let g:test#strategy = "dispatch"
      nmap <silent> t<C-n> :TestNearest<CR>
      nmap <silent> t<C-f> :TestFile<CR>
      nmap <silent> t<C-s> :TestSuite<CR>
      nmap <silent> t<C-l> :TestLast<CR>
      nmap <silent> t<C-g> :TestVist<CR>
    " }}}

    " Theme
    " Color {{{
      " After loaded all plugins
      call Add('junegunn/seoul256.vim')
      packloadall
      colorscheme seoul256
    " }}}


    " FIXME - Problem for not updateing initalized
    " make comments and HTML attributes italic
    highlight Comment cterm=italic
    highlight htmlArg cterm=italic
    highlight xmlAttrib cterm=italic
    highlight Type cterm=italic
    highlight Normal ctermbg=none

    " LANGUAGE
    " Javasript {{{
   
      set path=.,src,app
      set suffixesadd=.js,.jsx
      function! LoadMainNodeModule(fname)
        let nodeModules = './node_modules/'
        let app = './app/'
        let packageJsonPath = nodeModules . a:fname . '/package.json'
        let appPath = app . a:fname
        let appPathWithIndex = app . a:fname . '/index.js'

        echom appPath
        echom appPathWithIndex

        if filereadable(packageJsonPath)
          return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
        elseif filereadable(appPath)
          return appPath
        elseif filereadable(appPathWithIndex)
          return appPathWithIndex
        else 
          return nodeModules . a:fname
        endif
      endfunction

      set includeexpr=LoadMainNodeModule(v:fname)
    " }}}
