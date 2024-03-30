set encoding=utf-8
syntax enable
filetype plugin indent on
set backspace=indent,eol,start
set number

"" remap
inoremap jj <ESC>

"" Windows
nnoremap <c-j> <c-w>j           " switch btw. windows
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
set splitbelow
set splitright

cnoremap w! w !sudo tee %


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
