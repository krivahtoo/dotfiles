require('silicon').setup {
  font = 'FantasqueSansMono Nerd Font=26',
  background = '#87f',
  theme = 'Monokai Extended',
  line_number = true,
  pad_vert = 80,
  pad_horiz = 50,
  output = {
    path = "/home/krivah/Pictures/Screenshots"
  },
  watermark = {
    text = ' @krivahtoo',
  },
  window_title = function()
    return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ':~:.')
  end,
}
