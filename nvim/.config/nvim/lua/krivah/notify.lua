require('notify').setup {
  -- Animation style (see below for details)
  stages = 'fade_in_slide_out',

  -- Function called when a new window is opened, use for changing win settings/config
  on_open = nil,

  -- Function called when a window is closed
  on_close = nil,

  -- Max width
  max_width = 80,

  -- Render function for notifications. See notify-render()
  render = 'default',

  -- Default timeout for notifications
  timeout = 5000,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
  background_colour = 'Normal',

  -- Minimum width for notification windows
  minimum_width = 50,

  -- Icons for the different levels
  icons = {
    ERROR = '',
    WARN = '',
    INFO = '',
    DEBUG = '',
    TRACE = '✎',
  },
}

require('telescope').load_extension 'notify'

-- vim.notify = require 'notify'
vim.notify = vim.schedule_wrap(require("notify"))
