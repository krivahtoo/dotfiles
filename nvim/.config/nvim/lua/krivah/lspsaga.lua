local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = ' ',
  warn_sign = ' ',
  hint_sign = '',
  infor_sign = ' ',
  diagnostic_header_icon = '   ',
  -- code action title icon
  code_action_icon = ' ',
  code_action_prompt = {
    enable = false,
    sign = true,
    sign_priority = 40,
    virtual_text = false,
  },
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  max_preview_lines = 10,
  finder_action_keys = {
    open = 'o',
    vsplit = 's',
    split = 'i',
    quit = 'q',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
  code_action_keys = {
    quit = 'q',
    exec = '<CR>',
  },
  rename_action_keys = {
    quit = '<C-c>',
    exec = '<CR>',
  },
  definition_preview_icon = '  ',
  border_style = 'single',
  rename_prompt_prefix = '➤ ',
  server_filetype_map = {},
  diagnostic_prefix_format = '%d. ',
}

-- Lspsaga
vim.keymap.set('n', 'gh', function()
  require('lspsaga.provider').lsp_finder()
end, { desc = 'Lspsaga lsp_finder' })
-- map('n', '<leader>ca', ':Lspsaga code_action<CR>')
vim.keymap.set(
  'x',
  '<leader>ca',
  ':<C-U>Lspsaga range_code_action<CR>',
  { silent = true }
)
vim.keymap.set('n', 'K', function()
  require('lspsaga.hover').render_hover_doc()
end, { desc = 'Lspsaga hover doc' })
vim.keymap.set('n', '<C-f>', function()
  require('lspsaga.action').smart_scroll_with_saga(1)
end)
vim.keymap.set('n', '<C-b>', function()
  require('lspsaga.action').smart_scroll_with_saga(-1)
end)

vim.keymap.set('n', 'gs', function()
  require('lspsaga.signaturehelp').signature_help()
end, { desc = 'View signature help' })

vim.keymap.set('n', 'gd', function()
  require('lspsaga.provider').preview_definition()
end, { desc = 'Preview definition' })

vim.keymap.set('n', 'gl', function()
  require('lspsaga.diagnostic').show_line_diagnostics()
end, { desc = 'Goto next diagnostic' })

vim.keymap.set(
  'n',
  '[e',
  require('lspsaga.diagnostic').navigate 'next',
  { desc = 'Goto next diagnostic' }
)
vim.keymap.set(
  'n',
  ']e',
  require('lspsaga.diagnostic').navigate 'prev',
  { desc = 'Goto previous diagnostic' }
)
