local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local mat_list_item = require('widget.material.list-item')
local mat_list_sep = require('widget.material.list-item-separator')
local dpi = require('beautiful').xresources.apply_dpi

local volSlider = require('widget.volume.volume-slider')
local brightnessSlider = require('widget.brightness.brightness-slider')


return wibox.widget {
  layout = wibox.layout.fixed.vertical,
  {
    layout = wibox.layout.fixed.vertical,
    {
      {
      volSlider,
      bg = beautiful.bg_modal,
      shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height, true, true, false, false, beautiful.modal_radius) end,
      widget = wibox.container.background
      },
      widget = mat_list_item
    }
  },

  layout = wibox.layout.fixed.vertical,
  {
    {
      brightnessSlider,
      bg = beautiful.bg_modal,
      shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height, false, false, true, true, beautiful.modal_radius) end,
      widget = wibox.container.background
    },
    widget = mat_list_item,
  }
}
