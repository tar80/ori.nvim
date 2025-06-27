return function(opts, colors, p)
  p['FuzzyMotionShade'] = { fg = colors.low_gray }
  p['FuzzyMotionChar'] = { fg = colors.bg, bg = colors.match, style = 'bold' }
  p['FuzzyMotionSubChar'] = { fg = colors.match, sp = colors.match, style = 'bold,underline' }
  p['FuzzyMotionMatch'] = { fg = colors.matchsub, sp = colors.matchsub, style = 'underline' }

  return p
end
