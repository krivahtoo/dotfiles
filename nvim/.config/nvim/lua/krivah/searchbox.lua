require('searchbox').setup {
  popup = {
    relative = 'win',
    position = {
      row = '5%',
      col = '95%',
    },
    size = 30,
    border = {
      style = 'rounded',
      highlight = 'FloatBorder',
      text = {
        top = ' Search ',
        top_align = 'left',
      },
    },
    win_options = {
      winhighlight = 'Normal:Normal',
    },
  },
  hooks = {
    before_mount = function(input)
      -- code
    end,
    after_mount = function(input)
      -- code
    end,
    on_done = function(value, search_type)
      -- code
    end,
  },
}

vim.keymap.set('n', '<leader>ss', function()
  require('searchbox').incsearch()
end, { desc = 'Incremental search' })

vim.keymap.set('n', '<leader>sS', function()
  require('searchbox').incsearch { reverse = true }
end, { desc = 'Reverse incremental search' })

vim.keymap.set('n', '<leader>sr', function()
  require('searchbox').replace { confirm = 'menu' }
end, { desc = 'Search and replace' })
