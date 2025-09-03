local nvim_lsp = require 'lspconfig'
local util = require 'lspconfig.util'

local on_attach = function(_, bufnr) end

-- setup language servers
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
capabilities.offsetEncoding = { 'utf-16' }

local servers = {
  'clangd',
  'svelte',
  'pyright',
  'solargraph',
  'cmake',
  'texlab',
  'ts_ls',
  'vimls',
  'vuels',
  'nimls',
  'bashls',
  'emmet_language_server',
  'intelephense',
  'slint_lsp',
  'tinymist',
  'sqlls',
  'gopls', --, 'html', 'cssls'
  {
    'rust_analyzer',
    config = {
      settings = {
        ['rust-analyzer'] = {
          checkOnSave = {
            command = 'clippy',
          },
        },
      },
    },
  },
  {
    'tailwindcss',
    config = {
      root_dir = function(fname)
        -- If Neovim passes a buffer number, convert it to a filename
        if type(fname) == "number" then
          fname = vim.api.nvim_buf_get_name(fname)
        end

        if fname == "" then
          return nil
        end

        local root = util.root_pattern(
              'tailwind.config.js',
              'tailwind.config.ts',
              'tailwind.config.cjs',
              'components.json' -- shadcn
            )(fname)
            or util.root_pattern('windi.config.js', 'windi.config.ts')(fname)
            or util.root_pattern('postcss.config.js', 'postcss.config.ts')(fname)

        if root then
          return util.find_package_json_ancestor(fname)
              or util.find_node_modules_ancestor(fname)
              or util.find_git_ancestor(fname)
              or root
        end

        return nil
      end,
    },
  },
  {
    'lua_ls',
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
            vim.lsp.buf.format {
              async = true,
              range = {
                ["start"] = { 0, 0 },
                ["end"] = { vim.fn.line("$"), 0 },
              },
            }
          end,
        },
      },
    },
  },
}

require('neodev').setup {}

vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    if vim.lsp.is_enabled('lua_ls') then
      return
    end
    for _, server in ipairs(servers) do
      local config = { on_attach = on_attach, capabilities = capabilities }
      local name = server

      if type(server) == 'table' then
        name = server[1]
        config = vim.tbl_deep_extend('force', config, server.config)
      end

      vim.lsp.config(name, config)
      vim.lsp.enable(name)
    end
  end,
})


vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- client.server_capabilities.semanticTokensProvider = nil
  end,
})

-- Lsp keymaps
local map = vim.keymap.set

map(
  'n',
  '<leader>vd',
  vim.lsp.buf.definition,
  { desc = 'Go to definition' }
)

map('n', '<leader>ih', function()
  local buf = vim.api.nvim_get_current_buf()
  local enabled = vim.lsp.inlay_hint.is_enabled(buf)
  vim.lsp.inlay_hint(buf, not enabled)
end, { desc = 'Toggle inlay hints' })

map('n', '<Space>h', function()
  local buf = vim.api.nvim_get_current_buf()
  local enabled = vim.lsp.inlay_hint.is_enabled(buf)
  vim.lsp.inlay_hint(buf, not enabled)
end, { desc = 'Toggle inlay hints' })

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
