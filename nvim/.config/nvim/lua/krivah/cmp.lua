-- Setup nvim-cmp.
local cmp = require 'cmp'
local ls = require("luasnip")
require 'cmp_gh_source'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local icons = require 'krivah.icons'

local sources = {
  nvim_lua = " LUA",
  nvim_lsp = " LSP",
  tags = " TAG",
  zsh = " ZSH",
  fish = " FIS",
  path = " PTH",
  spell = " SPL",
  dictionary = " DIC",
  luasnip = " LSN",
  nvim_lsp_signature_help = " SGH",
  orgmode = " ORG",
  treesitter = " TSR",
  rg = " RIP",
  omni = " OMN",
  look = " LOK",
  calc = " CAL",
  emoji = " EMJ",
  tmux = " TMX",
  npm = " NPM",
  cmp_git = " GIT",
  latex_symbols = " TEX",
  nvim_lsp_document_symbol = " DSM",
  buffer = " BUF",
  cmdline = " CMD",
  gh_issues = " GHI",
  cmdline_history = " CMH",
  conventionalcommits = " CVC",
  pandoc_references = " PAN",
  digraphs = " DIG",
  greek = "GRK",
}

cmp.setup({
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = icons.kind[vim_item.kind]
      -- vim_item.kind = string.format('%s %s', icons.kind[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = sources[entry.source.name]
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif ls.expand_or_locally_jumpable() then
        ls.expand_or_jump()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end,

    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end,
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'crates' },
    { name = 'buffer', keyword_length = 2, max_item_count = 10 },
    { name = 'path' },
  }, {
    { name = 'calc' },
    { name = 'digraphs' },
    { name = 'npm', keyword_length = 4 },
    { name = 'spell', keyword_length = 2, max_item_count = 5 },
  }),
  experimental = {
    ghost_text = true
  },
  completion = {
    autocomplete = false, -- disable auto-completion.
  },
  enabled = function()
    -- disable completion in comments
    local context = require 'cmp.config.context'
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture("comment")
      -- and not context.in_syntax_group("Comment")
    end
  end,
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      require "cmp-under-comparator".under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    { name = 'gh_issues' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer', keyword_length = 3 }
--   }
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   sources = cmp.config.sources({
--     { name = 'path', keyword_length = 3 }
--   }, {
--     { name = 'cmdline', keyword_length = 3 }
--   })
-- })


local id = vim.api.nvim_create_augroup("vimrc", {
  clear = false
})
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "TextChangedP" }, {
  pattern = "*",
  group = id,
  callback = function()
    local context = require 'cmp.config.context'
    local line = vim.api.nvim_get_current_line()
    local cursor = vim.api.nvim_win_get_cursor(0)[2]
    if not context.in_treesitter_capture("comment")
        and not context.in_syntax_group("Comment") then
      return
    end
    local current = string.sub(line, cursor, cursor + 1)
    if current == "." or current == "," or current == " " then
      cmp.close()
    end

    local before_line = string.sub(line, 1, cursor + 1)
    local after_line = string.sub(line, cursor + 1, -1)
    if not string.match(before_line, '^%s+$') then
      if after_line == "" or string.match(before_line, " $")
          or string.match(before_line, "%.$") then
        -- cmp.complete()
      end
    end
  end
})

vim.keymap.set('i', '<C-x><C-l>', function()
  cmp.complete({
    config = {
      sources = {
        { name = 'nvim_lsp' }
      }
    }
  })
end)
vim.keymap.set('i', '<C-x><C-s>', function()
  cmp.complete({
    config = {
      sources = {
        { name = 'luasnip', max_item_count = 15 }
      }
    }
  })
end)
vim.keymap.set('i', '<C-x><C-d>', function()
  cmp.complete({
    config = {
      sources = { {
        name = 'dictionary',
        keyword_length = 3,
        max_item_count = 10
      } }
    }
  })
end)
