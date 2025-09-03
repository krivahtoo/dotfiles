local icons = require('krivah.icons')

local signs = {
  Error = icons.diagnostics.Error,
  Warn = icons.diagnostics.Warning,
  Info = icons.diagnostics.Information,
  Hint = icons.diagnostics.Hint,
}
local severity_names = { 'Error', 'Warn', 'Info', 'Hint' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.fn.sign_define('LightBulbSign', {
  text = icons.misc.LightBulb,
  texthl = 'DiagnosticSignInfo',
  numhl = '',
})
vim.diagnostic.config {
  underline = {
    severity = { min = vim.diagnostic.severity.WARN },
  },
  virtual_text = {
    spacing = 4,
    prefix = function(diag, i, total)
      if i > 1 then
        return ""
      end
      if total > 1 then
        return string.format('%d', total)
      end
      return '◈ '
    end,
    format = function(diag)
      local sign = signs[severity_names[diag.severity]] or signs.Hint
      return string.format('%s %s', sign, diag.message)
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.INFO] = signs.Info,
      [vim.diagnostic.severity.HINT] = signs.Hint,
    },
  },
  float = {
    source = 'if_many',
    border = 'single',
  },
  severity_sort = true,
}

vim.api.nvim_create_autocmd('LspAttach', {
  once = true,
  callback = function(_)
    vim.diagnostic.config {
      underline = {
        severity = { min = vim.diagnostic.severity.WARN },
      },
      virtual_text = {
        spacing = 4,
        prefix = function(diag, i, total)
          if i > 1 then
            return ""
          end
          if total > 1 then
            return string.format('%d', total)
          end
          return '◈ '
        end,
        format = function(diag)
          local sign = signs[severity_names[diag.severity]] or signs.Hint
          return string.format('%s %s', sign, diag.message)
        end,
      },
      virtual_lines = {
        severity = { min = vim.diagnostic.severity.WARN },
        current_line = true,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN] = signs.Warn,
          [vim.diagnostic.severity.INFO] = signs.Info,
          [vim.diagnostic.severity.HINT] = signs.Hint,
        },
      },
      float = {
        source = 'if_many',
        border = 'single',
      },
      severity_sort = true,
    }
  end,
})

local map = vim.keymap.set

map('n', '<F8>', function()
  if vim.g.lsp_virtual_text == nil or vim.g.lsp_virtual_text == true then
    vim.g.lsp_virtual_text = false
    vim.diagnostic.hide()
  else
    vim.g.lsp_virtual_text = true
    vim.diagnostic.show()
  end
end, { desc = 'Toggle virtual text' })
-- Diagnostics
map('n', '<leader>cd', function()
  vim.diagnostic.open_float { border = 'single' }
end, { desc = 'Open line diagnostics' })
map('n', '<leader>cc', function()
  vim.diagnostic.open_float {
    scope = 'cursor',
    border = 'single',
  }
end, { desc = 'Open cursor diagnostics' })

-- Quickfix and loclist
map('n', '<leader>vc', function()
  vim.diagnostic.setqflist {
    severity = vim.diagnostic.severity.ERROR,
  }
end, { desc = 'Add diagnostics to qflist' })
map('n', '<leader>vl', function()
  vim.diagnostic.setloclist {
    severity = vim.diagnostic.severity.ERROR,
  }
end, { desc = 'Add diagnostics to loclist' })
