return function(opts, colors, p)
  p['TelescopeNormal'] = { link = 'Normal' }
  p['TelescopeSelection'] = { fg = colors.fg, bg = colors.selection }
  p['TelescopeMultiIcon'] = { fg = colors.high_green }
  p['TelescopeMultiSelection'] = { bg = colors.shade_green }
  p['TelescopePromptPrefix'] = { fg = colors.cyan }
  p['TelescopePromptCounter'] = { fg = colors.gray }
  p['TelescopeMatching'] = { fg = colors.bg, bg = colors.match, style = 'bold' }

  return p
end
