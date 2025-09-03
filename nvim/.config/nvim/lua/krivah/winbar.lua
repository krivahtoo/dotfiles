local M = {}

M.winbar_filetype_exclude = {
  'help',
  'packer',
  'NeogitStatus',
  'NeogitPopup',
  'NeogitLogView',
  'NvimTree',
  'Trouble',
  'toggleterm',
  'man',
  'gitcommit',
  'oil',
}

local isempty = function(s)
  return s == nil or s == ''
end

local get_buf_option = function(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_get_option_value, opt, {})
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

local get_filename = function()
  local filename = vim.fn.expand '%:t'
  local extension = vim.fn.expand '%:e'

  if not isempty(filename) then
    local file_icon, hl_group =
      require('nvim-web-devicons').get_icon(filename)

    if not isempty(file_icon) then
      return ' ' .. '%#' .. hl_group .. '#' .. file_icon .. ' %*' .. filename
    end
  end
end

local get_gps = function()
  local status_gps_ok, gps = pcall(require, 'nvim-gps')
  if not status_gps_ok then
    return ''
  end

  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return ''
  end

  if not gps.is_available() or gps_location == 'error' then
    return ''
  end

  if not isempty(gps_location) then
    return require('krivah.icons').ui.ChevronRight .. ' ' .. gps_location
  else
    return ''
  end
end

local excludes = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end
  return false
end

M.get_winbar = function()
  if excludes() then
    return
  end
  local value = get_filename()

  local gps_added = false
  if not isempty(value) then
    local gps_value = get_gps()
    value = value .. ' ' .. gps_value
    if not isempty(gps_value) then
      gps_added = true
    end
  end

  if not isempty(value) and get_buf_option 'mod' then
    local mod = require('krivah.icons').ui.BigCircle .. ''
    if gps_added then
      value = value .. ' ' .. mod
    else
      value = value .. mod
    end
  end

  local status_ok, _ = pcall(
    vim.api.nvim_set_option_value,
    'winbar',
    value,
    { scope = 'local' }
  )
  if not status_ok then
    return
  end
end

return M
