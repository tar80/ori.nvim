return function(opts, colors, p)
  p['QuickFixText'] = { fg = colors.fg }
  p['QuickFixTextInvalid'] = { fg = colors.red }
  p['QuickFixLineNr'] = { fg = colors.cyan }
  p['QuickFixFilename'] = { fg = colors.blue }
  p['QuickFixFilenameInvalid'] = { fg = colors.low_blue }
  p['QuickFixHeaderHard'] = { fg = colors.purple }
  p['QuickFixHeaderSoft'] = { fg = colors.low_purple }

  return p
end
