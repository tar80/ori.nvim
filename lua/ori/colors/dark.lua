local colors = {
  fg = '#909090',
  bg = '#000000',

  high_gray = '#999999',
  high_blue = '#6A92BE',
  high_cyan = '#6CAEA0',
  high_green = '#71B189',
  high_olive = '#B5B784',
  high_orange = '#C4986C',
  high_red = '#E0829A',
  high_purple = '#B77ECA',

  gray = '#797979',
  blue = '#5979AD',
  cyan = '#51939F',
  green = '#618B61',
  olive = '#817E4E',
  orange = '#A77D6C',
  red = '#995870',
  purple = '#80659F',

  low_gray = '#686868',
  low_blue = '#526688',
  low_cyan = '#527471',
  low_green = '#467A5B',
  low_olive = '#767B5C',
  low_orange = '#806E58',
  low_red = '#805960',
  low_purple = '#6D5777',

  shade_gray = '#222222',
  shade_blue = '#1A222E',
  shade_cyan = '#172323',
  shade_green = '#192721',
  shade_olive = '#212217',
  shade_orange = '#292218',
  shade_red = '#2B1D22',
  shade_purple = '#241829',

  diff_add = '#122138',
  diff_change = '#0E1D0D',
  diff_remove = '#230C15',
  diff_text = '#70A170',
  diff_text_bg = '#1A3519',

  nc = '#161616',
  float = '#0F0F0F',
  border = '#373737',
  selection = '#2D2D2D',
  highlight = '#403020',
}

colors.error = colors.high_red
colors.warn = colors.high_orange
colors.info = colors.high_blue
colors.hint = colors.high_purple
colors.ok = colors.high_green

colors.match = colors.high_blue
colors.matchsub = colors.low_blue

return colors
