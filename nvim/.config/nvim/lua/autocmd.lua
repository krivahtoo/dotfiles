vim.api.nvim_create_autocmd('FileType', {
  pattern = '*.html',
  command = ':normal gg=G',
})

-- Only show corsorline on current buffer/window
vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufEnter' }, {
  pattern = '*',
  callback = function()
    vim.wo.cursorline = true
    vim.wo.cursorcolumn = true
  end,
})
vim.api.nvim_create_autocmd('WinLeave', {
  pattern = '*',
  callback = function()
    vim.wo.cursorline = false
    vim.wo.cursorcolumn = false
  end,
})
vim.api.nvim_create_autocmd('DiagnosticChanged', {
  pattern = '*',
  callback = function()
    -- vim.diagnostic.setqflist({
    --   open = false,
    --   severity = vim.diagnostic.severity.ERROR
    -- })
  end,
})

-- Organize imports
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.go' },
  desc = 'Organize imports',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { 'source.organizeImports' } }
    local result = vim.lsp.buf_request_sync(
      0,
      'textDocument/codeAction',
      params,
      1000
    )
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, 'UTF-8')
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end,
})

vim.api.nvim_create_autocmd({
  'CursorMoved',
  'BufWinEnter',
  'BufFilePost',
  'InsertEnter',
  'BufWritePost',
}, {
  callback = function()
    require('krivah.winbar').get_winbar()
  end,
})

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 300 }
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = { 'PackerCompileDone' },
  callback = function()
    vim.notify('Compiled successfully', nil, {
      title = 'Packer',
      timeout = 500,
    })
  end,
})
