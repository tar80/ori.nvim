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
  p['TroubleIconArray'] = { link = '@punctuation.bracket' }
  p['TroubleIconBoolean'] = { link = '@boolean' }
  p['TroubleIconClass'] = { link = '@type' }
  p['TroubleIconConstant'] = { link = '@constant' }
  p['TroubleIconConstructor'] = { link = '@constructor' }
  p['TroubleIconDirectory'] = { link = 'Special' }
  p['TroubleIconEnum'] = { link = '@lsp.type.enum' }
  p['TroubleIconEnumMember'] = { link = '@lsp.type.enumMember' }
  p['TroubleIconEvent'] = { link = 'Special' }
  p['TroubleIconField'] = { link = '@variable.member' }
  p['TroubleIconFile'] = { link = 'TroubleNormal' }
  p['TroubleIconFunction'] = { link = '@function' }
  p['TroubleIconInterface'] = { link = '@lsp.type.interface' }
  p['TroubleIconKey'] = { link = '@lsp.type.keyword' }
  p['TroubleIconMethod'] = { link = '@function.method' }
  p['TroubleIconModule'] = { link = '@module' }
  p['TroubleIconNamespace'] = { link = '@module' }
  p['TroubleIconNull'] = { link = '@constant.builtin' }
  p['TroubleIconNumber'] = { link = '@number' }
  p['TroubleIconObject'] = { link = '@constant' }
  p['TroubleIconOperator'] = { link = '@operator' }
  p['TroubleIconPackage'] = { link = '@module' }
  p['TroubleIconProperty'] = { link = '@property' }
  p['TroubleIconString'] = { link = '@string' }
  p['TroubleIconStruct'] = { link = '@lsp.type.struct' }
  p['TroubleIconTypeParameter'] = { link = '@lsp.type.typeParameter' }
  p['TroubleIconVariable'] = { link = '@variable' }
  p['TroubleIndent'] = { fg = colors.low_gray }
  p['TroubleIndentFoldClosed'] = { link = 'CursorLineNr' }
  p['TroubleIndentFoldOpen'] = { link = 'TroubleIndent' }
  p['TroubleIndentLast'] = { link = 'TroubleIndent' }
  p['TroubleIndentMiddle'] = { link = 'TroubleIndent' }
  p['TroubleIndentTop'] = { link = 'TroubleIndent' }
  p['TroubleIndentWs'] = { link = 'TroubleIndent' }

  return p
end
