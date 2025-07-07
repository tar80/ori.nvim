return function(opts, colors)
  return {
    DiffTextAdd = { bg = colors.diff_add },
    StderrMsg = { link = 'ErrorMsg' },
    StdoutMsg = { link = 'ModeMsg' },
  }
end
