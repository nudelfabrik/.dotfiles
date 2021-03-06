set nocompatible
filetype off  
"" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/unite.vim'
Plugin 'nudelfabrik/vim-airline'
Plugin 'rizzatti/dash.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'

call vundle#end() 
"" vundle

set encoding=utf-8
syntax enable
filetype plugin indent on
colorscheme smyck
set background=dark

set autoread
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start

set number


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
let mapleader = "\<Space>"
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader><space> :noh<cr>
nnoremap <leader>f :NERDTreeToggle<cr>
nnoremap <leader>c :TagbarToggle<CR>

"" Markdown Headlines
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

"" Yanking
nmap <Leader>y :reg<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

vmap <Leader>v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
:set iskeyword-=_

"" remap
inoremap jj <ESC>
imap <c-e> <c-o>$
imap <c-a> <c-o>^

"" Windows
nnoremap <c-j> <c-w>j           " switch btw. windows
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
set splitbelow
set splitright

cnoremap w! w !sudo tee %
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
hi StatusLine ctermfg=black
hi MatchParen ctermbg=green
hi MatchParen ctermfg=black

set noshowmode
set laststatus=2
let g:gitgutter_realtime = 0
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}'
let g:airline_section_x = '%{airline#extensions#tagbar#currenttag()}'
let g:clang_user_options='|| exit 0'

" YCM
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_extra_conf_globlist =  ['~/Documents/Dev/*', '~/Dev/*', '~/Developer/*']
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
