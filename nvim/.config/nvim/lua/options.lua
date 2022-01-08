local o = vim.opt
local g = vim.g

vim.cmd [[syntax enable]]

o.guifont = 'JetBrainsMono Nerd Font:h10,codicon:h10'
o.encoding = 'utf-8'
o.number = true
o.relativenumber = true
o.mouse = 'a'

o.backup = false
o.swapfile = false
o.wb = false

o.splitbelow = true
o.splitright = true

o.termguicolors = true
o.wildignore = {
  '*.pyc', '**/__pycache__/*', '**/node_modules/*', '.coverage.*', '.eggs', '*.egg-info/'
}
o.list = true
o.listchars = {eol = '¬', tab = '>·', trail = '~', extends = '>', precedes = '<', space = '␣'}
o.wildignorecase = true
o.timeoutlen = 500

o.expandtab = true
o.smarttab = true
o.shiftwidth = 2
o.tabstop = 4

o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.scrolloff = 3 -- Minimal number of screen lines to keep above and below the cursor

o.lbr = true
o.tw = 500

o.ai = true --Auto indent
o.si = true --Smart indent
o.wrap = true --Wrap lines
o.cursorcolumn = true
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldtext = 'v:lua.NeatFoldText()' -- Set text of folds

--- @return string fold_text a neat template for the summary of what is on a fold
function NeatFoldText()
  return string.format(
    '    %s   %d lines',
    vim.api.nvim_buf_get_lines(0, vim.v.foldstart - 1, vim.v.foldstart, true)[1],
    vim.v.foldend - vim.v.foldstart + 1
  )
end -- ‡


