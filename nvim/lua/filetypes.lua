vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.rpz", "*.zone" },
    callback = function() vim.opt.filetype = "bindzone" end,
})

vim.api.nvim_create_autocmd({ "BufWrite" }, {
    callback = function()
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
