local ok, nvim_lsp = pcall(require, 'lspconfig')
if not ok then
  return
end

nvim_lsp.lua_ls.setup {
  cmd = {
    'lua-language-server',
    '-E',
    '/usr/lib/lua-language-server/main.lua',
  },
  -- on_attach = on_attach,
  settings = {
    Lua = {
      completion = {
        enable = true,
        keywordSnippet = 'Replace',
        callSnippet = 'Replace',
        displayContext = 5,
      },
      develop = {
        enable = false,
        debuggerPor = 11412,
        debuggerWait = false,
      },
      diagnostics = {
        enable = true,
        globals = {
          'luakit',
          'msg',
          'ipc',
          'soup',
        },
      },
      hover = {
        enable = true,
        viewNumber = true,
        viewString = true,
        viewStringMax = 1000,
      },
      runtime = {
        version = 'LuaJIT',
        path = {
          '?.lua',
          '?/init.lua',
          '?/?.lua',
        },
      },
      signatureHelp = {
        enable = true,
      },
      workspace = {
        maxPreload = 2000,
        preloadFileSize = 1000,
        -- Make the server aware of luakit runtime files
        library = {
          '/usr/share/luakit/lib/',
        }
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
