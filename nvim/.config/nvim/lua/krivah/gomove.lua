require('gomove').setup {
  -- whether or not to map default key bindings, (true/false)
  map_defaults = false,
  move_past_end_col = true,
}
local map = vim.keymap.set

map('x', '<C-Up>', '<Plug>GoVSMUp')
map('x', '<C-Down>', '<Plug>GoVSMDown')
map('x', '<C-Left>', '<Plug>GoVSMLeft')
map('x', '<C-Right>', '<Plug>GoVSMRight')
