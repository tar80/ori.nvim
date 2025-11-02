return function(opts, colors, p)
  p['Matchwith'] = { sp = colors.high_cyan, style = 'underline' }
  p['MatchwithOut'] = { sp = colors.high_purple, style = 'underdouble' }
  p['MatchwithNext'] = { sp = colors.low_gray, style = 'underline' }
  p['MatchwithNextOut'] = { sp = colors.low_gray, style = 'underdouble' }
  p['MatchwithParent'] = { bg = colors.shade_cyan, style = 'bold' }
  p['MatchwithParentOut'] = { bg = colors.shade_purple, style = 'bold' }
  p['MatchwithSign'] = { fg = colors.hint, style = 'bold' }
  p['MatchwithWord'] = { bg = colors.shade_cyan }

  return p
end
