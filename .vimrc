" Vim vundle {{{
set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/vundle
    call vundle#begin()
    Bundle 'gmarik/vundle'
    Bundle 'tpope/vim-fugitive'
    Bundle 'scrooloose/nerdtree'
    Bundle 'kien/ctrlp.vim'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'vim-airline/vim-airline'
    Bundle 'vim-airline/vim-airline-themes'
    Bundle 'mileszs/ack.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'michaeljsmith/vim-indent-object'
    "Bundle 'flazz/vim-colorschemes'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'sjl/badwolf'
    Bundle 'tomasr/molokai'
    Bundle 'easymotion/vim-easymotion'
    Bundle 'SirVer/ultisnips'
    Bundle 'honza/vim-snippets'
    call vundle#end()
    filetype plugin indent on
" }}}
" Colors {{{
    "syntax enable           " enable syntax processing
    syntax on
    colorscheme badwolf
    "set termguicolors
    let g:solarized_termcolors=256
    set background=dark
    "colorscheme solarized
    "colorscheme lucius
    "LuciusWhite
" }}}
" Misc {{{
    set encoding=utf-8
    set backspace=indent,eol,start
    set hidden
    " Sets leader to ',' and localleader to "\"
    let mapleader=","
    let maplocalleader="\\"

    " Better modes.  Remember where we are
    set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo
    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
" }}}
" Spaces & Tabs {{{
    set tabstop=4           " 4 space tab
    set expandtab           " use spaces for tabs
    set softtabstop=4       " 4 space tab
    set shiftwidth=4
    set modelines=1
    filetype indent on
    filetype plugin on
    set autoindent
    set smarttab
" }}}
" Quicker cursor switching {{{
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    " tab navigation
    nnoremap <S-h> gT
    nnoremap <S-l> gt
    :map <C-t> :tabnew<cr>
    :nmap <C-t> :tabnew<cr>
    :imap <C-t> <ESC>:tabnew<cr>
    :map <C-w> :tabclose<cr>
    " Map escape key to jj -- much faster
    imap jj <esc>
    " Easy navigation through multiline
    noremap j gj
    noremap k gk
    "Force me to use hjkl ;)
    map <up> <nop>
    map <down> <nop>
    map <left> <nop>
    map <right> <nop>
    " Easier horizontal scrolling
    map zl zL
    map zh zH
"}}}
" Searching {{{
    set ignorecase          " ignore case when searching
    set incsearch           " search as characters are entered
    set hlsearch            " highlight all matches
    " hide matchecks on <leader>/
    nnoremap <leader>/ :nohlsearch<cr>
" }}}
" Editting shortcut {{{
    " Copy/paste from system register
    nnoremap Y y$
    nmap <leader>Y "+Y
    noremap <leader>y "+y
    noremap <leader>p "+p
    " Pasettogle use when pasting text that's already indented.
    :set pastetoggle=<F12>
    " Sometime you just need to enter newline without mode changing
    nmap <silent> <leader>o o<ESC>
    nmap <silent> <leader>O O<ESC>
    " Remove trailing whitespace on <leader>S
    nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
    " hightlight last inserted text
    nnoremap gV `[v`]
    " When forgot sudo at opening file
    command! WRITE w !sudo tee % > /dev/null
" }}}
" UI Layout {{{
    set number
    set mouse=a
    set cursorline
    set lazyredraw          " redraw only when we need to
    set laststatus=2
    " Show command in bottom right portion of the screen
    set showcmd
    " Display extra white space
    "set list listchars=tab:»·,trail:·
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    " Customize the wildmenu
    set wildmenu
    set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
    " Keep some more lines for scope
    set scrolloff=5
" }}}
" CtrlP mapping {{{
    map <leader>f :CtrlPCurWD<CR>
    map <leader>b :CtrlPBuffer<cr>
    map <leader>m :CtrlPMRU<cr>
" }}}
" NERDTree {{{
    map <leader>n :NERDTreeToggle<CR>
    map <leader>e :NERDTreeFind<CR>
    let NERDTreeIgnore = ['\.pyc$']
    " Open NERDTree by default
    autocmd VimEnter * NERDTree
" }}}
" Ack on <leader>a {{{
    nnoremap <leader>a :Ack
    nnoremap <leader>A :AckFromSearch
    let g:ackhighlight = 1
    let g:ackpreview = 1
" }}}
" airline {{{
    let g:airline_theme             = 'solarized'
    let g:airline_enable_branch     = 1
    let g:airline_enable_syntastic  = 1
    let g:airline_detect_modified   = 1

    "let g:airline_left_sep          = '>'
    "let g:airline_right_sep         = '<'
    let g:airline_left_sep='›'  " Slightly fancier than '>'
    let g:airline_right_sep='‹' " Slightly fancier than '<'
    "let g:airline_left_sep          = '⮀'
    "let g:airline_left_alt_sep      = '⮁'
    "let g:airline_right_sep         = '⮂'
    "let g:airline_right_alt_sep     = '⮃'
    "let g:airline_branch_prefix     = '⭠'
    "let g:airline_readonly_symbol   = '⭤'
    "let g:airline_linecolumn_prefix = '⭡'
" }}}
" ProgrameLanguage Setting {{{
    " Python file smart setting
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
            \ formatoptions=croqj softtabstop=4 textwidth=74 comments=:#\:,:#
    let python_highlight_all=1
    let python_highlight_exceptions=0
    let python_highlight_builtins=0
    let python_slow_sync=1

    let g:syntastic_python_checkers=['flake8', 'python']

    " Don't warn on
    " "   E121 continuation line indentation is not a multiple of four
    " "   E128 continuation line under-indented for visual indent
    " "   E711 comparison to None should be 'if cond is not None:'
    " "   E301 expected 1 blank line, found 0
    " "   E261 at least two spaces before inline comment
    " "   E241 multiple spaces after ':'
    " "   E124 closing bracket does not match visual indentation
    " "   E126 continuation line over-indented for hanging indent
    " "   E721 do not compare types, use 'isinstance()'
    " "   E501 line too long (82 characters)
    " "   E231 missing whitespace after ','
    let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721,E501,E231
            \ --max-line-length=84'

    " Javascript
    autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
    let g:syntastic_javascript_checkers = ['jshint']

    " XML, HTML, Jinja
    autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
    let g:syntastic_html_checkers = []

    " CSS
    autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
    "autocmd FileType css noremap <buffer> <leader>r :call CSSBeautify()<cr

    au BufWritePost,FileWritePost *.sass :!sass -t expanded --unix-newlines <afile> > "%:p:r.css"
" }}}
" YouCompleletMe & UltiSnips {{{
    let g:acp_enableAtStartup = 0

    " enable completion from tags
    let g:ycm_collect_identifiers_from_tags_files = 1

    " remap Ultisnips for compatibility for YCM
    let g:UltiSnipsExpandTrigger = '<C-j>'
    let g:UltiSnipsJumpForwardTrigger = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
" }}}
" shortcut mapping {{{
    " Quick edit .vimrc and reload
    nnoremap <leader>ev :vsp $MYVIMRC<CR>
    nnoremap <leader>sv :source $MYVIMRC<CR>
    "
    map <F7> :!python3 % <cr>
    map <leader>r :!xdg-open  %:p:h
" }}}
" other unused {{{
" }}}

" vim:foldmethod=marker:foldlevel=0
