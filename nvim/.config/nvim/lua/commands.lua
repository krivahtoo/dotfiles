vim.api.nvim_create_user_command('Silicon', function(opts)
  local lines = vim.api.nvim_buf_get_lines(
    0,
    opts.line1 - 1,
    opts.line2 + 1,
    false
  )
  vim.fn.system({
    'silicon',
    '--to-clipboard',
    '--shadow-blur-radius',
    '5',
    '--shadow-offset-x',
    '10',
    '--shadow-offset-y',
    '8',
    '--pad-horiz',
    '40',
    '--pad-vert',
    '40',
    '--language',
    vim.bo.filetype,
  }, lines)
end, { range = true })
