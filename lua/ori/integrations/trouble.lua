return function(opts, colors, p)
  -- p['TroubleFile'] = { fg = colors.blue }
  -- p['TroubleCount'] = { fg = colors.purple }
  -- p['TroubleNormal'] = { fg = colors.fg }
  -- p['TroubleText'] = { fg = colors.green }
  -- p['TroubleLocation'] = { fg = colors.cyan }
  -- p['TroubleFoldIcon'] = { fg = colors.purple }
  -- p['TroubleIndent'] = { fg = colors.low_gray }
  -- p['TroubleTextError'] = { link = 'DiagnosticError' }
  -- p['TroubleTextWarning'] = { link = 'DiagnosticWarn' }
  -- p['TroubleTextInformation'] = { link = 'DiagnosticInformation' }
  -- p['TroubleTextHint'] = { link = 'DiagnosticHint' }
  p['TroubleNormal'] = { fg = colors.fg }
  p['TroubleNormalNC'] = { link = 'TroubleNormal' }
  p['TroublePos'] = { link = 'Comment' }
  p['TroublePreview'] = { link = 'IncSearch' }
  p['TroubleSource'] = { link = 'Comment' }
  p['TroubleText'] = { fg = colors.green }
  p['TroubleCount'] = { fg = colors.purple }
  p['TroubleDirectory'] = { link = 'Directory' }
  p['TroubleFileName'] = { link = 'Directory' }
  p['TroubleIconArray'] = { fg = colors.low_olive }
  p['TroubleIconBoolean'] = { link = 'Boolean' }
  p['TroubleIconClass'] = { link = 'Type' }
  p['TroubleIconConstant'] = { link = 'Constant' }
  p['TroubleIconConstructor'] = { fg = colors.olive }
  p['TroubleIconDirectory'] = { link = 'Special' }
  p['TroubleIconEnum'] = { link = '@lsp.type.enum' }
  p['TroubleIconEnumMember'] = { link = '@lsp.type.enumMember' }
  p['TroubleIconEvent'] = { link = 'Special' }
  p['TroubleIconField'] = { fg = colors.blue, style = opts.styles.variables }
  p['TroubleIconFile'] = { link = 'TroubleNormal' }
  p['TroubleIconFunction'] = { link = 'Function' }
  p['TroubleIconInterface'] = { link = '@lsp.type.interface' }
  p['TroubleIconKey'] = { link = '@lsp.type.keyword' }
  p['TroubleIconMethod'] = { link = 'Function' }
  p['TroubleIconModule'] = { fg = colors.olive }
  p['TroubleIconNamespace'] = { fg = colors.olive }
  p['TroubleIconNull'] = { fg = colors.cyan }
  p['TroubleIconNumber'] = { link = 'Number' }
  p['TroubleIconObject'] = { link = 'Constant' }
  p['TroubleIconOperator'] = { link = 'Operator' }
  p['TroubleIconPackage'] = { fg = colors.olive }
  p['TroubleIconProperty'] = { fg = colors.blue }
  p['TroubleIconString'] = { fg = colors.green, style = opts.styles.strings }
  p['TroubleIconStruct'] = { link = '@lsp.type.struct' }
  p['TroubleIconTypeParameter'] = { link = '@lsp.type.typeParameter' }
  p['TroubleIconVariable'] = { fg = colors.fg, style = opts.styles.variables }
  p['TroubleIndent'] = { fg = colors.low_gray }
  p['TroubleIndentFoldClosed'] = { link = 'CursorLineNr' }
  p['TroubleIndentFoldOpen'] = { link = 'TroubleIndent' }
  p['TroubleIndentLast'] = { link = 'TroubleIndent' }
  p['TroubleIndentMiddle'] = { link = 'TroubleIndent' }
  p['TroubleIndentTop'] = { link = 'TroubleIndent' }
  p['TroubleIndentWs'] = { link = 'TroubleIndent' }

  return p
end
