require('dressing').setup {
  input = {
    -- Default prompt string
    default_prompt = '➤ ',

    -- When true, <Esc> will close the modal
    insert_only = true,

    -- These are passed to nvim_open_win
    anchor = 'SW',
    relative = 'cursor',
    border = 'rounded',

    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    prefer_width = 40,
    max_width = nil,
    min_width = 20,

    -- Window transparency (0-100)
    winblend = 10,
    -- Change default highlight groups (see :help winhl)
    winhighlight = '',

    -- see :help dressing_get_config
    get_config = nil,
  },
  select = {
    -- Priority list of preferred vim.select implementations
    backend = { 'telescope', 'fzf', 'builtin', 'nui' },

    -- Options for telescope selector
    -- These are passed into the telescope picker directly. Can be used like:
    -- telescope = require('telescope.themes').get_cursor({...})
    -- extacted from telescope.themes to enable lazy-loading telescope
    telescope = {
      theme = 'cursor',

      sorting_strategy = 'ascending',
      results_title = false,
      layout_strategy = 'cursor',
      layout_config = {
        width = 80,
        height = 9,
      },
      borderchars = {
        prompt = { '─', '│', ' ', '│', '╭', '╮', '│', '│' },
        results = {
          '─',
          '│',
          '─',
          '│',
          '├',
          '┤',
          '╯',
          '╰',
        },
        preview = {
          '─',
          '│',
          '─',
          '│',
          '╭',
          '╮',
          '╯',
          '╰',
        },
      },
    },

    -- Options for fzf selector
    fzf = {
      window = {
        width = 0.5,
        height = 0.4,
      },
    },

    -- Options for nui Menu
    nui = {
      position = '50%',
      size = nil,
      relative = 'editor',
      border = {
        style = 'rounded',
      },
      max_width = 80,
      max_height = 40,
    },

    -- Options for built-in selector
    builtin = {
      -- These are passed to nvim_open_win
      anchor = 'NW',
      relative = 'cursor',
      border = 'rounded',

      -- Window transparency (0-100)
      winblend = 10,
      -- Change default highlight groups (see :help winhl)
      winhighlight = '',

      -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      width = nil,
      max_width = 0.8,
      min_width = 40,
      height = nil,
      max_height = 0.9,
      min_height = 10,
    },

    -- Used to override format_item. See :help dressing-format
    format_item_override = {},

    -- see :help dressing_get_config
    get_config = nil,
  },
}
