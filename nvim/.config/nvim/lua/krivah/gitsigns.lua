local gs = require 'gitsigns'

gs.setup {
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = '+',
      numhl = 'GitSignsAddNr',
      linehl = 'GitSignsAddLn',
    },
    change = {
      hl = 'GitSignsChange',
      text = '│',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
    delete = {
      hl = 'GitSignsDelete',
      text = '_',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    topdelete = {
      hl = 'GitSignsDelete',
      text = '‾',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = '~',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  on_attach = function(bufnr)
    local map = vim.keymap.set

    map('n', '[c', function()
      return vim.wo.diff and '[c' or '<cmd>Gitsigns prev_hunk<CR>'
    end, { expr = true, buffer = bufnr, desc = 'Previous Git hunk' })
    map('n', ']c', function()
      return vim.wo.diff and ']c' or '<cmd>Gitsigns next_hunk<CR>'
    end, { expr = true, buffer = bufnr, desc = 'Next Git hunk' })

    map('n', '<leader>hs', function()
      gs.stage_hunk()
    end, { buffer = bufnr, desc = 'Stage git hunk' })
    map('v', '<leader>hs', function()
      gs.stage_hunk()
    end, { buffer = bufnr, desc = 'Stage git hunk' })
    map('n', '<leader>hu', function()
      gs.undo_stage_hunk()
    end, { buffer = bufnr, desc = 'Undo stage git hunk' })
    map('n', '<leader>hr', function()
      gs.reset_hunk()
    end, { buffer = bufnr, desc = 'Reset git hunk' })
    map('v', '<leader>hr', function()
      gs.reset_hunk()
    end, { buffer = bufnr, desc = 'Reset git hunk' })
    map('n', '<leader>hR', function()
      gs.reset_buffer()
    end, { buffer = bufnr, desc = 'Reset buffer' })
    map('n', '<leader>hp', function()
      gs.preview_hunk()
    end, { buffer = bufnr, desc = 'Preview git hunk' })
    map('n', '<leader>hb', function()
      gs.blame_line { full = true }
    end, { buffer = bufnr, desc = 'Show git blame' })
    map('n', '<leader>hS', function()
      gs.stage_buffer()
    end, { buffer = bufnr, desc = 'Stage buffer' })
    map('n', '<leader>hU', function()
      gs.reset_buffer_index()
    end, { buffer = bufnr, desc = 'Reset buffer index' })

    map('o', 'ih', function()
      gs.select_hunk()
    end, { buffer = bufnr, desc = 'Select hunk' })
    map('x', 'ih', function()
      gs.select_hunk()
    end, { buffer = bufnr, desc = 'Select hunk' })
  end,
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
  current_line_blame_formatter = function(name, blame_info, opts)
    if blame_info.author == name then
      blame_info.author = 'You'
    end
    local text
    if blame_info.author == 'Not Committed Yet' then
      text = blame_info.author
    else
      local date_time
      if opts.relative_time then
        date_time = require('gitsigns.util').get_relative_time(
          tonumber(blame_info['author_time'])
        )
      else
        date_time = os.date(
          '%Y-%m-%d',
          tonumber(blame_info['author_time'])
        )
      end
      text = string.format(
        '%s, %s - %s',
        blame_info.author,
        date_time,
        blame_info.summary
      )
    end
    return { { ' ' .. text, 'GitSignsCurrentLineBlame' } }
  end,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
}

vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
  pattern = '*',
  callback = function(opts)
    require('gitsigns').toggle_current_line_blame(
      opts.event ~= 'InsertEnter'
    )
  end,
})
