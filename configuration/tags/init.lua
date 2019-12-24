local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')
local apps = require('configuration.apps')

local tags = {
  {
    icon = icons.terminal,
    type = 'terminal',
    defaultApp = 'konsole',
    screen = 1
  },

  {
    icon = icons.chrome,
    type = 'chrome',
    defaultApp = 'firefox',
    screen = 1
  },
  {
    icon = icons.code,
    type = 'code',
    defaultApp = 'geany',
    screen = 1
  },
 --[[ {
    icon = icons.social,
    type = 'social',
    defaultApp = 'station',
    screen = 1
  },]]--
  {
    icon = icons.folder,
    type = 'files',
    defaultApp = 'nemo',
    screen = 1
  },
  {
    icon = icons.music,
    type = 'music',
    defaultApp = 'konsole --profile ncmpcpp -e ncmpcpp',
    screen = 1
  },
  {
    icon = icons.lab,
    type = 'any',
    defaultApp = apps.default.rofiappmenu,
    screen = 1
  }
}

awful.layout.layouts = {
  awful.layout.suit.spiral.dwindle,
  awful.layout.suit.tile,
  awful.layout.suit.max
}


screen.connect_signal("request::desktop_decoration", function(s)
  for i, tag in pairs(tags) do
    awful.tag.add(
      i,
      {
        icon = tag.icon,
        icon_only = true,
        layout = awful.layout.suit.spiral.dwindle,
        gap_single_client = false,
        gap = 4,
        screen = s,
        defaultApp = tag.defaultApp,
        selected = i == 1
      }
    )
  end
end)


_G.tag.connect_signal(
  'property::layout',
  function(t)
    local currentLayout = awful.tag.getproperty(t, 'layout')
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 0
    else
      t.gap = 4
    end
  end
)
