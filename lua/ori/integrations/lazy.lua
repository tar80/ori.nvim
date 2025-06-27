return function(opts, colors, p)
  p['LazyButton'] = { fg = colors.gray, bg = colors.selection }
  p['LazyButtonActive'] = { fg = colors.bg, bg = colors.high_cyan, style = 'bold' }
  p['LazyComment'] = { fg = colors.purple }
  p['LazyCommit'] = { fg = colors.high_blue }
  p['LazyCommitIssue'] = { fg = colors.red }
  p['LazyCommitScope'] = { fg = colors.orange }
  p['LazyCommitType'] = { fg = colors.fg }
  p['LazyDimmed'] = { fg = colors.gray }
  p['LazyDir'] = { fg = colors.green }
  p['LazyH1'] = { fg = colors.high_cyan, style = 'bold' }
  p['LazyH2'] = { fg = colors.high_orange, style = 'bold' }
  p['LazyLocal'] = { fg = colors.high_green }
  p['LazyNoCond'] = { fg = colors.high_green }
  p['LazyNormal'] = { fg = colors.fg }
  p['LazyProgressDone'] = { fg = colors.high_cyan }
  p['LazyProgressTodo'] = { fg = colors.high_red }
  p['LazyProp'] = { fg = colors.fg, style = 'bold' }
  p['LazyReasonCmd'] = { fg = colors.low_olive }
  p['LazyReasonEvent'] = { fg = colors.low_purple }
  p['LazyReasonFt'] = { fg = colors.low_orange }
  p['LazyReasonImport'] = { fg = colors.low_cyan }
  p['LazyReasonKeys'] = { fg = colors.low_green }
  p['LazyReasonPlugin'] = { fg = colors.low_blue }
  p['LazyReasonRuntime'] = { fg = colors.low_cyan }
  p['LazyReasonSource'] = { fg = colors.low_cyan }
  p['LazyReasonStart'] = { fg = colors.low_red }
  p['LazySpecial'] = { fg = colors.high_cyan }
  p['LazyTaskError'] = { fg = colors.red }
  p['LazyTaskOutput'] = { fg = colors.olive }
  p['LazyUrl'] = { fg = colors.high_blue }
  p['LazyValue'] = { fg = colors.olive }

  return p
end
