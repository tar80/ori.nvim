return function(opts, colors, p)
  p['DapBreakpoint'] = { fg = colors.low_red }
  p['DapBreakpointCondition'] = { fg = colors.purple }
  p['DapBreakpointRejected'] = { fg = colors.low_green }
  p['DapStopped'] = { fg = colors.low_red }

  return p
end
