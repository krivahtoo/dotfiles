local null_ls = require 'null-ls'
local helpers = require 'null-ls.helpers'

local betty_style = {
  name = 'Betty',
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { 'c', 'cpp' },
  generator = null_ls.generator {
    command = 'betty-style',
    args = { '$FILENAME' },
    from_stderr = false,
    format = 'line',
    check_exit_code = function(code, _)
      return code <= 1
    end,
    on_output = helpers.diagnostics.from_pattern(
      '[^:]+:(%d+): (%w+): (.*)$',
      { 'row', 'severity', 'message' },
      {
        severities = {
          WARNING = helpers.diagnostics.severities.warning,
          ERROR = helpers.diagnostics.severities.error,
        },
      }
    ),
  },
}

local betty_doc = {
  name = 'Betty',
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { 'c', 'cpp' },
  generator = null_ls.generator {
    command = 'betty-doc',
    args = { '$FILENAME' },
    from_stderr = true,
    format = 'line',
    check_exit_code = function(code, _)
      return code <= 1
    end,
    on_output = helpers.diagnostics.from_pattern(
      '[^:]+:(%d+): (%w+): (.*)$',
      { 'row', 'severity', 'message' }
    ),
  },
}

null_ls.setup {
  debounce = 500,
  diagnostics_format = '#{m} (#{s})',
  update_in_insert = false,
  sources = {
    -- null_ls.builtins.diagnostics.eslint_d,
    -- null_ls.builtins.code_actions.eslint_d,
    -- null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.pycodestyle,
    betty_style,
    betty_doc,
  },
}
