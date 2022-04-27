local function isempty(s)
  return s == nil or s == ''
end

function on_title_change(name, value)
  if isempty(value) then
    return
  end
  lgi = require 'lgi'
  Notify = lgi.require('Notify')
  Notify.init("mpv")
  Hello = Notify.Notification.new("Now Playing",value,"mpv")
  Hello:show()
end
mp.observe_property("media-title", "string", on_title_change)

