local nvim_lsp = require 'lspconfig'
local util = require 'lspconfig.util'

local signs = {
  Error = ' ',
  Warning = ' ',
  Hint = ' ',
  Information = ' ',
}
local severity_names = { 'Error', 'Warning', 'Hint', 'Information' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.diagnostic.config {
  -- Enable underline, use default values
  underline = {
    severity = { min = vim.diagnostic.severity.WARN },
  },
  -- Enable virtual text, override spacing to 4
  virtual_text = {
    spacing = 4,
    prefix = '◈', -- ⛬ ► ◉ ◈
    format = function(diag)
      local sign = signs[severity_names[diag.severity]] or signs.Hint
      return string.format('%s %s', sign, diag.message)
    end,
  },
  -- Use a function to dynamically turn signs off
  -- and on, using buffer local variables
  signs = true,
  float = {
    source = 'if_many',
    border = 'single',
  },
  severity_sort = true,
  -- update_in_insert = true,
}

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- setup language servers
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local servers = {
  'clangd',
  'svelte',
  'pyright',
  'solargraph',
  'cmake',
  'texlab',
  'tsserver',
  'vimls',
  'vuels',
  'rust_analyzer',
  'nimls',
  'bashls',
  'emmet_ls',
  'intelephense',
  'gopls', --, 'html', 'cssls'
}

for _, server in ipairs(servers) do
  nvim_lsp[server].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

nvim_lsp.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = function(fname)
    return (
        util.root_pattern('tailwind.config.js', 'tailwind.config.ts')(
          fname
        )
        or util.root_pattern('windi.config.js', 'windi.config.ts')(fname)
        or util.root_pattern('postcss.config.js', 'postcss.config.ts')(
          fname
        )
      )
      and (
        util.find_package_json_ancestor(fname)
        or util.find_node_modules_ancestor(fname)
        or util.find_git_ancestor(fname)
      )
  end,
}

nvim_lsp.elixirls.setup {
  capabilities = capabilities,
  cmd = { '/home/krivah/Applications/elixir-ls/language_server.sh' },
}

nvim_lsp.jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line '$', 0 })
      end,
    },
  },
}

nvim_lsp.sumneko_lua.setup {
  cmd = {
    'lua-language-server',
    '-E',
    '/usr/lib/lua-language-server/main.lua',
  },
  on_attach = on_attach,
  settings = {
    Lua = {
      completion = {
        enable = true,
        keywordSnippet = 'Both',
        callSnippet = 'Both',
        displayContext = 5,
      },
      develop = {
        enable = false,
        debuggerPor = 11412,
        debuggerWait = false,
      },
      diagnostics = {
        enable = true,
        globals = { 'vim' },
      },
      hover = {
        enable = true,
        viewNumber = true,
        viewString = true,
        viewStringMax = 1000,
      },
      runtime = {
        version = 'Lua 5.4',
        path = {
          '?.lua',
          '?/init.lua',
          '?/?.lua',
          '/usr/share/5.4/?.lua',
          '/usr/share/lua/5.4/?/init.lua',
        },
      },
      signatureHelp = {
        enable = true,
      },
      workspace = {
        maxPreload = 2000,
        preloadFileSize = 1000,
        -- Make the server aware of Neovim runtime files
        -- library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
