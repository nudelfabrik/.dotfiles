"" Vundle
"Plugin 'Shougo/unite.vim'
"Plugin 'rizzatti/dash.vim'
"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'Valloric/YouCompleteMe'

call plug#begin('~/.config/.nvim/plugged')
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'nudelfabrik/vim-airline-themes'
Plug 'Shougo/deoplete.nvim'
Plug 'benekastah/neomake'
Plug 'Rip-Rip/clang_complete'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
"Plug 'jodosha/vim-godebug'
Plug 'nudelfabrik/vim-godebug', { 'branch': 'customize-signs' }
Plug 'keith/swift.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
call plug#end()

filetype plugin indent on
colorscheme smyck
set background=dark
language en_US.UTF-8

"set wildmode=list:longest
set wildmode=longest:full,full
set visualbell
set cursorline
set number

"" Whitespace
set nowrap          " don't wrap lines
set tabstop=4       " see vimcast.org
set shiftwidth=4
set softtabstop=4
set expandtab

"" Searching
set ignorecase      " searches are case insensitive...
set smartcase       " ... unless they contain at least one capital letter
set gdefault        " regex /g at end

set lazyredraw      " redraw only when we need to.
set showmatch   

"" Mapleader
let mapleader = "\<Space>"
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader><space> :noh<cr>
nnoremap <leader>f :NERDTreeToggle<cr>
nnoremap <leader>c :TagbarToggle<CR>
nnoremap <leader>t :10sp term://zsh<CR>

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
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-h> <c-w>h
nnoremap <C-l> <c-w>l
set splitbelow
set splitright

" Terminal
autocmd BufWinEnter,WinEnter term://* startinsert
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

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

nmap <Leader>b :GoToggleBreakpoint()<CR>
nmap <Leader>d :GoDebug()<CR>

hi StatusLine ctermbg=green
hi StatusLine ctermfg=black
hi MatchParen ctermbg=green
hi MatchParen ctermfg=black

" airline
set noshowmode
let g:gitgutter_realtime = 0
let g:airline_powerline_fonts=1
let g:airline_theme = 'base16_smyck'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}'
let g:airline_section_x = '%{airline#extensions#tagbar#currenttag()}'
let g:airline_section_z = '%{g:airline_symbols.linenr} %l:%v'

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" autocomplete, automake
let g:deoplete#enable_at_startup = 1
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0

if has('mac')
    let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
else 
    let g:clang_library_path='/usr/local/llvm35/lib'
endif

set completeopt-=preview

"let g:neomake_open_list = 2
"let g:neomake_c_enabled_makers=['clang']
"let g:neomake_go_enabled_makers=['go']
"let g:neomake_error_sign = {
"\ 'text': '✘',
"\ 'texthl': 'ErrorMsg',
"\ }

let g:godebug_breakpoint_sign = {
\ 'text': '◉',
\ 'texthl': 'ModeMsg',
\ }

" go-vim settings
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Auto go imports
let g:go_fmt_command = "goimports"

"autocmd! BufWritePost *.cpp,*.c,*.h,*.go,*.py Neomake

" Nerdtree

let g:NERDTreeIgnore = ['^__pycache__$']

" python
"au BufNewFile,BufRead *.py set foldmethod=indent

"ale
let g:ale_linters_explicit = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '!'
let g:ale_linters = {
\   'python': ['flake8'],
\   'go': ['gofmt', 'gobuild'],
\}


" fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

