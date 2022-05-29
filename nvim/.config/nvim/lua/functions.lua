function _G.put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

_G.P = _G.put

_G.gps_location = function()
  local gps = require "nvim-gps"
  return gps.is_available() and gps.get_location() or ""
end

