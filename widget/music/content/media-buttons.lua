local beautiful = require('beautiful')
local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')

local naughty = require('naughty')
local dpi = require('beautiful').xresources.apply_dpi

local clickable_container = require('widget.material.clickable-container')
local HOME = os.getenv('HOME')
local PATH_TO_ICONS = HOME .. '/.config/awesome/widget/music/icons/'

local mat_list_item = require('widget.material.list-item')
local mat_list_sep = require('widget.material.list-item-separator')
local musicSlider = require('widget.music.mpd-volume-updater')
local mpd_updater = require('widget.music.mpd-music-updater')


local media_buttons = {}

play_button_image = wibox.widget {
  {
    id = 'play',
    image = PATH_TO_ICONS .. 'play' .. '.svg',
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}


local next_button_image = wibox.widget {
  {
    id = 'next',
    image = PATH_TO_ICONS .. 'next' .. '.svg',
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}

music_slider = wibox.widget {
  layout = wibox.layout.fixed.vertical,
  {
    layout = wibox.layout.fixed.vertical,
    {
      {
        musicSlider,
        widget = wibox.container.background
      },
      widget = mat_list_item
    }
  }
}


local prev_button_image = wibox.widget {
  {
    id = 'prev',
    image = PATH_TO_ICONS .. 'prev' .. '.svg',
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}

repeat_button_image = wibox.widget {
  {
    id = 'rep',
    image = PATH_TO_ICONS .. 'repeat-on' .. '.svg',
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}

random_button_image = wibox.widget {
  {
    id = 'rand',
    image = PATH_TO_ICONS .. 'random-on' .. '.svg',
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}



local play_button = clickable_container(wibox.container.margin(play_button_image, dpi(10), dpi(10), dpi(10), dpi(10)))
play_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        mpd_updater.music_play_pause()
      end
    )
  )
)


local next_button = clickable_container(wibox.container.margin(next_button_image, dpi(10), dpi(10), dpi(10), dpi(10)))
next_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        mpd_updater.music_next()
        mpd_updater.update_all_content()
      end
    )
  )
)


local prev_button = clickable_container(wibox.container.margin(prev_button_image, dpi(10), dpi(10), dpi(10), dpi(10)))
prev_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        mpd_updater.music_prev()
        mpd_updater.update_all_content()
      end
    )
  )
)

local repeat_button = clickable_container(wibox.container.margin(repeat_button_image, dpi(10), dpi(10), dpi(10), dpi(10)))
repeat_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        mpd_updater.music_rep()
      end
    )
  )
)

local random_button = clickable_container(wibox.container.margin(random_button_image, dpi(10), dpi(10), dpi(10), dpi(10)))
random_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        mpd_updater.music_rand()
      end
    )
  )
)

local play_button_wrapped = wibox.widget {
  {
    play_button,
    shape = gears.shape.circle,
    widget = wibox.container.background
  },
  layout = wibox.layout.fixed.horizontal
}
 
local next_button_wrapped = wibox.widget {
  {
    next_button,
    shape = gears.shape.circle,
    widget = wibox.container.background
  },
  layout = wibox.layout.fixed.horizontal
}
 
local prev_button_wrapped = wibox.widget {
  {
    prev_button,
    shape = gears.shape.circle,
    widget = wibox.container.background
  },
  layout = wibox.layout.fixed.horizontal
}
 
local repeat_button_wrapped = wibox.widget {
  {
    repeat_button,
    shape = gears.shape.circle,
    widget = wibox.container.background
  },
  layout = wibox.layout.fixed.horizontal
}
 
local random_button_wrapped = wibox.widget {
  {
    random_button,
    shape = gears.shape.circle,
    widget = wibox.container.background
  },
  layout = wibox.layout.fixed.horizontal
}
 


navigate_buttons = wibox.widget {
	expand = 'none',
	layout = wibox.layout.align.horizontal,
	{
	   layout = wibox.layout.align.horizontal,
	   repeat_button_wrapped,
	},

	{
  	  layout = wibox.layout.fixed.horizontal,
  	  prev_button_wrapped,
  	  play_button_wrapped,
  	  next_button_wrapped,
  	  forced_height = dpi(35),
	},

	{
	  layout = wibox.layout.align.horizontal,
	  random_button_wrapped,
	},
  forced_height = dpi(35),
}

media_buttons.navigate_buttons = navigate_buttons
media_buttons.play_button_image = play_button_image
media_buttons.repeat_button_image = repeat_button_image
media_buttons.random_button_image = random_button_image
media_buttons.slider = music_slider

return media_buttons
