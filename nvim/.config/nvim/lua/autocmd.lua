-- vim.api.nvim_exec([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]], false)
-- vim.api.nvim_exec([[autocmd BufEnter * EnableBlameLine]], false)
-- vim.api.nvim_exec([[autocmd FileType html,css EmmetInstall]], false)
vim.cmd [[autocmd BufWritePre *.html :normal gg=G]]
