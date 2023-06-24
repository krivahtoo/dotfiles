vim.api.nvim_create_user_command('ToggleBetty', function(_)
  require('null-ls.sources').toggle('Betty')
end, {})
