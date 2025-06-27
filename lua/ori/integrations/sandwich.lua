return function(opts, colors, p)
  p['OperatorSandwichAdd'] = { fg = colors.fg, bg = colors.shade_cyan, style = 'bold' }
  p['OperatorSandwichChange'] = { bg = colors.shade_green, style = 'bold' }
  p['OperatorSandwichDelete'] = { fg = colors.high_red, bg = colors.shade_red, style = 'bold' }

  return p
end
