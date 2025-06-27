return function(opts, colors, p)
  p['DiffTextAdd'] = { bg = colors.diff_add }
  p['StderrMsg'] = { link = 'ErrorMsg' }
  p['StdoutMsg'] = { link = 'ModeMsg' }
end
