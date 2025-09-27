return function(opts, colors, p)
  p['GitSignsAdd'] = { fg = colors.high_blue } -- diff mode: Added line |diff.txt|
  p['GitSignsChange'] = { fg = colors.high_green } -- diff mode: Changed line |diff.txt|
  -- p['GitSignsChangeDelete'] = { link = 'GitSignsChange' } -- diff mode: Changed line |diff.txt|
  p['GitSignsDelete'] = { fg = colors.high_red } -- diff mode: Deleted line |diff.txt|
  -- p['GitSignsTopdelete'] = { link = 'GitSignsDelete' }
  -- p['GitSignsUntracked'] = { link = 'GitSignsAdd' }
  -- p['GitSignsAddNr'] = { link = 'GitSignsAddNr' }
  -- p['GitSignsChangeNr'] = { link = 'GitSignsChange' }
  -- p['GitSignsDeleteNr'] = { link = 'GitSignsDelete' }
  -- p['GitSignsChangeDeleteNr'] = { link = 'GitSignsChangeNr' }
  -- p['GitSignsTopdeleteNr'] = { link = 'GitSignsDeleteNr' }
  -- p['GitSignsUntracked'] = { link = 'GitSignsAddNr' }
  p['GitSignsAddLn'] = { link = 'DiffAdd' }
  p['GitSignsChangeLn'] = { link = 'DiffChange' }
  -- p['GitSignsChangeDeleteLn'] = { link = 'GitSignsChangeLn' }
  p['GitSignsUntrackedLn'] = { link = 'DiffText' }
  p['GitSignsAddCul'] = { fg = colors.bg, bg = colors.high_blue }
  p['GitSignsChangeCul'] = { fg = colors.bg, bg = colors.high_green }
  p['GitSignsDeleteCul'] = { fg = colors.bg, bg = colors.high_red }
  p['GitSignsAddPreview'] = { fg = colors.cyan }
  p['GitSignsDeletePreview'] = { fg = colors.red }
  p['GitSignsCurrentLineBlame'] = { fg = colors.low_purple, bg = colors.shade_purple, style = opts.styles.virtualtext }
  p['GitSignsAddInline'] = { bg = colors.shade_cyan }
  p['GitSignsChangeInline'] = { bg = colors.shade_green }
  p['GitSignsDeleteInline'] = { bg = colors.shade_red }
  -- p['GitSignsAddLnInline'] = { link = 'GitSignsAddInline' }
  -- p['GitSignsChangeLnInline'] = { link = 'GitSignsChangeInline' }
  -- p['GitSignsDeleteLnInline'] = { link = 'GitSignsDeleteInline' }
  p['GitSignsDeleteVirtLn'] = { link = 'DiffDelete' }
  -- p['GitSignsDeleteVirtLnInline'] = { link = 'GitSignsDeleteVirtLn' }
  -- p['GitSignsDeleteVirtLnum'] = { link = 'GitSignsDeleteVirtLn' }
  p['GitSignsStagedAdd'] = { fg = colors.high_blue, bg = colors.shade_blue, style = 'bold' }
  p['GitSignsStagedChange'] = { fg = colors.high_green, bg = colors.shade_green, style = 'bold' }
  p['GitSignsStagedDelete'] = { fg = colors.high_red, bg = colors.shade_red, style = 'bold' }

  return p
end
