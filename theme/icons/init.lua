local tit_dir = os.getenv('HOME') .. '/.config/awesome/theme/icons/tag-list/tag/'
local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons'


return {
  --tags
  chrome = tit_dir .. '/google-chrome.svg',
  code = tit_dir .. '/code-braces.svg',
  folder = tit_dir .. '/folder.svg',
  music = tit_dir .. '/music.svg',
  lab = tit_dir .. '/flask.svg',
  terminal = tit_dir .. '/terminal.svg',
  --others
  menu = tit_dir .. '/menu.svg',
  close = dir .. '/close.svg',
  logout = dir .. '/logout.svg',
  sleep = dir .. '/power-sleep.svg',
  power = dir .. '/power.svg',
  lock = dir .. '/lock.svg',
  restart = dir .. '/restart.svg',
  volume = dir .. '/volume-high.svg',
  brightness = dir .. '/brightness-7.svg',
  plus = dir .. '/plus.svg',
}
