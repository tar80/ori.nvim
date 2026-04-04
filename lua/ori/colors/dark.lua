local colors = {
  bg = '#000000',
  fg = '#888888',

  high_gray = '#89898B',
  high_blue = '#788BBC',
  high_cyan = '#62929B',
  high_green = '#7A987E',
  high_olive = '#988E6C',
  high_orange = '#A17B6F',
  high_red = '#9D646D',
  high_purple = '#8A7FA2',

  gray = '#6B6D6F',
  blue = '#6379A5',
  cyan = '#51838D',
  green = '#678267',
  olive = '#847C5D',
  orange = '#95695B',
  red = '#8B5C68',
  purple = '#796B8E',

  low_gray = '#575757',
  low_blue = '#526184',
  low_cyan = '#446770',
  low_green = '#546855',
  low_olive = '#6A614D',
  low_orange = '#78554D',
  low_red = '#6E4C54',
  low_purple = '#605971',

  shade_gray = '#1B1B1B',
  shade_blue = '#151B25',
  shade_cyan = '#141D1C',
  shade_green = '#161F19',
  shade_olive = '#1D1C16',
  shade_orange = '#201A16',
  shade_red = '#23181B',
  shade_purple = '#1B1621',

  diff_add = '#091726',
  diff_change = '#0C1911',
  diff_remove = '#200D1A',
  diff_text = '#98C998',
  diff_text_bg = '#1E3B1E',

  nc = '#101010',
  float = '#080808',
  border = '#373737',
  selection = '#1A1F28',
  highlight = '#322A25',
}

colors.error = colors.high_red
colors.warn = colors.high_olive
colors.info = colors.high_blue
colors.hint = colors.high_purple
colors.ok = colors.high_green

colors.match = colors.high_blue
colors.matchsub = colors.low_blue

return colors
