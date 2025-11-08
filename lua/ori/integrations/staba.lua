return function(opts, colors, p)
  p['StabaInsertMode'] = { fg = colors.high_green, bg = colors.shade_green, style = 'bold' }
  p['StabaVisualMode'] = { fg = colors.high_purple, bg = colors.shade_gray, style = 'bold' }
  p['StabaVisualBlockMode'] = { fg = colors.shade_gray, bg = colors.high_purple, style = 'bold' }
  p['StabaSelectMode'] = { fg = colors.bg, bg = colors.high_red, style = 'bold' }
  p['StabaReplaceMode'] = { fg = colors.high_red, bg = colors.shade_red, style = 'bold' }
  p['StabaCmdlineMode'] = { fg = colors.low_gray }
  p['StabaNC'] = { fg = colors.fg, bg = colors.nc }
  p['StabaStatus'] = { fg = colors.fg, sp = colors.border, style = 'underline' }
  p['StabaStatusNC'] = { fg = colors.low_gray, bg = colors.nc, sp = colors.border, style = 'underline,italic' }
  p['StabaStatusReverse'] = { fg = colors.bg, bg = colors.fg, sp = colors.fg }
  p['StabaTabFillReverse'] = { fg = colors.border, bg = colors.high_gray, sp = colors.high_gray }
  p['StabaTabs'] = { fg = colors.bg, bg = colors.high_purple, sp = colors.high_purple }
  p['StabaTabsReverse'] = { fg = colors.high_purple }
  p['StabaBuffers'] = { fg = colors.bg, bg = colors.gray, sp = colors.gray }
  p['StabaBuffersReverse'] = { fg = colors.gray }
  p['StabaSpecial'] = { fg = colors.high_olive, sp = colors.border }
  p['StabaReadonly'] = { fg = colors.low_gray, sp = colors.border }
  p['StabaModified'] = { fg = colors.high_cyan, sp = colors.border }
  p['StabaCopilot'] = { fg = colors.blue, sp = colors.border }
  p['StabaSignMarks'] = { fg = colors.green, bg = colors.shade_green, sp = colors.low_green, style = 'bold' }

  return p
end
