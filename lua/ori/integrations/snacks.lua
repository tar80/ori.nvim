return function(opts, colors, p)
  p['SnacksNormal'] = { link = 'Normal' }
  p['SnacksNormalNC'] = { link = 'Normal' }
  -- p['SnacksWinBar'] = { link = 'Title'}
  -- p['SnacksWinBarNC'] = { link = 'SnacksWinBar'}
  -- p['SnacksScratchKey'] = { link = 'DiagnosticVirtualText'}
  -- p['SnacksScratchDesc'] = { link = 'DiagnosticInfo'}
  -- p['SnacksNotifierFooterInfo'] = { link =  'DiagnosticInfo'}
  -- p['SnacksNotifierFooterWarn'] = { link =  'DiagnosticWarn'}
  -- p['SnacksNotifierFooterDebug'] = { link = 'DiagnosticHint'}
  -- p['SnacksNotifierFooterError'] = { link = 'DiagnosticError'}
  -- p['SnacksNotifierFooterTrace'] = { link = 'DiagnosticHint'}
  p['SnacksDashboardNormal'] = { link = 'Normal' }
  p['SnacksDashboardDesc'] = { link = 'Normal' }
  p['SnacksDashboardFile'] = { link = 'Normal' }
  p['SnacksDashboardDir'] = { link = 'Normal' }
  p['SnacksDashboardFooter'] = { fg = colors.low_gray }
  p['SnacksDashboardHeader'] = { fg = colors.shade_blue }
  p['SnacksDashboardIcon'] = { fg = colors.cyan }
  p['SnacksDashboardKey'] = { fg = colors.cyan }
  p['SnacksDashboardTerminal'] = { link = 'SnacksDashboardNormal' }
  p['SnacksDashboardSpecial'] = { fg = colors.high_purple }
  p['SnacksDashboardTitle'] = { fg = colors.bg, bg = colors.high_red }
  p['SnacksDebugPrint'] = { fg = colors.green }
  p['SnacksNotifierIconDebug'] = { fg = colors.high_green }
  p['SnacksNotifierTitleDebug'] = { fg = colors.high_green }
  p['SnacksNotifierFooterDebug'] = { link = 'SnacksDebugPrint' }
  p['SnacksNotifierBorderDebug'] = { link = 'SnacksDebugPrint' }
  p['SnacksIndent'] = { fg = colors.shade_gray }
  p['SnacksIndentScope'] = { fg = colors.low_orange }
  p['SnacksPickerBoxTitle'] = { fg = colors.gray }
  p['SnacksPickerCursorline'] = { fg = colors.nc }
  p['SnacksPickerGitDetached'] = { fg = colors.high_orange }
  p['SnacksPickerGitStatusStaged'] = { fg = colors.high_cyan }
  p['SnacksPickerGitStatusModified'] = { fg = colors.high_green }
  p['SnacksPickerGitStatusUnmerged'] = { fg = colors.high_red }
  p['SnacksPickerGitStatusCopied'] = { fg = colors.high_olive }
  p['SnacksPickerGitStatusRenamed'] = { fg = colors.high_purple }
  p['SnacksPickerInput'] = { link = 'Normal' }
  p['SnacksPickerInputCursorline'] = { link = 'Normal' }
  p['SnacksPickerInputTitle'] = { fg = colors.gray }
  p['SnacksPickerListTitle'] = { fg = colors.gray }
  p['SnacksPickerPickWin'] = { fg = colors.bg, bg = colors.high_purple }
  p['SnacksPickerPickWinCurrent'] = { fg = colors.bg, bg = colors.high_cyan }
  p['SnacksPickerPreviewTitle'] = { fg = colors.gray }
  p['SnacksPickerDir'] = { fg = colors.low_blue, style = opts.styles.comments }
  p['SnacksPickerFile'] = { fg = colors.blue }
  p['SnacksPickerMatch'] = { fg = colors.bg, bg = colors.match, style = 'bold' }
  p['SnacksPickerTree'] = { fg = colors.low_gray }

  return p
end
