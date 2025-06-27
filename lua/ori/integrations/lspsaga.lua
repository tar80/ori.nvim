return function(opts, colors, p)
  p['SagaTitle'] = { fg = colors.info }
  p['SagaBorder'] = { fg = colors.border, bg = colors.nc }
  p['SagaNormal'] = { fg = colors.fg, bg = colors.bg }
  p['SagaToggle'] = { fg = colors.high_purple }
  p['SagaBeacon'] = { bg = colors.high_red }
  p['SagaVirtLine'] = { fg = colors.low_purple }
  p['SagaSpinnerTitle'] = { fg = colors.match, bg = colors.nc }
  p['SagaSpinner'] = { fg = colors.hint, bg = colors.nc }
  p['SagaText'] = { fg = colors.fg }
  p['SagaSelect'] = { fg = colors.match }
  p['SagaSearch'] = { fg = colors.bg, bg = colors.high_orange }
  p['SagaFinderFname'] = { fg = colors.high_cyan }
  p['SagaDetail'] = { fg = colors.warn }
  p['SagaInCurrent'] = { fg = colors.low_purple }
  p['SageCount'] = { fg = colors.orange }
  p['SagaSep'] = { fg = colors.low_olive }
  p['ActionFix'] = { fg = colors.green }
  p['ActionPreviewNormal'] = { link = 'SagaNormal' }
  p['ActionPreviewBorder'] = { link = 'SagaBorder' }
  p['ActionPreviewTitle'] = { link = 'SagaTitle' }
  p['CodeActionText'] = { link = 'SagaText' }
  p['CodeActionNumber'] = { fg = colors.high_purple }
  p['HoverNormal'] = { link = 'SagaNormal' }
  p['HoverBorder'] = { fg = colors.border, bg = colors.bg }
  p['RenameBorder'] = { link = 'sagaBorder' }
  p['RenameNormal'] = { link = 'SagaNormal' }
  p['RenameMatch'] = { link = 'SagaSearch' }
  p['DiagnosticBorder'] = { link = 'SagaBorder' }
  p['DiagnosticNormal'] = { link = 'SagaNormal' }
  p['DiagnosticText'] = { link = 'SagaText' }
  p['DiagnosticShowNormal'] = { link = 'SagaNormal' }
  p['DiagnosticShowBorder'] = { link = 'sagaBorder' }
  p['SagaLightBulb'] = { fg = colors.high_olive }
  p['TerminalBorder'] = { link = 'SagaBorder' }
  p['TerminalNormal'] = {}
  p['SagaImpIcon'] = { fg = colors.warn }
  p['SagaWinbarSep'] = { fg = colors.purple }
  p['SagaWinbarFileName'] = { fg = colors.green }
  p['SagaWinbarFolderName'] = { fg = colors.blue }
  p['SagaWinbarFolder'] = { fg = colors.cyan }

  return p
end
