local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local opts_echo = { noremap = true }

-- center search results
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

map('n', '[b', ':BufferLineCycleNext<CR>', opts)
map('n', 'b]', ':BufferLineCyclePrev<CR>', opts)

-- nnoremap <silent><mymap> :BufferLineMoveNext<CR>
-- nnoremap <silent><mymap> :BufferLineMovePrev<CR>

map('n', 'be', ':BufferLineSortByExtension<CR>', opts)
map('n', 'bd', ':BufferLineSortByDirectory<CR>', opts)
-- nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts)
map('n', '<leader>fm', '<cmd>Telescope man_pages<cr>', opts)
map('n', '<leader>fd', '<cmd>Telescope fd<cr>', opts)
map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', opts)

map('n', '<leader>tt', '<cmd>ToggleTerm<cr>', opts)
map('n', '<leader>tl', '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', opts)
map('n', '<leader>tc', '<cmd>TodoTrouble<cr>', opts)

map('n', '<leader>bn', '<cmd>BufferLineCycleNext<cr>', opts)
map('n', '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', opts)

map('n', '<leader>bd', '<cmd>bd<cr>', opts)

map('n', '<leader>vd', ':lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<leader>vr', ':lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>vh', ':lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<leader>vi', ':lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
map('n', 'gr', ':lua vim.lsp.buf.rename()<CR>', opts)

-- Lspsaga
map('n', 'gh', ':Lspsaga lsp_finder<CR>', opts)
-- map('n', '<leader>ca', ':Lspsaga code_action<CR>', opts)
map('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', opts)
map('n', 'K', ':Lspsaga hover_doc<CR>', opts)
map('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
map('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
map('n', 'gs', ':Lspsaga signature_help<CR>', opts)
-- map('n', 'gr', ':Lspsaga rename<CR>', opts)
map('n', 'gd', ':Lspsaga preview_definition<CR>', opts)

map('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', opts)
map('n', '<leader>cc', '<cmd>lua require"lspsaga.diagnostic".show_cursor_diagnostics()<CR>', opts)

map('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', opts)
map('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', opts)
-- floating terminal
map('n', '<A-d>', ':ToggleTerm<CR>', opts)
map('t', '<A-d>', '<C-\\><C-n>:ToggleTerm<CR>', opts)

map('t', '<Esc>', '<A-d> <C-\\><C-n>', opts_echo)


map('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
map('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
map('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
map('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
map('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
map('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
map('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
map('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
map('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)


map('n', '<leader>r', ':RunCode<CR>', opts_echo)
map('n', '<leader>rf', ':RunFile<CR>', opts_echo)
map('n', '<leader>rp', ':RunProject<CR>', opts_echo)
map('n', '<leader>crf', ':CRFiletype<CR>', opts)
map('n', '<leader>crp', ':CRProjects<CR>', opts)

map('v', 'm', ':lua require("tsht").nodes()<CR>', opts)

