vim.api.nvim_create_autocmd("FileType",{
  pattern = "*.html",
  command = ":normal gg=G"
})

-- Only show corsorline on current buffer/window
vim.api.nvim_create_autocmd({"BufWinEnter", "BufEnter"},{
  pattern = "*",
  callback = function()
    vim.wo.cursorline = true
    vim.wo.cursorcolumn = true
  end
})
vim.api.nvim_create_autocmd("WinLeave",{
  pattern = "*",
  callback = function()
    vim.wo.cursorline = false
    vim.wo.cursorcolumn = false
  end
})
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  pattern = "*",
  callback = function()
    vim.diagnostic.setqflist({open = false })
  end
})
