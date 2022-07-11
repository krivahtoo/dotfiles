local status_ok, gps = pcall(require, 'nvim-gps')
if not status_ok then
  return
end

local icons = require 'krivah.icons'

local space = ''

local function get_icon(kind, icon)
  return '%#CmpItemKind' .. kind .. '#' .. icon .. '%*' .. space
end

-- Customized config
gps.setup {

  disable_icons = false, -- Setting it to true will disable all icons

  icons = {
    ['class-name'] = get_icon('Class', icons.kind.Class), -- Classes and class-like objects
    ['function-name'] = get_icon('Function', icons.kind.Function), -- Functions
    ['method-name'] = get_icon('Method', icons.kind.Method), -- Methods (functions inside class-like objects)
    ['container-name'] = get_icon('Property', icons.type.Object), -- Containers (example: lua tables)
    ['tag-name'] = get_icon('Keyword', icons.misc.Tag), -- Tags (example: html tags)
    ['mapping-name'] = get_icon('Property', icons.type.Object),
    ['sequence-name'] = get_icon('Property', icons.type.Array),
    ['null-name'] = get_icon('Field', icons.kind.Field),
    ['boolean-name'] = get_icon('Value', icons.type.Boolean),
    ['integer-name'] = get_icon('Value', icons.type.Number),
    ['float-name'] = get_icon('Value', icons.type.Number),
    ['string-name'] = get_icon('Value', icons.type.String),
    ['array-name'] = get_icon('Property', icons.type.Array),
    ['object-name'] = get_icon('Property', icons.type.Object),
    ['number-name'] = get_icon('Value', icons.type.Number),
    ['table-name'] = get_icon('Property', icons.ui.Table),
    ['date-name'] = get_icon('Value', icons.ui.Calendar),
    ['date-time-name'] = get_icon('Value', icons.ui.Table),
    ['inline-table-name'] = get_icon('Property', icons.ui.Calendar),
    ['time-name'] = get_icon('Value', icons.misc.Watch),
    ['module-name'] = get_icon('Module', icons.kind.Module),
  },

  separator = ' ' .. icons.ui.ChevronRight .. ' ',

  -- limit for amount of context shown
  -- 0 means no limit
  -- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
  -- in context names (eg: function names, class names, etc)
  depth = 0,

  -- indicator used when context is hits depth limit
  depth_limit_indicator = '..',
}
