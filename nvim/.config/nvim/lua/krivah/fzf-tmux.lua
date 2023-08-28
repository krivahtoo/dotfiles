local fzf_tmux = require 'fzf-tmux'

fzf_tmux.setup {}

vim.keymap.set('n', '<leader><Enter>', function()
  fzf_tmux.buffers {}
end, { desc = 'Switch buffers' })

vim.keymap.set('n', '<C-p>', function()
  fzf_tmux.all_files()
end, { desc = 'Find a file in current working directory' })

vim.keymap.set('n', '<leader>sl', function()
  fzf_tmux.lines(false)
end, { desc = 'Find a line in listed buffers' })

vim.keymap.set('n', '<leader>sb', function()
  fzf_tmux.lines(true)
end, { desc = 'Find a line in current buffer' })

vim.keymap.set('n', '<leader>sf', function()
  local cwd = vim.fn.getcwd()
  vim.cmd(":cd " .. vim.fn.expand('%:p:h'))
  fzf_tmux.files {
    command = 'fd',
    args = {
      '--type',
      'file',
      '-H',
      '-E',
      '.git',
      '--strip-cwd-prefix',
      '--color',
      'always',
    },
  }
  vim.cmd(":cd " .. cwd)
end, { desc = 'Find a file in current file directory' })
