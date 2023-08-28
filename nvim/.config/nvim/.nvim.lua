local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

require('neodev').setup {}

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        keywordSnippet = 'Replace',
        displayContext = 5,
      },
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})
