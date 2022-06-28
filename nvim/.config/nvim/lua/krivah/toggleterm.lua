local tt = require 'toggleterm'
tt.setup()

vim.keymap.set('n', '<leader>tt', function()
  tt.toggle(0)
end, { desc = 'Toggle term' })

vim.keymap.set('n', '<leader>tf', function()
  tt.toggle(0, nil, nil, 'float')
end, { desc = 'Toggle float term' })
