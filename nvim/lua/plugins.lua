-- Setup Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
end

vim.opt.rtp:prepend(lazypath)

-- Install Plugins
require("lazy").setup({
  "nvim-tree/nvim-tree.lua",
  "vim-airline/vim-airline",
  "nudelfabrik/vim-airline-themes",
  "nvim-tree/nvim-web-devicons",
})

-- Airline
vim.cmd([[
    set noshowmode
    let g:gitgutter_realtime = 0
    let g:airline_powerline_fonts=1
    let g:airline_theme = 'base16_smyck'
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#hunks#non_zero_only = 1
    let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}'
    let g:airline_section_z = '%{g:airline_symbols.linenr} %l:%v'
]])


-- nvim-tree.lua
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
  end

-- pass to setup along with your other options
require("nvim-tree").setup {
---
on_attach = my_on_attach,
---
}
