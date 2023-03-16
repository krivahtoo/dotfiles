local nvim_lsp = require 'lspconfig'
local util = require 'lspconfig.util'

local signs = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = ' ',
}
local severity_names = { 'Error', 'Warn', 'Info', 'Hint' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.fn.sign_define('LightBulbSign', {
  text = 'ﯧ ',
  texthl = 'DiagnosticSignInfo',
  numhl = '',
})

local on_attach = function(_, bufnr)
  vim.diagnostic.config {
    -- Enable underline, use default values
    underline = {
      severity = { min = vim.diagnostic.severity.WARN },
    },
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
      prefix = '', -- ⛬ ► ◉ ◈
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
end

-- setup language servers
local capabilities = require('cmp_nvim_lsp').default_capabilities(
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
  'nimls',
  'bashls',
  'emmet_ls',
  'intelephense',
  'slint_lsp',
  'gopls', --, 'html', 'cssls'
  {
    'rust_analyzer',
    config = {
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = 'clippy'
          }
        }
      }
    }
  },
  {
    'tailwindcss',
    config = {
      root_dir = function(fname)
        return (
            util.root_pattern(
              'tailwind.config.js',
              'tailwind.config.ts',
              'tailwind.config.cjs'
            )(fname)
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
  },
  {
    'sumneko_lua',
    config = {
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
    },
  },
  {
    'jsonls',
    config = {
      commands = {
        Format = {
          function()
            vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line '$', 0 })
          end,
        },
      },
    }
  }
}

for _, server in ipairs(servers) do
  local config = { on_attach = on_attach, capabilities = capabilities }
  local name = server;

  if type(server) == "table" then
    name = server[1]
    config = vim.tbl_deep_extend("force", config, server.config)
  end

  nvim_lsp[name].setup(config)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
    -- if client.server_capabilities.completionProvider then
    --   vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    -- end
    -- if client.server_capabilities.definitionProvider then
    --   vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    -- end
  end,
})

nvim_lsp.elixirls.setup {
  capabilities = capabilities,
  cmd = { '/home/krivah/Applications/elixir-ls/language_server.sh' },
}

-- Lsp keymaps
local map = vim.keymap.set

map(
  'n',
  '<leader>vd',
  vim.lsp.buf.definition,
  { desc = 'Go to definition' }
)
map(
  'n',
  '<leader>vr',
  vim.lsp.buf.references,
  { desc = 'View reference on quickfix' }
)
map('n', '<leader>vh', vim.lsp.buf.hover, { desc = 'Hover' })
map(
  'n',
  '<leader>vi',
  vim.lsp.buf.implementation,
  { desc = 'View implementation' }
)
map('n', '<leader>vf', function()
  vim.lsp.buf.format { async = true }
end, { desc = 'Format buffer' })
map(
  'n',
  '<leader>ca',
  vim.lsp.buf.code_action,
  { desc = 'View code actions' }
)
map('n', 'gr', vim.lsp.buf.rename, { desc = 'Lsp rename' })
