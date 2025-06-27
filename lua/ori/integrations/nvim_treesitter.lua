return function(opts, colors, p)
  p['TSModuleInfoGood'] = { fg = colors.high_green }
  p['TSModuleInfoBad'] = { fg = colors.high_red }

  return p
end
