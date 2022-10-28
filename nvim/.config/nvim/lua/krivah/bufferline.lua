local bl = require 'bufferline'

bl.setup {
  options = {
    -- numbers = "ordinal" ,
    numbers = function(opts)
      -- return string.format('%s', opts.id)
      return ''
    end,
    -- number_style = "", -- buffer_id at index 1, ordinal at index 2
    close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
    right_mouse_command = 'vertical sbuffer %d', -- can be a string | function, see "Mouse actions"
    left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match '%.md' then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return '(' .. count .. ')'
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= '<i-dont-want-to-see-this>' then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= '<buffer-name-I-dont-want>' then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if
        vim.fn.getcwd() == '<work-repo>'
        and vim.bo[buf_number].filetype ~= 'wiki'
      then
        return true
      end
    end,
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        text_align = 'center',
      },
    },
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = { '|', '' }, -- "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    sort_by = 'id', -- "relative_directory"
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    }
  },
}

for i = 1, 9, 1 do
  vim.keymap.set('n', '<leader>' .. i, function()
    bl.go_to_buffer(i)
  end, { desc = 'Switch to buffer ' .. i })
end

vim.keymap.set('n', '<leader>bb', function()
  bl.pick_buffer()
end, { desc = 'Pick a buffer' })
vim.keymap.set('n', '<leader>br', function()
  bl.close_with_pick()
end, { desc = 'Pick a buffer to delete' })

vim.keymap.set('n', '[b', function()
  bl.cycle(1)
end, { desc = 'Cycle next buffer' })

vim.keymap.set('n', ']b', function()
  bl.cycle(-1)
end, { desc = 'Cycle previous buffer' })

vim.keymap.set('n', '<leader>b<Right>', function()
  bl.move(1)
end, { desc = 'Move buffer right' })

vim.keymap.set('n', '<leader>b<Left>', function()
  bl.move(-1)
end, { desc = 'Move buffer left' })

vim.keymap.set('n', '<leader>be', function()
  bl.sort_buffers_by 'extension'
end, { desc = 'Sort buffers by extention' })

vim.keymap.set('n', '<leader>bf', function()
  bl.sort_buffers_by 'directory'
end, { desc = 'Sort buffers by extention' })

vim.keymap.set('n', '<leader>bp', function()
  bl.toggle_pin()
end, { desc = 'Sort buffers by extention' })
