local beautiful = require('beautiful')
local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')

local naughty = require('naughty')
local dpi = require('beautiful').xresources.apply_dpi

local clickable_container = require('widget.material.clickable-container')
local HOME = os.getenv('HOME')
local PATH_TO_ICONS = HOME .. '/.config/awesome/widget/notif-center/icons/'

local mat_list_item = require('widget.material.list-item')
local mat_list_sep = require('widget.material.list-item-separator')

toggle_mbox = require('widget.menu.exit_menu').toggle
local media_buttons = {}

local exit_image = wibox.widget {
  {
    id = 'exit',
    image = PATH_TO_ICONS .. 'logout' .. '.svg',
    forced_height = dpi(50),
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}

local exit_button = clickable_container(wibox.container.margin(exit_image, dpi(10), dpi(10), dpi(10), dpi(10)))
exit_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
	toggle_mbox()
      end
    )
  )
)

local exit_button_wrapped = wibox.widget {
  {
    exit_button,
    shape = gears.shape.circle,
    widget = wibox.container.background
  },
  layout = wibox.layout.fixed.horizontal
}

navigate_buttons = wibox.widget {
	expand = 'none',
	layout = wibox.layout.align.horizontal,
	nil,
	nil,
	{
		layout = wibox.layout.fixed.vertical,
		{
		  layout = wibox.layout.fixed.vertical,
	          wibox.container.margin(exit_button_wrapped, dpi(5)),
	          forced_height = dpi(50),
	          layout = wibox.layout.fixed.vertical,
		},
	},
  forced_height = dpi(50),
}


return navigate_buttons
