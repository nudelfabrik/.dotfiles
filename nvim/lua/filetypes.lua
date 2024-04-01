vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.rpz", "*.zone"},
  callback = function() vim.opt.filetype="bindzone" end,
})
