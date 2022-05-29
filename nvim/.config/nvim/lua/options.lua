local o = vim.opt

vim.cmd [[syntax enable]]

vim.g.do_filetype_lua = 1

o.guifont = 'JetBrainsMono Nerd Font:h11,codicon:h11'
o.encoding = 'utf-8'
o.number = true
o.relativenumber = true
o.mouse = 'a'
o.numberwidth = 3

o.backup = false
o.swapfile = false
o.writebackup = false
o.undofile = true

o.splitbelow = true
o.splitright = true

o.termguicolors = true
o.wildignore = {
  '*.pyc', '**/__pycache__/*', '**/node_modules/*', '.coverage.*', '.eggs', '*.egg-info/'
}
o.list = false
o.listchars = {
  eol = '¬',
  tab = '» ',
  trail = '~',
  extends = '≻',
  precedes = '≺',
  space = '␣',
  lead = '·'
}
o.wildignorecase = true
o.timeoutlen = 500

o.expandtab = true
o.smarttab = true
o.shiftwidth = 2
o.tabstop = 4

o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.scrolloff = 3 -- Minimal number of screen lines to keep above and below the cursor

o.linebreak = true
o.textwidth = 500

o.autoindent = true --Auto indent
o.smartindent = true --Smart indent
o.wrap = false --Wrap lines
o.laststatus = 3
o.cursorline = true
o.cursorcolumn = true
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldtext = 'v:lua.NeatFoldText()' -- Set text of folds
o.fillchars = {
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┫',
  vertright = '┣',
  verthoriz = '╋',
  fold = '═',
}

o.spell = false
o.spelllang = { 'en_us' }

--- @return string fold_text a neat template for the summary of what is on a fold
function NeatFoldText()
  return string.format(
    '╒═╡    %s ... %s  (%d lines)╞',
    vim.api.nvim_buf_get_lines(0, vim.v.foldstart - 1, vim.v.foldstart, true)[1],
    vim.gsplit(
      vim.trim(vim.api.nvim_buf_get_lines(0, vim.v.foldend - 1, vim.v.foldend, true)[1]),
      ' '
    )(),
    vim.v.foldend - vim.v.foldstart + 1
  )
end -- ‡


