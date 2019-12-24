local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local mat_list_item = require('widget.material.list-item')
local mat_list_sep = require('widget.material.list-item-separator')
local dpi = require('beautiful').xresources.apply_dpi
local musicSlider = require('widget.music.mpd-volume-updater')

return wibox.widget {
  layout = wibox.layout.fixed.vertical,
  {
    layout = wibox.layout.fixed.vertical,
    {
      {
        musicSlider,
        bg = beautiful.modal_bg,
        widget = wibox.container.background
      },
      widget = mat_list_item
    }
  }
}
