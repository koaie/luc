<div align="center">
    <h1>Luc</h1>
    <p>Fork of  https://github.com/ilovecookieee/Glorious-Dotfiles/tree/master/config/awesome/lines</b></p>
    <p>Continuation of https://github.com/poiuedws/awesomedotfiles</p>
    <p>Aims to be pretty, functional, and light weight. </p>
</div>

## Details
+ **OS**: Debian
+ **WM**: AwesomeWM
+ **Terminal Emulators**: kitty, konsole, st
+ **Compositor**: picom-tryone
+ **File Manager**: nemo
+ **Launcher**: rofi
+ **Editor**: geany, nano
+ **Browser**: firefox
+ **Music Player**: ncmpcpp, mpd, mpc
+ **Setup font**: SFNS Display, Hack, Musica

## FEATURES!
+ **Notification Center**
+ **Brightness and Volume OSDs**
+ **Side panel music controller**
+ **Weather widget**
+ **Calculator**


### Desktop
![Screenshot](https://i.imgur.com/8qdGQyv.jpg) 
### Side panel
![Screenshot](https://i.imgur.com/2Z9zCxo.png) 
### Rofi
![Screenshot](https://i.imgur.com/KYn4pFM.png) 

## Dependencies
Here is a complete list of dependencies REQUIRED for making these AwesomeWM setup to work.
If you notice that something is missing, please open an issue so I can add the dependency to this table.

| Dependency | Description | Why/Where is it needed? | Version |
| --- | --- | --- | --- |
| `awesome` | Window manager | yeah awesome | master brunch |
| `rofi` | Window switcher, application launcher and dmenu replacement | Application launcher | master brunch |
| `picom-tryone` | A compositor for X11 | compositor with kawase-blur | master brunch |
| `blueman` | Manages bluetooth | For bluetooth widgets | any |
| `xfce4-power-manager` | Manages battery/power settings | Power Settings | any |
| `pulseaudio`, `libpulse` | Sound system | Volume widgets and keybinds | 13.0 and above |
| `mpd` | Server-side application for playing music | Music widgets | 0.21.16 and above |
| `mpc` | Minimalist command line interface to MPD | Music widgets | 0.33-1 and above |
| `feh` | Image viewer and wallpaper setter | Screenshot previews, wallpapers | 3.2.1-1 and above |
| `xorg-xwininfo` | Window information utility for X | it just works | any |
| `xdg_menu` | Generates a list of installed applications | Useful for generating app list | any |
| `jq` | Command-line JSON processor | Formatting | any |



#### Installation
+ My setup is using the dependencies below, you can change stuff as you wise, if you want more minimal setup you are welcome to use the dependencies.
  - awesome (window manager framework)
  - rofi (application launcher)
  - blueman (bluetooth widgets)
  - xfce4-power-manager (power widget)
  - xbacklight (adjust backlight brightness)
  - pulseaudio, alsa-utils (volume/audio keybinds)
  - mpd, mpc (music widget)
  - xdg-menu (generates app list)
  - flameshot (screenshots)
+ Copy the files to `$HOME/.config/awesome/`
+ Reload Awesome using `Super + shift + r`


# File Structure
This setup is split in multiple parts:
+ `rc.lua` the core of configuration. You can enable and disable the modules here and load all your configurations.
+ The `layout` directory contains the panel configurations. Change panel settings here or load/unload widgets.
+ In `configuration` directory you can find all the configs about the key bindings, client rules, tags, starting apps and etc.
+ The `module` consists of many files that are usually inside the `rc.lua` like notifications, app menus, etc. You can load them in the `rc.lua`.
+ The `themes` folder contains themes and colors of the setup.
+ The `widgets` contains all the widgets(of course). These are used in the panels and dashboard. It contains thenotification center, side panel(including music, calculator, weather, brightness, and volume widgets) widgets and many more.

# Where to edit this and that?
+ Colorschemes?
  - `awesome/theme`
  - Just play with `default-theme.lua` and `SETUPNAME-theme\init.lua`
+ Panels and bars?
  - `awesome/layout`
+ Client behaviour?
  - `awesome/module/decorate-client.lua`
+ Start-up Applications?
  - `awesome/configuration/apps.lua`
+ Keybindings?
  - `awesome/configuration/keys/`
+ Client rules?
  - `awesome/configuration/client/keys.lua`
+ Compositor?
  -  `awesome/configuration/picom.conf`
+ Rofi?
  - `awesome/configuration/rofi/`
+ Tags?
  - `awesome/configuration/tags/`
+ Icons?
  - `awesome/theme/icons/`
+ Wallpapers?
  - `awesome/theme/wallpapers/`
+ Modules?
  - `awesome/modules`


# NOTE
+ This setup will not mostly work out of the box because:
  - YOU'RE NOT USING AWESOME-GIT-MASTER version
  - Some dependencies are not currently installed
+ Check keybindings using `Super +  F1`

# ABOUT WIDGETS AND MODULES
+ You can disable the dialog backdrop effect in `awesome/configuration/client/rules.lua`. Just search for `dialog` and set `drawBackdrop` to false in the properties. You can also just unload the module in `rc.lua`.






**Special thanks**
+ [**ilovecookieeee**](https://github.com/ilovecookieee)

