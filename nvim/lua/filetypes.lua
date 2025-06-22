vim.filetype.add({
    extension = {},
    filename = {},
    pattern = {
        ['.*/*.rpz'] = 'bindzone',
        ['.*/*.sample'] = function(path, bufnr, ext)
            local filename = string.sub(ext, 1, -8)
            local match = vim.filetype.match({ filename = filename })
            if match == nil then
                local i, _ = string.find(filename, "%.")
                if i ~= nil then
                    match = string.sub(filename, i + 1)
                end
            end
            return match
        end
    },
})

vim.api.nvim_create_autocmd({ "BufWrite" }, {
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
