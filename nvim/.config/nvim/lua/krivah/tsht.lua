vim.keymap.set('x', 'in', function()
  require('tsht').nodes { visual = true }
end, { desc = 'Select ts node' })
vim.keymap.set('n', '<leader>m', function()
  require('tsht').nodes()
end, { desc = 'Select ts node' })
vim.keymap.set('o', 'in', function()
  require('tsht').nodes()
end, { desc = 'Select ts node' })
