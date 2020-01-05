local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local mat_slider = require('widget.material.slider')
local mat_icon_button = require('widget.material.icon-button')
local watch = require('awful.widget.watch')
local spawn = require('awful.spawn')
local awful = require('awful')

local stringMatch = string.match

local musicSlider =
  wibox.widget {
  read_only = false,
  widget = mat_slider
}

musicSlider:connect_signal(
  'property::value',
  function()
    spawn('mpc volume ' .. musicSlider.value, false)
  end
)

watch(
  [[bash -c "mpc volume"]],
  2,
  function(_, stdout)
    local volume = stringMatch(stdout, 'volume: (%d+)')
    musicSlider:set_value(tonumber(volume))
    --collectgarbage('collect')
  end
)

local volume_setting =
  wibox.widget {
  musicSlider,
  widget = mat_list_item
}

return volume_setting
