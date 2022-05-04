local opts = { silent = true }

-- TODO: move to nvim builtin vim.keymap.set()

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
vim.keymap.set('n', '<leader>ss', ':SearchBoxIncSearch<CR>', opts)
vim.keymap.set('n', '<leader>sS', ':SearchBoxIncSearch reverse=true<CR>', opts)

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

vim.keymap.set('n', '<leader>vd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<leader>vr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<leader>vh', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>vi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)

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
-- map('n', 'gr', ':Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'gd', ':Lspsaga preview_definition<CR>', opts)

vim.keymap.set('n', '<leader>cd', function()
  vim.diagnostic.open_float({ border = 'single' })
end, opts)
vim.keymap.set('n', '<leader>cc', function()
  vim.diagnostic.open_float({
    scope = 'cursor',
    border = 'single'
  })
end, opts)

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

vim.keymap.set('v', 'm', require("tsht").nodes, opts)

