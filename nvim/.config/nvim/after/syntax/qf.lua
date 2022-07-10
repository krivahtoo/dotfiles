if vim.b.pqf_syntax == 1 then
  return
end
vim.b.pqf_syntax = 1

require('krivah.pqf').syntax()
