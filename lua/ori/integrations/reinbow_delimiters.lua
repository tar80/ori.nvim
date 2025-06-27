return function(opts, colors, p)
  if opts.integrations.rainbow_delimiters == 'high' then
    p['RainbowDelimiterRed'] = { fg = colors.high_red }
    p['RainbowDelimiterYellow'] = { fg = colors.high_olive }
    p['RainbowDelimiterBlue'] = { fg = colors.high_blue }
    p['RainbowDelimiterOrange'] = { fg = colors.high_orange }
    p['RainbowDelimiterGreen'] = { fg = colors.high_green }
    p['RainbowDelimiterViolet'] = { fg = colors.high_purple }
    p['RainbowDelimiterCyan'] = { fg = colors.high_cyan }
  elseif opts.integrations.rainbow_delimiters == 'low' then
    p['RainbowDelimiterRed'] = { fg = colors.low_red }
    p['RainbowDelimiterYellow'] = { fg = colors.low_olive }
    p['RainbowDelimiterBlue'] = { fg = colors.low_blue }
    p['RainbowDelimiterOrange'] = { fg = colors.low_orange }
    p['RainbowDelimiterGreen'] = { fg = colors.low_green }
    p['RainbowDelimiterViolet'] = { fg = colors.low_purple }
    p['RainbowDelimiterCyan'] = { fg = colors.low_cyan }
  end

  return p
end
