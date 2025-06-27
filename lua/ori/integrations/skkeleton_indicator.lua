return function(opts, colors, p)
  p['SkkeletonIndicatorEiji'] = { fg = colors.bg, bg = colors.cyan }
  p['SkkeletonIndicatorHira'] = { fg = colors.bg, bg = colors.high_green }
  p['SkkeletonIndicatorKata'] = { fg = colors.bg, bg = colors.high_olive }
  p['SkkeletonIndicatorHankata'] = { fg = colors.bg, bg = colors.orange }
  p['SkkeletonIndicatorZenkaku'] = { fg = colors.bg, bg = colors.orange }
  p['SkkeletonIndicatorAbbrev'] = { fg = colors.bg, bg = colors.high_purple }

  return p
end
