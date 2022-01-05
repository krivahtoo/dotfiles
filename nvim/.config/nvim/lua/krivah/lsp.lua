local nvim_lsp = require'lspconfig'

local on_attach = function(client, bufnr)
  require'lsp_signature'.on_attach()
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- setup language servers
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
  'clangd', 'svelte', 'pyright', 'solargraph', 'cmake', 'texlab',
  'tsserver', 'vimls', 'vuels', 'rust_analyzer', 'nimls', 'bashls',
  'emmet_ls', 'intelephense', 'tailwindcss', 'html', 'cssls'
}

for _, server in ipairs(servers) do
  nvim_lsp[server].setup{
    capabilities = capabilities,
    on_attach = on_attach
  }
end

nvim_lsp.elixirls.setup{
  capabilities = capabilities,
  cmd = { "/home/krivah/Applications/elixir-ls/language_server.sh" };
}

nvim_lsp.jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}

nvim_lsp.sumneko_lua.setup{
  cmd = { "lua-language-server", "-E", "/usr/lib/lua-language-server/main.lua" },
  on_attach = on_attach,
  settings = {
    Lua = {
      completion = {
        enable = true,
        keywordSnippet = "Disable"
      },
      develop = {
        enable = false,
        debuggerPor = 11412,
        debuggerWait = false
      },
      diagnostics = {
        enable = true,
        globals = {'vim'},
      },
      hover = {
        enable = true,
        viewNumber = true,
        viewString = true,
        viewStringMax = 1000
      },
      runtime = {
        version = 'Lua 5.4',
        path = {
          "?.lua",
          "?/init.lua",
          "?/?.lua",
          "/usr/share/5.4/?.lua",
          "/usr/share/lua/5.4/?/init.lua"
        }
      },
      signatureHelp = {
        enable = true
      },
      workspace = {
        maxPreload = 2000,
        preloadFileSize = 1000,
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false
      }
    }
  }
}

