local colors = {
  fg = '#525252',
  bg = '#FFFFFF',

  high_gray =    '#222222',
  high_blue =    '#3F83F5',
  high_cyan =    '#00BCD4',
  high_green =   '#4CAF50',
  high_olive =   '#D4C14F',
  high_orange =  '#FF9800',
  high_red =     '#FF77A1',
  high_purple =  '#B36FF6',

  gray =         '#757575',
  blue =         '#3A70B2',
  cyan =         '#258995',
  green =        '#547E2D',
  olive =        '#8A8253',
  orange =       '#D97A4F',
  red =          '#E0579F',
  purple =       '#8554CC',

  low_gray =     '#A0A0A0',
  low_blue =     '#94A6D3',
  low_cyan =     '#95CEDE',
  low_green =    '#90C080',
  low_olive =    '#C2BA85',
  low_orange =   '#E6AC8B',
  low_red =      '#E0A0B0',
  low_purple =   '#C197C9',

  shade_gray =   '#F5F5F5',
  shade_blue =   '#D6EAFB',
  shade_cyan =   '#D1F0F5',
  shade_green =  '#E2F0D9',
  shade_olive =  '#F7F1DA',
  shade_orange = '#FAE1D6',
  shade_red =    '#FBE3ED',
  shade_purple = '#EDE7F5',

  diff_add =     '#C3EBFF',
  diff_change =  '#D8F8C8',
  diff_remove =  '#FFD9EF',
  diff_text =    '#4A6A60',
  diff_text_bg = '#BBE2B4',

  nc = '#F3F3F5',
  float = '#F7F7FB',
  border = '#A0A0A0',
  selection = '#E5E7EB',
  highlight = '#FFE7C1',
}

colors.error = colors.high_red
colors.warn = colors.high_olive
colors.info = colors.high_blue
colors.hint = colors.high_purple
colors.ok = colors.high_green

colors.match = colors.high_blue
colors.matchsub = colors.low_blue

return colors
