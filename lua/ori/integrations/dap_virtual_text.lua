return function(opts, colors, p)
  p['NvimDapVirtualText'] = { fg = colors.high_purple, bg = colors.shade_red, style = opts.styles.virtualtext }
  p['NvimDapVirtualTextInfo'] = { fg = colors.bg, bg = colors.red }
  p['NvimDapVirtualTextChanged'] = { fg = colors.blue, bg = colors.shade_red, style = opts.styles.virtualtext }
  p['NvimDapVirtualTextError'] = { fg = colors.low_red, bg = colors.shade_red, style = opts.styles.virtualtext }

  return p
end
