local ls = require 'luasnip'
local types = require 'luasnip.util.types'

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = 'TextChanged,TextChangedI',

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { ' <- Current Choice', 'NonText' } },
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = { { ' ●', 'NightflyBlue' } },
      },
    },
  },
}

require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_snipmate').lazy_load()
require('luasnip.loaders.from_lua').lazy_load()

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes
vim.keymap.set({ 'i', 's' }, '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set('i', '<c-u>', function()
  require 'luasnip.extras.select_choice'()
end)
