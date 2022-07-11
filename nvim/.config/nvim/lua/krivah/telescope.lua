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
require('telescope').load_extension 'notify'
