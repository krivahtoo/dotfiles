local opts = { silent = true }

local get_opts = function(desc)
  return { silent = true, desc = desc }
end

-- center search results
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz", opts)

-- Remove search highlight
vim.keymap.set("n", "<F3>", ":noh<CR>", opts)

-- Copy to clipboard
vim.keymap.set("n", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>Y", "\"+y$", opts)

-- Paste from clipboard
vim.keymap.set("n", "<leader>p", "a<C-r>+<Esc>", opts)
vim.keymap.set("n", "<leader>P", "A<C-r>+<Esc>", opts)

-- Searchbox
vim.keymap.set('n', '<leader>ss', function()
  require('searchbox').incsearch()
end, get_opts('Incremental search'))
vim.keymap.set('n', '<leader>sS', function()
  require('searchbox').incsearch({ reverse = true })
end, get_opts('Reverse incremental search'))
vim.keymap.set('n', '<leader>sr', function()
  require('searchbox').replace({ confirm = 'menu' })
end, get_opts('Search and replace'))

-- FZF
vim.keymap.set('n', '<leader><Enter>', ':Buffers<CR>', opts)
vim.keymap.set('n', '<C-p>', ':GitFiles<CR>', opts)
vim.keymap.set('n', '<leader>sl', ':Lines<CR>', opts)
vim.keymap.set('n', '<leader>sf', ':Files<CR>', opts)

vim.keymap.set('n', '<leader>du', function()
  vim.cmd [[let old_undolevels = &undolevels]]
  vim.cmd [[set undolevels=-1]]
  vim.cmd [[exe "normal a \<BS>\<Esc>"]]
  vim.cmd [[let &undolevels = old_undolevels]]
  vim.cmd [[unlet old_undolevels]]
end, get_opts('Delete undofile'))

vim.keymap.set('n', '[b', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', 'b]', ':BufferLineCyclePrev<CR>', opts)

-- nnoremap <silent><mymap> :BufferLineMoveNext<CR>
-- nnoremap <silent><mymap> :BufferLineMovePrev<CR>

vim.keymap.set('n', 'be', ':BufferLineSortByExtension<CR>', opts)
vim.keymap.set('n', 'bd', ':BufferLineSortByDirectory<CR>', opts)
-- nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts)
vim.keymap.set('n', '<leader>fm', '<cmd>Telescope man_pages<cr>', opts)
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope fd<cr>', opts)
vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', opts)

vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', opts)
vim.keymap.set('n', '<leader>tl', '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', opts)
vim.keymap.set('n', '<leader>tc', '<cmd>TodoTrouble<cr>', opts)

vim.keymap.set('n', '<leader>bb', '<Cmd>BufferLinePick<CR>', opts)
vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineCycleNext<cr>', opts)
vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', opts)

vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>', opts)

vim.keymap.set('n', '<leader>vd', vim.lsp.buf.definition, get_opts('Go to definition'))
vim.keymap.set('n', '<leader>vr', vim.lsp.buf.references, get_opts('View reference on quickfix'))
vim.keymap.set('n', '<leader>vh', vim.lsp.buf.hover, get_opts('Hover'))
vim.keymap.set('n', '<leader>vi', vim.lsp.buf.implementation, get_opts('View implementation'))
vim.keymap.set('n', '<leader>vf', function()
  vim.lsp.buf.format { async = true }
end, get_opts('Format buffer'))
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, get_opts('View code actions'))
vim.keymap.set('n', 'gr', vim.lsp.buf.rename, get_opts('Lsp rename'))

-- Lspsaga
vim.keymap.set('n', 'gh', ':Lspsaga lsp_finder<CR>', opts)
-- map('n', '<leader>ca', ':Lspsaga code_action<CR>', opts)
vim.keymap.set('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', opts)
vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<C-f>', function()
  require("lspsaga.action").smart_scroll_with_saga(1)
end, opts)
vim.keymap.set('n', '<C-b>', function()
  require("lspsaga.action").smart_scroll_with_saga(-1)
end, opts)
vim.keymap.set('n', 'gs', ':Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gd', ':Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gl', ':Lspsaga show_line_diagnostics<CR>', opts)

-- Diagnostics
vim.keymap.set('n', '<leader>cd', function()
  vim.diagnostic.open_float({ border = 'single' })
end, get_opts('Open line diagnostics'))
vim.keymap.set('n', '<leader>cc', function()
  vim.diagnostic.open_float({
    scope = 'cursor',
    border = 'single'
  })
end, get_opts('Open cursor diagnostics'))

-- Quickfix and loclist
vim.keymap.set('n', '<leader>vc', function()
  vim.diagnostic.setqflist({
    severity = vim.diagnostic.severity.ERROR
  })
end, get_opts('Add diagnostics to qflist'))
vim.keymap.set('n', '<leader>vl', function()
  vim.diagnostic.setloclist({
    severity = vim.diagnostic.severity.ERROR
  })
end, get_opts('Add diagnostics to loclist'))
vim.keymap.set('n', '<leader>vx', function()
  vim.cmd [[call setqflist([])]]
end, get_opts('Clear qflist'))
vim.keymap.set('n', '<leader>vv', ':cw<CR>', opts)
vim.keymap.set('n', '[v', ':cprevious<CR>', opts)
vim.keymap.set('n', ']v', ':cnext<CR>', opts)

vim.keymap.set('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', opts)
-- floating terminal
vim.keymap.set('n', '<A-d>', ':ToggleTerm<CR>', opts)
vim.keymap.set('t', '<A-d>', '<C-\\><C-n>:ToggleTerm<CR>', opts)

vim.keymap.set('t', '<Esc>', '<A-d> <C-\\><C-n>', opts)


vim.keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
vim.keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
vim.keymap.set('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
vim.keymap.set('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
vim.keymap.set('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
vim.keymap.set('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
vim.keymap.set('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
vim.keymap.set('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
vim.keymap.set('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)

vim.keymap.set('n', '<leader>+', ':vertical resize +5<CR>', opts)
vim.keymap.set('n', '<leader>-', ':vertical resize -5<CR>', opts)

vim.keymap.set('n', '<leader>|', ':vsplit<CR>', opts)
vim.keymap.set('n', '<leader>_', ':split<CR>', opts)

vim.keymap.set('n', '<leader>rr', ":'<'>SnipRun<CR>", opts)
vim.keymap.set('n', '<leader>rl', ':SnipRun<CR>', opts)
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', opts)
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', opts)
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', opts)

vim.keymap.set('n', '<S-Tab>', '<C-w>w', opts)

-- Prevent x and the delete key from overriding what's in the clipboard.
vim.keymap.set('n', 'x', '"_x', opts)
vim.keymap.set('n', 'X', '"_x', opts)
vim.keymap.set('n', '<Del>', '"_x', opts)

vim.keymap.set('n', '<F7>', ':set list!<CR>', opts)

-- Keep cursor at the bottom of the visual selection after you yank it.
vim.keymap.set('v', 'y', 'ygv<Esc>')

vim.keymap.set('v', 'm', function() require("tsht").nodes() end, get_opts('Select ts node'))
vim.keymap.set('n', '<leader>m', function() require("tsht").nodes() end, get_opts('Select ts node'))
