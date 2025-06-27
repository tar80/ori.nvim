return function(opts, colors, p)
  -- p['NotifyBackground'] = { bg = '#000000' }
  p['NotifyERRORBorder'] = { fg = colors.error }
  p['NotifyWARNBorder'] = { fg = colors.warn }
  p['NotifyINFOBorder'] = { fg = colors.info }
  p['NotifyDEBUGBorder'] = { fg = colors.low_gray }
  p['NotifyTRACEBorder'] = { fg = colors.hint }
  p['NotifyERRORIcon'] = { fg = colors.error }
  p['NotifyWARNIcon'] = { fg = colors.warn }
  p['NotifyINFOIcon'] = { fg = colors.info }
  p['NotifyDEBUGIcon'] = { fg = colors.low_gray }
  p['NotifyTRACEIcon'] = { fg = colors.hint }
  p['NotifyERRORTitle'] = { fg = colors.error }
  p['NotifyWARNTitle'] = { fg = colors.warn }
  p['NotifyINFOTitle'] = { fg = colors.info }
  p['NotifyDEBUGTitle'] = { fg = colors.low_gray }
  p['NotifyTRACETitle'] = { fg = colors.hint }

  return p
end
