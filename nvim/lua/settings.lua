vim.cmd([[
    filetype plugin indent on
    colorscheme smyck
    language en_US.UTF-8

    hi StatusLine ctermbg=green
    hi StatusLine ctermfg=black
    hi MatchParen ctermbg=green
    hi MatchParen ctermfg=black
]])

vim.opt.background=dark
vim.opt.wildmode="longest:full,full"
vim.opt.visualbell=true
vim.opt.cursorline=true
vim.opt.number=true

-- Whitespace
vim.opt.wrap=false
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.expandtab=true

-- Searching
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.gdefault=true

vim.opt.lazyredraw=true
vim.opt.showmatch=true


vim.opt.backupdir=HOME .."/.vimtmp"
vim.opt.directory=HOME .. "/.vimtmp"
