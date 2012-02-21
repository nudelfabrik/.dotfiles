set nocompatible
set encoding=utf-8

syntax on
colorscheme solarized

set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start


"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>

let mapleader="-"
nnoremap <leader>w <C-w>v<C-w>l
inoremap jj <ESC>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
imap <c-e> <c-o>$
imap <c-a> <c-o>^
set backupdir=~/.vimtmp
set directory=~/.vimtmp 
" Show syntax highlighting groups for word under cursor
nmap <c-p> :echo synIDattr(synID(line("."), col("."), 1), "name") <CR>

hi StatusLine ctermbg=green
hi MatchParen ctermbg=green
filetype plugin indent on
