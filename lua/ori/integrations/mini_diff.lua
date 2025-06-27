return function(opts, colors, p)
  p['MiniDiffSignAdd'] = { fg = colors.high_blue }
  p['MiniDiffSignChange'] = { fg = colors.high_green }
  p['MiniDiffSignDelete'] = { fg = colors.high_red }
  p['MiniDiffOverAdd'] = { bg = colors.shade_blue }
  p['MiniDiffOverChange'] = { bg = colors.diff_text_bg }
  p['MiniDiffOverChangeBuf'] = { bg = colors.low_green }
  p['MiniDiffOverContext'] = { fg = colors.low_gray, bg = colors.shade_gray }
  p['MiniDiffOverContextBuf'] = { fg = colors.shade_gray, bg = colors.gray }
  p['MiniDiffOverDelete'] = { fg = colors.red, bg = colors.shade_red }

  return p
end
