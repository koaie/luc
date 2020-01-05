-------------------------------------------------
-- Rofi widget for Awesome Window Manager
-- Shows the application list
-- Better with Compton tryone fork for blur fx
--------------

local awful = require('awful')
local naughty = require('naughty')
local watch = require('awful.widget.watch')
local wibox = require('wibox')
local clickable_container = require('widget.material.clickable-container')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
local apps = require('configuration.apps')


local HOME = os.getenv('HOME')
local PATH_TO_ICONS = HOME .. '/.config/awesome/widget/search/icons/'

local widget =
  wibox.widget {
  {
    id = 'icon',
    image = PATH_TO_ICONS .. 'search' .. '.svg',
    widget = wibox.widget.imagebox,
    resize = true
  },
  layout = wibox.layout.align.horizontal
}

local widget_button = clickable_container(wibox.container.margin(widget, dpi(11), dpi(11), dpi(11), dpi(11))) -- 4 is top and bottom margin
widget_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
      awful.spawn(apps.default.rofiappmenu)
      end
    )
  )
)


return widget_button
