local shared = require 'snippets'
local same = shared.same

local newline = function(text)
  return t { '', text }
end

local require_var = function(args, _)
  local text = args[1][1] or ''
  local split = vim.split(text, '.', { plain = true })

  local options = {}
  for len = 0, #split - 1 do
    table.insert(
      options,
      t(table.concat(vim.list_slice(split, #split - len, #split), '_'))
    )
  end

  return sn(nil, {
    c(1, options),
  })
end

return {
  s('ignore', t '--stylua: ignore'),

  s('lf', {
    t 'local ',
    i(1),
    t ' = function(',
    i(2),
    t ')',
    t { '', '  ' },
    i(0),
    t { '', 'end' },
  }),

  -- TODO: I don't know how I would like to set this one up.
  s('f', fmt('function({})\n  {}\nend', { i(1), i(0) })),

  s(
    'req',
    fmt([[local {} = require("{}")]], {
      d(2, require_var, { 1 }),
      i(1),
    })
  ),
}
