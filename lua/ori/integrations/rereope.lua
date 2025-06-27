return function(opts, colors, p)
  p['RereopeHintBg'] = { fg = colors.match, bg = colors.shade_gray }
  p['RereopeHintBorder'] = { fg = colors.match, bg = colors.shade_gray }
  p['RereopeVisualFlash'] = { bg = colors.match }

  return p
end
