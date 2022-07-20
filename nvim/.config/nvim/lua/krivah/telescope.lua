require('telescope').setup {
  defaults = {
    prompt_prefix = '  ',
    selection_caret = ' ',
    multi_icon = '留',
    borderchars = {
      '─',
      '│',
      '─',
      '│',
      '╭',
      '╮',
      '╯',
      '╰',
    },
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close,
      },
    },
  },
}

local map = vim.keymap.set
local t = require 'telescope.builtin'

map('n', '<leader>ff', t.find_files, { desc = 'find files' })
map('n', '<leader>fg', t.live_grep, { desc = 'live grep' })
map('n', '<leader>fb', t.buffers, { desc = 'switch buffer' })
map('n', '<leader>fh', t.help_tags, { desc = 'search help tags' })
map('n', '<leader>fk', t.keymaps, { desc = 'search keymaps' })
map('n', '<leader>fm', t.man_pages, { desc = 'search man page' })
map('n', '<leader>fd', t.fd, { desc = 'run fd' })
map('n', '<leader>fo', t.oldfiles, { desc = 'search old files' })
map('n', '<leader>:', t.command_history, { desc = 'command history' })

require('telescope').load_extension 'notify'
