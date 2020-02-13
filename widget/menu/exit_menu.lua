local beautiful = require('beautiful')
local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')

local dpi = require('beautiful').xresources.apply_dpi

local clickable_container = require('widget.material.clickable-container')
local HOME = os.getenv('HOME')
local PATH_TO_ICONS = HOME .. '/.config/awesome/theme/icons/'
local mat_list_item = require('widget.material.list-item')
local apps = require('configuration.apps')

-- A table that will contain some functions
local exit_func = {}


screen.connect_signal("request::desktop_decoration", function(s)

local lock_image = wibox.widget {
  {
    id = 'lock',
    image = PATH_TO_ICONS .. 'lock' .. '.svg',
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}

local restart_image = wibox.widget {
  {
    id = 'restart',
    image = PATH_TO_ICONS .. 'restart' .. '.svg',
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}

local sleep_image = wibox.widget {
  {
    id = 'sleep',
    image = PATH_TO_ICONS .. 'power-sleep' .. '.svg',
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}

local logout_image = wibox.widget {
  {
    id = 'logout',
    image = PATH_TO_ICONS .. 'logout' .. '.svg',
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}

local shutdown_image = wibox.widget {
  {
    id = 'exit',
    image = PATH_TO_ICONS .. 'power' .. '.svg',
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}
 
local lock_button = clickable_container(wibox.container.margin(lock_image, dpi(10), dpi(10), dpi(10), dpi(10)))
lock_button:buttons(
  gears.table.join( 
    awful.button(  
      {},
      1, 
      nil,
      function()
      toggle_menu()
      awful.spawn.with_shell(apps.default.lock)
      end
    )
  )  
)  

local restart_button = clickable_container(wibox.container.margin(restart_image, dpi(10), dpi(10), dpi(10), dpi(10)))
restart_button:buttons(
  gears.table.join( 
    awful.button(  
      {},
      1, 
      nil,
      function()
      toggle_menu()
      awful.spawn.with_shell(apps.default.restart)
      end
    )
  )  
) 

local sleep_button = clickable_container(wibox.container.margin(sleep_image, dpi(10), dpi(10), dpi(10), dpi(10)))
sleep_button:buttons(
  gears.table.join( 
    awful.button(  
      {},
      1, 
      nil,
      function()
      toggle_menu()
      awful.spawn.with_shell(apps.default.sleep)
      end
    )
  )  
) 

local logout_button = clickable_container(wibox.container.margin(logout_image, dpi(10), dpi(10), dpi(10), dpi(10)))
logout_button:buttons(
  gears.table.join( 
    awful.button(  
      {},
      1, 
      nil,
      function()
      _G.awesome.quit()
      end
    )
  )  
)  

local shutdown_button = clickable_container(wibox.container.margin(shutdown_image, dpi(10), dpi(10), dpi(10), dpi(10)))
shutdown_button:buttons(
  gears.table.join( 
    awful.button(  
      {},
      1, 
      nil,
      function()
        awful.spawn.with_shell(apps.default.shutdown)
		awful.keygrabber.stop(_G.exit_screen_grabber)
      end
    )
  )  
) 

local lock_button_wrapped = wibox.widget {
  {
    lock_button,
    shape = gears.shape.circle,
    widget = wibox.container.background
  },
  layout = wibox.layout.fixed.horizontal
}

local logout_button_wrapped = wibox.widget {
  {
    logout_button,
    shape = gears.shape.circle,
    widget = wibox.container.background
  },
  layout = wibox.layout.fixed.horizontal
}

local sleep_button_wrapped = wibox.widget {
  {
    sleep_button,
    shape = gears.shape.circle,
    widget = wibox.container.background
  },
  layout = wibox.layout.fixed.horizontal
}

local shutdown_button_wrapped = wibox.widget {
  {
    shutdown_button,
    shape = gears.shape.circle,
    widget = wibox.container.background
  },
  layout = wibox.layout.fixed.horizontal
}

local restart_button_wrapped = wibox.widget {
  {
    restart_button,
    shape = gears.shape.circle,
    widget = wibox.container.background
  },
  layout = wibox.layout.fixed.horizontal
}


  -- Create the box
  local width = dpi(350)
  exit_menu = wibox
  {
    bg = '#00000000',
    visible = false,
    ontop = true,
    type = "dock",
    height = dpi(50),
    width = width,
    x = s.geometry.width - width,
    y = dpi(48),
  }

  menu_backdrop = wibox {
    ontop = true,
    visible = false,
    screen = s,
    bg = '#00000000',
    type = 'utility',
    x = s.geometry.x,
    y = s.geometry.x - dpi(36),
    width = s.geometry.width,
    height = s.geometry.height - dpi(26)
  }

  -- Make this non private
  toggle_menu = function()
    menu_backdrop.visible = not menu_backdrop.visible
    exit_menu.visible = not exit_menu.visible
  end

  menu_backdrop:buttons(
    awful.util.table.join(
      awful.button(
        {},
        1,
        function()
          toggle_menu()
        end
      )
    )
  )


  exit_menu:setup {
    expand = "none",
    {
      layout = wibox.layout.fixed.vertical,
      spacing = dpi(8),
      {
        spacing = dpi(0),
        layout = wibox.layout.fixed.vertical,
        {
        spacing = dpi(4),
        expand = 'none',
        layout = wibox.layout.align.horizontal,
        nil,
        {
                layout = wibox.layout.fixed.horizontal,
                {
                  layout = wibox.layout.fixed.horizontal,
                  shutdown_button_wrapped,
                  forced_height = dpi(50),
                },
                layout = wibox.layout.fixed.horizontal,
                {
                  layout = wibox.layout.fixed.horizontal,
                  restart_button_wrapped,
                  forced_height = dpi(50),
                },
                {
                  layout = wibox.layout.fixed.horizontal,
                  sleep_button_wrapped,
                  forced_height = dpi(50),
                },
                {
                  layout = wibox.layout.fixed.horizontal,
                  logout_button_wrapped,
                  forced_height = dpi(50),
                },
                {
                  layout = wibox.layout.fixed.horizontal,
                  lock_button_wrapped,
                  forced_height = dpi(50),
                },
        forced_height = dpi(50),        
        },
        nil,
        },
      },
    },
    -- The real background color
    bg = beautiful.bg_modal_title,
    -- The real, anti-aliased shape
    shape = function(cr, width, height)
    gears.shape.rounded_rect (cr, width, height, 12) 
    end,
    widget = wibox.container.background()
  }

end)

-- Add toggle_player() function in table
exit_func.toggle = toggle_menu



-- Return the table to make it usable/accessible to another part of the setup
return exit_func
