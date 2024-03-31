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
    "tpope/vim-fugitive",
    "myusuf3/numbers.vim",
    "tpope/vim-surround",
    "airblade/vim-gitgutter",
    "folke/tokyonight.nvim",
    "nvim-tree/nvim-tree.lua",
    "nvim-lualine/lualine.nvim",
    "nudelfabrik/vim-airline-themes",
    "nvim-tree/nvim-web-devicons",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
})


--theme
require("tokyonight").setup {
    style = "night",
    sidebars = { "qf", "help", "NvimTree" }
}

-- lualine
require('lualine').setup {
    options = {
        theme = 'tokyonight',
        globalstatus = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
    sections = {
        lualine_x = {'encoding',  {
      'fileformat',
      symbols = {
        unix = '', -- e712
        dos = '',  -- e70f
        mac = '',  -- e711
      }
    }},
        lualine_y = {'filetype'},
        lualine_z = {'searchcount', 'location'},
    }
}

-- numbers
local numbers_exclude = vim.g.numbers_exclude
table.insert(numbers_exclude, "NvimTree")
vim.g.numbers_exclude = numbers_exclude

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
