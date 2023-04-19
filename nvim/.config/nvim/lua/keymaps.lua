local opts = { silent = true }

local get_opts = function(desc)
  return { silent = true, desc = desc }
end

local map = vim.keymap.set

-- Execute macro q on visual selection
map('x', 'Q', ':normal Q<CR>', { remap = true })

-- center search results
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz', opts)

-- Remove search highlight
map('n', '<F3>', ':noh<CR>', opts)

map('x', '<Space>p', '"_dP', opts)

map('n', '<Space>d', '"_d', opts)
map('x', '<Space>d', '"_d', opts)

-- Copy to clipboard
map('n', '<leader>y', '"+y', opts)
map('n', '<leader>Y', '"+y$', opts)

-- Paste from clipboard
map('n', '<leader>p', 'a<C-r>+<Esc>', opts)
map('n', '<leader>P', 'A<C-r>+<Esc>', opts)

map('n', '<leader>du', function()
  vim.cmd [[let old_undolevels = &undolevels]]
  vim.cmd [[set undolevels=-1]]
  vim.cmd [[exe "normal a \<BS>\<Esc>"]]
  vim.cmd [[let &undolevels = old_undolevels]]
  vim.cmd [[unlet old_undolevels]]
end, get_opts 'Delete undofile')

map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', opts)

map(
  'n',
  '<leader>tl',
  '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>',
  opts
)
map('n', '<leader>tc', '<cmd>TodoTrouble<cr>', opts)

map('n', '<leader>bd', '<cmd>Bdelete<cr>', opts)

map('n', '<leader>vx', function()
  vim.cmd [[call setqflist([])]]
end, get_opts 'Clear qflist')
map('n', '<leader>vv', ':cw<CR>', opts)
map('n', '[v', ':cprevious<CR>', opts)
map('n', ']v', ':cnext<CR>', opts)

-- floating terminal
map('n', '<A-d>', ':ToggleTerm<CR>', opts)
map('t', '<A-d>', '<C-\\><C-n>:ToggleTerm<CR>', opts)

map('t', '<Esc>', '<A-d> <C-\\><C-n>', opts)

map('n', '<leader>+', ':vertical resize +5<CR>', opts)
map('n', '<leader>-', ':vertical resize -5<CR>', opts)

map('n', '<leader><leader>+', ':resize +5<CR>', opts)
map('n', '<leader><leader>-', ':resize -5<CR>', opts)

map('n', '<leader>|', ':vsplit<CR>', opts)
map('n', '<leader>_', ':split<CR>', opts)

map('n', '<leader>rr', ":'<'>SnipRun<CR>", opts)
map('n', '<leader>rl', ':SnipRun<CR>', opts)
map('n', '<leader>rp', ':RunProject<CR>', opts)
map('n', '<leader>crf', ':CRFiletype<CR>', opts)
map('n', '<leader>crp', ':CRProjects<CR>', opts)

map('n', '<S-Tab>', '<C-w>w', opts)

-- Prevent x and the delete key from overriding what's in the clipboard.
map('n', 'x', '"_x', opts)
map('x', 'x', '"_x', opts)
map('n', 'X', '"_X', opts)
map('n', '<Del>', '"_x', opts)

map('n', '<F7>', ':set list!<CR>', opts)

-- Keep cursor at the bottom of the visual selection after you yank it.
map('x', 'y', 'ygv<Esc>')

map('x', 'SS', ':Silicon<CR>')

map('n', '<leader>ii', '<cmd>PickEverything<cr>', opts)
-- map('i', '<C-i>', '<cmd>PickEverythingInsert<cr>', opts)
