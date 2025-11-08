return function(opts, colors, p)
  -- p['BlinkCmpMenu'] = { link = 'Pmenu' }
  -- p['BlinkCmpMenuBorder'] = { link = 'Pmenu' }
  -- p['BlinkCmpMenuSelection'] = { link = 'PmenuSel' }
  -- p['BlinkCmpScrollBarThumb'] = { link = 'PmenuThumb' }
  -- p['BlinkCmpScrollBarGutter'] = { link = 'PmenuSbar' }
  p['BlinkCmpLabel'] = { fg = colors.gray }
  p['BlinkCmpLabelDeprecated'] = { fg = colors.red, sp = colors.red, style = opts.styles.deprecated }
  p['BlinkCmpLabelMatch'] = { fg = colors.match, style = 'bold' }
  p['BlinkCmpLabelDetail'] = { fg = '#FFFFFF' } ---TODO: check
  p['BlinkCmpLabelDescription'] = { link = 'PmenuExtra' }
  p['BlinkCmpSource'] = { fg = '#888800' } --TODO;check
  p['BlinkCmpGhostText'] = { fg = colors.low_gray, style = 'italic' }
  p['BlinkCmpDoc'] = { bg = colors.shade_blue }
  p['BlinkCmpDocBorder'] = { fg = colors.blue }
  p['BlinkCmpDocSeparator'] = { fg = colors.blue, colors.shade_blue }
  -- p['BlinkCmpDocCursorLine'] = { link = 'Visual' }
  -- p['BlinkCmpSignatureHelp'] = { link = 'NormalFloat' }
  -- p['BlinkCmpSignatureHelpBorder'] = { link = 'NormalFloat' }
  -- p['BlinkCmpSignatureHelpActiveParameter'] = { link = 'LspSignatureActiveParameter' }
  p['BlinkCmpKind'] = { fg = colors.low_gray }
  p['BlinkCmpKindOperator'] = { fg = colors.low_cyan }
  p['BlinkCmpKindReference'] = { fg = colors.low_red }
  p['BlinkCmpKindUnit'] = { fg = colors.low_green }
  p['BlinkCmpKindEvent'] = { fg = colors.low_blue }
  p['BlinkCmpKindColor'] = { fg = colors.low_red }
  p['BlinkCmpKindVariable'] = { fg =  colors.low_purple }
  p['BlinkCmpKindClass'] = { fg = colors.olow_live }
  p['BlinkCmpKindConstant'] = { fg = colors.low_gray }
  p['BlinkCmpKindConstructor'] = { fg = colors.low_olive }
  p['BlinkCmpKindEnum'] = { fg = colors.low_orange }
  p['BlinkCmpKindEnumMember'] = { fg = colors.low_orange }
  p['BlinkCmpKindField'] = { fg = colors.low_olive }
  p['BlinkCmpKindFile'] = { fg = colors.low_gray }
  p['BlinkCmpKindFolder'] = { fg = colors.low_cyan }
  p['BlinkCmpKindFunction'] = { fg = colors.low_blue }
  p['BlinkCmpKindInterface'] = { fg = colors.low_olive }
  p['BlinkCmpKindKeyword'] = { fg = colors.low_purple }
  p['BlinkCmpKindMethod'] = { fg = colors.low_blue }
  p['BlinkCmpKindModule'] = { fg = colors.low_cyan }
  p['BlinkCmpKindProperty'] = { fg = colors.low_olive }
  p['BlinkCmpKindSnippet'] = { fg = colors.green }
  p['BlinkCmpKindStruct'] = { fg = colors.low_olive }
  p['BlinkCmpKindText'] = { fg = colors.low_gray }
  p['BlinkCmpKindTypeParameter'] = { fg = colors.low_cyan }
  p['BlinkCmpKindValue'] = { fg = colors.low_purple }
  p['BlinkCmpKindCodeum'] = { fg = colors.purple }
  p['BlinkCmpKindCopilot'] = { fg = colors.green }
  p['BlinkCmpKindSupermaven'] = { fg = colors.orange }
  p['BlinkCmpKindTabNine'] = { fg = colors.blue }

  return p
end
