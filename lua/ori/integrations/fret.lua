return function(opts, colors, p)
  p['FretIgnore'] = { fg = colors.gray }
  p['FretCandidateFirst'] = { fg = colors.match, sp = colors.match, style = 'bold,underline' }
  p['FretCandidateSecond'] = { fg = colors.match, sp = colors.match, style = 'bold,underline' }
  p['FretCandidateSub'] = { fg = colors.matchsub, sp = colors.matchsub, style = 'underdotted' }
  p['FretAlternative'] = { fg = colors.match, bg = colors.bg, style = 'bold,reverse' }

  return p
end
