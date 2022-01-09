local nvim_lsp = require'lspconfig'

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
local severity_names = { 'Error', 'Warning', 'Hint', 'Information' }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
  -- Enable underline, use default values
  underline = true,
  -- Enable virtual text, override spacing to 4
  virtual_text = {
    spacing = 4,
    prefix = '',
    format = function (diag)
      local sign = signs[severity_names[diag.severity]] or signs.Hint
      return string.format('%s %s', sign, diag.message)
    end
  },
  -- Use a function to dynamically turn signs off
  -- and on, using buffer local variables
  signs = true,
}

local lsp_status = require('lsp-status')
lsp_status.register_progress()

lsp_status.config {
  kind_labels = {},
  show_filename = true,
  current_function = true,
  indicator_separator = "",
  indicator_ok = "",
  status_symbol = "",
  diagnostics = false
}

require'lsp_signature'.setup {
  debug = false, -- set to true to enable debug logging
  -- log_path = "debug_log_file_path", -- debug log path
  verbose = false, -- show debug line number
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 0, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
  -- set to 0 if you DO NOT want any API comments be shown
  -- This setting only take effect in insert mode, it does not affect signature help in normal
  -- mode, 10 by default
  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
  hint_scheme = "String",
  use_lspsaga = false,  -- set to true if you want to use lspsaga popup
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
  -- to view the hiding contents
  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  handler_opts = {
    border = "none"   -- double, rounded, single, shadow, none
  },
  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
  auto_close_after = 5, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc
  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
} -- no need to specify bufnr if you don't use toggle_key

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client)
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
        keywordSnippet = "Both",
        callSnippet = "Both",
        displayContext = 5
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

