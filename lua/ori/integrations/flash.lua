return function(opts, colors, p)
  p['FlashBackdrop'] = { fg = colors.low_gray }
  p['FlashLabel'] = { fg = colors.bg, bg = colors.match, style = 'bold' }
  p['FlashCurrent'] = { fg = colors.high_red, sp = colors.bg, style = 'reverse' }
  p['FlashMatch'] = { fg = colors.matchsub, sp = colors.matchsub, style = 'underline' }
  p['FlashPrompt'] = { fg = colors.match }
  p['FlashPromptIcon'] = { fg = colors.matchsub }
  -- p['FlashCursor'] = {}

  return p
end
