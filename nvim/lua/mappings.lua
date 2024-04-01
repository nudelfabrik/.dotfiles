vim.g.mapleader = " "
nmap("<leader>f", ":NvimTreeToggle<cr>")
nmap("<leader>w", "<C-w>v<C-w>l")
nmap("<leader><space>", ":noh<cr>")

-- remap
imap("jj", "<ESC>")
imap("<c-e>", "<c-o>$")
imap("<c-a>", "<c-o>^")
nmap("<leader>b", "<c-t>")

-- Windows
nmap("<C-j>", "<c-w>j")
nmap("<C-k>", "<c-w>k")
nmap("<C-h>", "<c-w>h")
nmap("<C-l>", "<c-w>l")
vim.opt.splitbelow=true
vim.opt.splitright=true

-- Markdown Headlines
nmap("<leader>1", "yypVr=")
nmap("<leader>2", "yypVr-")

-- Yanking
nmap("<Leader>y", ":reg<CR>")
vmap("<Leader>y", "\"+y")
vmap("<Leader>d", "\"+d")
nmap("<Leader>p", "\"+p")
nmap("<Leader>P", "\"+P")
vmap("<Leader>p", "\"+p")
vmap("<Leader>P", "\"+P")

vim.api.nvim_set_keymap("c", "w!", "w !sudo tee %", { noremap = true, silent = false })
cmap("<C-a>", "<Home>")
cmap("<C-b>", "<Left>")
cmap("<C-f>", "<Right>")
cmap("<C-d>", "<Delete>")
cmap("<M-b>", "<S-Left>")
cmap("<M-f>", "<S-Right>")

vim.keymap.set('n', "<Leader>t", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', "<Leader>t", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', "jj", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
