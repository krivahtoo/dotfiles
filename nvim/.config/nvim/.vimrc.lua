local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local luadev = require('lua-dev').setup({
  library = {
    vimruntime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true,
  },
  runtime_path = false, -- enable this to get completion in require strings. Slow!
  lspconfig = {
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
  },
})

lspconfig.sumneko_lua.setup(luadev)

