local filesystem = require('gears.filesystem')

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'konsole',
    editor = 'geany',
    rofiappmenu = 'rofi -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi/appmenu/drun.rasi',
    lock = 'dm-tool lock',
    quake = 'kitty --title QuakeTerminal'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton --dbus --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf', -- Compositor
    'blueman-applet', -- Bluetooth tray icon
    'xfce4-power-manager --no-daemon --debug', -- Power manager
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'xrdb $HOME/.Xresources', -- X Colors
    'nm-applet', -- NetworkManager Applet
    'mpd' -- Music Server
  }
}
