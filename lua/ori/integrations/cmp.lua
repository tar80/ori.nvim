return function(opts, colors, p)
  p['CmpItemAbbr'] = { fg = colors.gray }
  p['CmpItemAbbrDefault'] = { fg = colors.gray, bg = colors.shade_orange }
  p['CmpItemAbbrDeprecated'] = { fg = colors.red, sp = colors.red, style = opts.styles.deprecated }
  p['CmpItemAbbrMatch'] = { fg = colors.match, style = 'bold' }
  p['CmpItemAbbrMatchDefault'] = { fg = colors.match, bg = colors.shade_red }
  p['CmpItemAbbrMatchFuzzy'] = { fg = colors.match, style = 'bold' }
  p['CmpItemAbbrMatchFuzzyDefault'] = { fg = colors.match, bg = colors.shade_green }
  p['CmpItemKind'] = { fg = colors.low_gray }
  p['CmpItemMenu'] = { fg = colors.gray }
  p['CmpItemKindClass'] = { fg = colors.olive }
  p['CmpItemKindConstant'] = { fg = colors.low_gray }
  p['CmpItemKindConstructor'] = { fg = colors.low_olive }
  p['CmpItemKindCopilot'] = { fg = colors.low_red }
  p['CmpItemKindEnum'] = { fg = colors.low_orange }
  p['CmpItemKindEnumMember'] = { fg = colors.low_orange }
  p['CmpItemKindField'] = { fg = colors.low_olive }
  p['CmpItemKindFile'] = { fg = colors.low_gray }
  p['CmpItemKindFolder'] = { fg = colors.low_cyan }
  p['CmpItemKindFunction'] = { fg = colors.low_blue }
  p['CmpItemKindInterface'] = { fg = colors.low_olive }
  p['CmpItemKindKeyword'] = { fg = colors.low_purple }
  p['CmpItemKindMethod'] = { fg = colors.low_blue }
  p['CmpItemKindModule'] = { fg = colors.low_cyan }
  p['CmpItemKindProperty'] = { fg = colors.low_olive }
  p['CmpItemKindSnippet'] = { fg = colors.green }
  p['CmpItemKindStruct'] = { fg = colors.low_olive }
  p['CmpItemKindText'] = { fg = colors.low_text }
  p['CmpItemKindTypeParameter'] = { fg = colors.low_cyan }
  p['CmpItemKindValue'] = { fg = colors.low_purple }
  p['CmpItemKindTabNine'] = { fg = colors.low_red }
  p['CmpGhostText'] = { fg = colors.selection, style = 'italic' }

  return p
end
