local colors = {
  fg = '#484848',
  bg = '#FFFFFF',

  high_gray = '#2F2F2F',
  high_blue = '#4182C9',
  high_cyan = '#1196A3',
  high_green = '#569656',
  high_olive = '#9F8837',
  high_orange = '#D2691F',
  high_red = '#C95475',
  high_purple = '#8C5DC9',

  gray = '#626262',
  blue = '#4475A6',
  cyan = '#1E828A',
  green = '#4F804E',
  olive = '#88793D',
  orange = '#B15F21',
  red = '#AF536E',
  purple = '#7E5EA4',

  low_gray = '#878787',
  low_blue = '#89A7C9',
  low_cyan = '#67A9B7',
  low_green = '#89B289',
  low_olive = '#BAAA74',
  low_orange = '#D79671',
  low_red = '#CB96A6',
  low_purple = '#AF9CC5',

  shade_gray = '#ededed',
  shade_blue = '#dae7f5',
  shade_cyan = '#d5f0f2',
  shade_green = '#e2eedb',
  shade_olive = '#f2ecce',
  shade_orange = '#f5e4da',
  shade_red = '#f9dee7',
  shade_purple = '#ece5f5',

  diff_add = '#e8f5e8',
  diff_change = '#eef4ff',
  diff_remove = '#f9ebed',
  diff_text = '#3E5D54',
  diff_text_bg = '#D4EFD0',

  nc = '#F6F6F6',
  float = '#F7F7FB',
  border = '#BDBDBD',
  selection = '#EAF1FE',
  highlight = '#FFEFD9',
}

colors.error = colors.high_red
colors.warn = colors.high_olive
colors.info = colors.high_blue
colors.hint = colors.high_purple
colors.ok = colors.high_green

colors.match = colors.high_blue
colors.matchsub = colors.low_blue

return colors
