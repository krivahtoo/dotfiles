require 'options'
require 'keymaps'
require 'autocmd'
require 'functions'
require 'plugins'
vim.defer_fn(function()
  require('krivah.pqf').setup()
end, 0)
