require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.keymap.set({ 'n', 'o', 'v' }, '<leader>e', function()
  require 'hop'.hint_words({
    hint_position = require 'hop.hint'.HintPosition.END,
    inclusive_jump = vim.fn.mode() == 'o'
  })
end, { desc = 'Hop on current buffer' })

vim.keymap.set('n', '<leader>E', function()
  require 'hop'.hint_words({
    hint_position = require 'hop.hint'.HintPosition.END,
    multi_windows = true
  })
end, { desc = 'Hop on current windows' })

vim.keymap.set({ 'n', 'o' }, 's', function()
  require 'hop'.hint_char1({
    direction = require 'hop.hint'.HintDirection.AFTER_CURSOR,
    inclusive_jump = true
  })
end, { desc = 'Hop 1 char after cursor' })

vim.keymap.set({ 'n', 'o' }, 'S', function()
  require 'hop'.hint_char1({
    direction = require 'hop.hint'.HintDirection.BEFORE_CURSOR,
    inclusive_jump = vim.fn.mode() == 'o'
  })
end, { desc = 'Hop 1 char before cursor' })
