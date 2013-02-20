call pathogen#infect()
call pathogen#helptags()
set nocompatible
set encoding=utf-8
syntax enable
filetype plugin indent on
colorscheme smyck
set background=dark

au BufNewFile,BufRead *.fish set filetype=conf

set autoread
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start


"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4                   " see vimcast.org
set shiftwidth=4
set softtabstop=4
set expandtab

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " regex /g at end
set showmatch

"" Mapleader
let mapleader="-"
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader><space> :noh<cr>

"" remap
inoremap jj <ESC>
nnoremap <c-j> <c-w>j           " switch btw. windows
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
imap <c-e> <c-o>$
imap <c-a> <c-o>^

cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
set backupdir=~/.vimtmp
set directory=~/.vimtmp 
" Show syntax highlighting groups for word under cursor
nmap <c-p> :echo synIDattr(synID(line("."), col("."), 1), "name") <CR>

hi StatusLine ctermbg=green
hi MatchParen ctermbg=green
