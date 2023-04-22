require('silicon').setup {
  font = 'FantasqueSansMono Nerd Font=26',
  background = '#87f',
  theme = 'Monokai Extended',
  line_number = true,
  pad_vert = 80,
  pad_horiz = 50,
  gobble = true,
  output = {
    path = '/home/krivah/Pictures/Screenshots',
  },
  watermark = {
    text = ' @krivahtoo',
  },
  window_title = function()
    return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ':~:.')
  end,
}

vim.api.nvim_create_user_command('CaptureSel', function(opts)
  require('silicon').capture {
    font = 'FantasqueSansMono Nerd Font=26',
    background = '#87f',
    theme = 'Monokai Extended',
    line_number = true,
    pad_vert = 80,
    pad_horiz = 50,
    line1 = opts.line1,
    line2 = opts.line2,
    highlight_selection = true,
    output = {
      clipboard = false,
      path = '/home/krivah/Pictures/Screenshots',
    },
  }
end, { range = true })
