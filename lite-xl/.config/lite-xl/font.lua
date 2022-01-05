local subprocess = require "process"

local config = require "core.config"

local M = {}

function M.resolve_font(spec)
  local scan_rate = 1 / config.fps
  local proc = subprocess.start({ "fc-match", "-s", "-f", "%{file}\n", spec }, {
    stdin = subprocess.REDIRECT_DISCARD,
    stdout = subprocess.REDIRECT_PIPE,
    stderr = subprocess.REDIRECT_STDOUT
  })
  local prev
  local lines = {}
  while proc:running() do
    coroutine.yield(scan_rate)
    local buf = proc:read_stdout()
    if type(buf) == "string" then
      local last_line_start = 1
      for line, ln in string.gmatch(buf, "([^\n]-)\n()") do
        last_line_start = ln
        if prev then line = prev .. line end
        table.insert(lines, line)
      end
      prev = last_line_start < #buf and string.sub(buf, last_line_start)
    end
  end
  if prev then table.insert(lines, prev) end

  if proc:returncode() ~= 0 or #lines < 1 then
    error(string.format("Cannot find a font matching the given specs: %q", spec), 0)
  end
  return lines[1]
end

return M

