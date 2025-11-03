return function(opts, colors, p)
  p['SkkeletonHenkan'] = { style = 'underline' }
  p['SkkeletonHenkanSelect'] = { fg = colors.bg, bg = colors.high_blue }
  p['SkkeletonHenkanBorder'] = { fg = colors.float, bg = colors.blue }

  return p
end
